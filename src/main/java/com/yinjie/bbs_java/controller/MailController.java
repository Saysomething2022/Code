package com.yinjie.bbs_java.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yinjie.bbs_java.annotation.Systemlog;
import com.yinjie.bbs_java.common.Result;
import com.yinjie.bbs_java.common.ResultCodeMessage;
import com.yinjie.bbs_java.email.servive.MailService;
import com.yinjie.bbs_java.entity.User;
import com.yinjie.bbs_java.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@Slf4j
@RestController
@RequestMapping("/mail")
@Api(tags = "发送邮件接口")
public class MailController {
    @Autowired
    private MailService mailService;

    @Autowired
    private UserService userService;

    @ApiOperation(value = "验证码接口",notes = "获取验证码")
    @RequestMapping(value = "/getCheckCode", method = RequestMethod.POST)
    public Result<String> getCheckCode(@RequestBody User user){
        User user1 = userService.getOne(new QueryWrapper<User>().eq("email", user.getEmail()));
        log.info("进入方法getCheckCode:"+user.toString());
        String checkCode = String.valueOf(new Random().nextInt(899999) + 100000);
        String message = "您的注册验证码为："+checkCode;
        try {
            mailService.sendSimpleMail(user.getEmail(), "注册验证码", message);
        }catch (Exception e){
            return new Result(e);
        }

        return new Result<>(checkCode);
    }
}
