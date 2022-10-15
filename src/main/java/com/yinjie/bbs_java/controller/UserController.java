package com.yinjie.bbs_java.controller;



import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;


import com.yinjie.bbs_java.annotation.Systemlog;
import com.yinjie.bbs_java.common.Result;
import com.yinjie.bbs_java.common.ResultCodeMessage;
import com.yinjie.bbs_java.dto.ChildComment;
import com.yinjie.bbs_java.dto.ParComment;
import com.yinjie.bbs_java.dto.UserDto;
import com.yinjie.bbs_java.entity.User;
import com.yinjie.bbs_java.service.ChildCommentService;
import com.yinjie.bbs_java.service.ParCommentService;
import com.yinjie.bbs_java.service.UserService;

import com.yinjie.bbs_java.util.JwtUtils;
import com.yinjie.bbs_java.util.SaltUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import com.yinjie.bbs_java.util.qiniuyun.service.UploadPictureService;

import java.io.IOException;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Jack
 * @since 2022-03-07 10:31:02
 */
@RestController
@RequestMapping("/user")
@Api(tags = "用户接口")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private UploadPictureService uploadPicrureService;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private ParCommentService parCommentService;

    @Autowired
    private ChildCommentService childCommentService;

    @Systemlog(desc = "用户进行了登录")
    @PostMapping("/login")
    @ApiOperation(value = "登录接口",notes = "对用户登录进行控制")
    public Result<UserDto> login(@RequestBody @Valid UserDto userDto, HttpServletResponse response){
        User user = userService.selectUserByEmail(userDto.getEmail());
        //将用户输入的密码转化成md5加上盐再进行与数据库比较
        Md5Hash md5Hash = new Md5Hash(userDto.getPassword(),user.getSalt());
        System.out.println(md5Hash.toHex());
        if (StringUtils.isEmpty(user)){
            return new Result<>(ResultCodeMessage.NOT_EXIST_USER);
        }
        if (!user.getPassword().equals(md5Hash.toHex())){
            return new Result<>(ResultCodeMessage.PASSWORD_ERROR);
        }
        String jwt = jwtUtils.generateToken(user.getId());
        response.setHeader("Authorization", jwt);
        response.setHeader("Access-Control-Expose-Headers", "Authorization");
        userDto.setAvatar(user.getAvatar());
        userDto.setId(user.getId());
        userDto.setRole(user.getRole());
        userDto.setEmail(user.getEmail());
        userDto.setCreateTime(user.getCreateTime());
        userDto.setDescribe(user.getDescribe());
        userDto.setNickName(user.getNickName());
        redisTemplate.opsForValue().set("userId",userDto.getId());
        return new Result<UserDto>(userDto);
    }

    @Systemlog(desc = "用户进行了注册")
    @ApiOperation(value = "注册接口",notes = "用户注册")
    @PostMapping("/register")
    public Result register(@Valid @RequestBody User user, HttpServletResponse response){
        //首先检查该邮箱账号是否已注册
        User user1 = userService.getOne(new QueryWrapper<User>().eq("email", user.getEmail()));
        if (!StringUtils.isEmpty(user1)){
            return new Result<>(ResultCodeMessage.EXIST_USER);
        }
        //采用md5和随机盐对密码进行加密
        String salt = SaltUtil.getSalt(6);
        user.setSalt(salt);
        Md5Hash md5Hash = new Md5Hash(user.getPassword(),salt);
        user.setPassword(md5Hash.toHex());
        //默认的头像
        user.setAvatar("https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png");
        try {
            userService.save(user);
            User user2 = userService.selectUserByEmail(user.getEmail());
            UserDto userDto = new UserDto();
            userDto.setAvatar(user.getAvatar());
            userDto.setId(user.getId());
            userDto.setRole(user.getRole());
            userDto.setEmail(user.getEmail());

            String jwt = jwtUtils.generateToken(user.getId());
            response.setHeader("Authorization", jwt);
            response.setHeader("Access-Control-Expose-Headers", "Authorization");
            return new Result(userDto);
        } catch (Exception e) {
            return new Result(e);
        }

    }

    // 退出
    @Systemlog(desc = "用户退出了系统")
    @ApiOperation(value = "退出接口",notes = "用户退出")
    @GetMapping("/logout")
    @RequiresAuthentication
    public Result logout() {
        redisTemplate.delete("userId");
        SecurityUtils.getSubject().logout();
        return new Result();
    }

    //修改个人信息
    @Systemlog(desc = "用户进修改了个人信息")
    @ApiOperation(value = "修改个人信息接口",notes = "修改个人信息")
    @RequiresAuthentication
    @PostMapping("/changePerson")
    public Result changePerson(@RequestBody UserDto userDto){
        UpdateWrapper<User> userUpdateWrapper = new UpdateWrapper<>();
        userUpdateWrapper.set("avatar",userDto.getAvatar());
        userUpdateWrapper.set("`nick_name`",userDto.getNickName());
        userUpdateWrapper.set("`describe`",userDto.getDescribe());
        userService.update(userUpdateWrapper.eq("id",userDto.getId()));

        //修改父评论和子评论中的头像和昵称
        UpdateWrapper<ParComment> parCommentUpdateWrapper = new UpdateWrapper<>();
        parCommentUpdateWrapper.set("user_avatar",userDto.getAvatar());
        parCommentUpdateWrapper.set("nick_name",userDto.getNickName());
        parCommentService.update(parCommentUpdateWrapper.eq("user_id",userDto.getId()));

        //修改子评论中的用户头像和昵称
        UpdateWrapper<ChildComment> childCommentUpdateWrapper = new UpdateWrapper<>();

        childCommentUpdateWrapper
                .set("reply_avatar",userDto.getAvatar())
                .set("reply_nick_name",userDto.getNickName())
                .eq("reply_id",userDto.getId());
        childCommentService.update(childCommentUpdateWrapper);
        childCommentUpdateWrapper.clear();
        childCommentUpdateWrapper
                .set("reply_reply_nick_name",userDto.getNickName())
                .eq("reply_reply_id",userDto.getId());
        childCommentService.update(childCommentUpdateWrapper);

        return new Result(ResultCodeMessage.SUCCESS);
    }


    //图片上传
    @Systemlog(desc = "用户上传图片文件")
    @ApiOperation(value = "图片上传接口",notes = "用于上传图片文件")
    @PostMapping("/uploadAvatar")
    public Result uploadAvatar(MultipartFile file) throws IOException {
        String avatarUrl = uploadPicrureService.uploadPicture(file);
        return new Result(avatarUrl);
    }

}
