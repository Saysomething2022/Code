package com.yinjie.bbs_java.controller;

import com.yinjie.bbs_java.annotation.Systemlog;
import com.yinjie.bbs_java.common.Result;
import com.yinjie.bbs_java.dto.UserDto;
import com.yinjie.bbs_java.entity.Article;
import com.yinjie.bbs_java.service.ArticleService;
import com.yinjie.bbs_java.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/person")
@Api(tags = "个人主页接口")
public class PersonController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private UserService userService;

    @Systemlog(desc = "用户查看了自己发布的文章")
    @RequiresAuthentication
    @GetMapping("/personArticle")
    @ApiOperation(value = "查询个人发布的文章",notes = "个人文章")
    public Result SelectPersonArticle(String uid, @RequestParam(value = "category",defaultValue = "article") String category){
        System.out.println(uid);
        List<Article> articleList = articleService.selectPersonArticle(uid,category);
        return new Result(articleList);
    }


    @Systemlog(desc = "用户查看了关注我的人和我关注的人")
    @RequiresAuthentication
    @GetMapping("/myfocus")
    @ApiOperation(value = "关注的人和关注我的人接口",notes = "显示我关注的，和关注我的人")
    public Result SelectMyFocus(String uid){
        HashMap<String, List<UserDto>> map = new HashMap<>();
        //我关注的
        List<UserDto> MyFocus = userService.SelectMyFocus(uid);
        //关注我的
        List<UserDto> MyFocused = userService.SelectMyFocused(uid);
        map.put("MyFocus",MyFocus);
        map.put("MyFocused",MyFocused);
        return new Result(map);
    }

    @Systemlog(desc = "用户查看了自己收藏的文章")
    @RequiresAuthentication
    @GetMapping("/myCollection")
    @ApiOperation(value = "我收藏的文章",notes = "展示我收藏的文章")
    public Result SelectMyCollection(String uid){
        List<Article> articleList = articleService.selectMyCollection(uid);
        return new Result(articleList);
    }


}
