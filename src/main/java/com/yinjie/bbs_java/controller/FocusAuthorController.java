package com.yinjie.bbs_java.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yinjie.bbs_java.annotation.Systemlog;
import com.yinjie.bbs_java.common.Result;
import com.yinjie.bbs_java.common.ResultCodeMessage;
import com.yinjie.bbs_java.common.WebSocketServer;
import com.yinjie.bbs_java.entity.FocusAuthor;
import com.yinjie.bbs_java.entity.Message;
import com.yinjie.bbs_java.entity.UserCollection;
import com.yinjie.bbs_java.service.FocusAuthorService;
import com.yinjie.bbs_java.service.MessageService;
import com.yinjie.bbs_java.service.UserCollectionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.HashMap;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Jack
 * @since 2022-03-13 17:01:47
 */
@RestController
@RequestMapping("/focus_author")
@Api(tags = "关注接口")
public class FocusAuthorController {

    @Autowired
    private FocusAuthorService focusAuthorService;

    @Autowired
    private UserCollectionService userCollectionService;

    @Autowired
    private MessageService messageService;

    @Systemlog(desc = "用户关注了别人")
    @ApiOperation(value = "点击关注",notes = "在文章详情的页面，选择关注作者")
    @GetMapping()
    public Result focus_author(String focusId,String focusedId, boolean isfocus){
        if (focusedId.equals(focusId)){
            return new Result(ResultCodeMessage.NOT_FOCUS_OWN);
        }
        FocusAuthor focusAuthor = new FocusAuthor();
        focusAuthor.setFocusId(focusId);
        focusAuthor.setFocusedId(focusedId);
        System.out.println(focusAuthor);
        if (isfocus){
            System.out.println(focusAuthor);
            focusAuthorService.save(focusAuthor);
            try {
                WebSocketServer.sendInfo("有人关注了你！",focusedId);
                Message message = new Message();
                message.setOriId(focusId);
                message.setDesId(focusedId);
                message.setContent("关注了你");
                message.setMesType(0);
                message.setStatus(0);
                messageService.save(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            HashMap<String, String> map = new HashMap<>();
            map.put("focus_id",focusAuthor.getFocusId());
            map.put("focused_id",focusAuthor.getFocusedId());
            focusAuthorService.remove(new QueryWrapper<FocusAuthor>().allEq(map));
        }
        return new Result(ResultCodeMessage.SUCCESS);
    }

    @ApiOperation(value = "查询是否关注作者和收藏文章的接口",notes = "用来判断关注和收藏的样式是否是已关注..")
    @GetMapping("/isFocusOrCollection")
    public Result isFocusOrCollection(Integer articleId,String authorId,String focusId){
        boolean isFocus = false;
        boolean isCollection = false;
        //查询用户是否关注该文章
        HashMap<String, Object> map = new HashMap<>();
        System.out.println(focusId);
        if (focusId == null || focusId == ""){
            map.put("isFocus",isFocus);
            map.put("isCollection",isCollection);
            return new Result(map);
        }
        map.put("focus_id",focusId);
        map.put("focused_id",authorId);
        FocusAuthor focusAuthor = focusAuthorService.getOne(new QueryWrapper<FocusAuthor>().allEq(map));
        System.out.println("=================有没有======"+focusAuthor);
        if (focusAuthor != null){
            isFocus = true;
        }
        //查询用户是否收藏该文章
        map.clear();
        map.put("article_id",articleId);
        map.put("user_id",focusId);
        UserCollection userCollection = userCollectionService.getOne(new QueryWrapper<UserCollection>().allEq(map));
        if (userCollection != null){
            isCollection = true;
        }
        map.clear();
        map.put("isFocus",isFocus);
        map.put("isCollection",isCollection);
        return new Result(map);
    }
}
