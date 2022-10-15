package com.yinjie.bbs_java.controller.admin;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.yinjie.bbs_java.common.Result;
import com.yinjie.bbs_java.common.ResultCodeMessage;
import com.yinjie.bbs_java.entity.Article;
import com.yinjie.bbs_java.entity.ArticleType;
import com.yinjie.bbs_java.entity.Message;
import com.yinjie.bbs_java.service.ArticleService;
import com.yinjie.bbs_java.service.ArticleTypeService;
import com.yinjie.bbs_java.service.MessageService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.security.MessageDigest;
import java.util.List;

@RestController
@RequestMapping("/audit")
@Api(tags = "管理员文章管理接口")
public class ArticleAuditController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ArticleTypeService articleTypeService;

    @Autowired
    private MessageService messageService;

    @ApiOperation(value = "单个审核接口",notes = "管理员单个审核文章的接口")
    @RequiresAuthentication
    @GetMapping("/ArticleAudit")
    public Result ArticleAudit(Integer articleId,String userid,Integer status){
        System.out.println("审核的文章id"+articleId+"  "+"审核状态"+status);
        try {
            boolean update = articleService.update(new UpdateWrapper<Article>().set("status", status).eq("id", articleId));
            //发送消息给用户，
            Article article = articleService.getOne(new QueryWrapper<Article>().eq("id", articleId));
            Message message = new Message();
            message.setOriId(userid);
            message.setDesId(article.getAuthorId());
            if (status == 0){
                message.setContent("审核通过了你的文章");
            }else {
                message.setContent("你的文章审核未通过");
            }
            message.setMesType(1);
            message.setStatus(0);
            System.out.println(message);
            messageService.save(message);
            List<Article> articleList = articleService.selectALLArticle();
            return new Result(articleList);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(e);
        }
    }

    @ApiOperation(value = "批量审核接口",notes = "管理员批量审核文章的接口")
    @RequiresAuthentication
    @PostMapping("/batchAudit")
    public Result batchAudit(@RequestBody JSONObject auditList, Integer status){
        Integer status1 = auditList.getObject("status", Integer.class);
        JSONArray auditList1 = auditList.getJSONArray("auditList");
        List<Article> articleList1 = auditList1.toJavaList(Article.class);
        for (Article article : articleList1){
            article.setStatus(status1);
        }
        try {
            boolean update = articleService.updateBatchById(articleList1);
            List<Article> articleList = articleService.selectALLArticle();
            return new Result(articleList);
        }catch (Exception e){
            return new Result(e);
        }
    }

    @ApiOperation(value = "批量删除接口",notes = "管理员批量删除文章的接口")
    @RequiresAuthentication
    @PostMapping("/batchDel")
    public Result batchDel(@RequestBody JSONObject delList){
        JSONArray delList1 = delList.getJSONArray("delList");
        List<Article> articleList1 = delList1.toJavaList(Article.class);
        try {
            boolean update = articleService.removeBatchByIds(articleList1);
            List<Article> articleList = articleService.selectALLArticle();
            return new Result(articleList);
        }catch (Exception e){
            return new Result(e);
        }
    }

    @ApiOperation(value = "添加类型接口",notes = "管理员添加文章类型")
    @RequiresAuthentication
    @GetMapping ("/addType")
    public Result addType(String type,String creatorId){
        ArticleType articleType = new ArticleType();
        articleType.setType(type);
        articleType.setCreatorId(creatorId);
        articleType.setStatus(0);
        articleType.setIsDelete(0);
        try {
            boolean save = articleTypeService.save(articleType);
            List<ArticleType> articleTypes = articleTypeService.list();
            return new Result(articleTypes);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(e);
        }
    }


    @ApiOperation(value = "删除类型接口",notes = "管理员单个删除类型接口")
    @RequiresAuthentication
    @GetMapping("/deleteArticleType")
    public Result deleteArticleType(Integer tid){
        boolean b = articleTypeService.removeById(tid);
        if (b){
            List<ArticleType> list = articleTypeService.list();
            return new Result(list);
        }else {
            return new Result(ResultCodeMessage.FAIL);
        }
    }


    @ApiOperation(value = "批量删除类型接口",notes = "管理员批量删除文章类型的接口")
    @RequiresAuthentication
    @PostMapping("/batchDelType")
    public Result batchDelType(@RequestBody JSONObject delList){
        JSONArray delList1 = delList.getJSONArray("delList");
        List<ArticleType> articleList1 = delList1.toJavaList(ArticleType.class);
        try {
            boolean update = articleTypeService.removeBatchByIds(articleList1);
            List<ArticleType> articleList = articleTypeService.list();
            return new Result(articleList);
        }catch (Exception e){
            return new Result(e);
        }
    }

    @ApiOperation(value = "禁用文章类型接口",notes = "暂时禁止使用文章类型")
    @RequiresAuthentication
    @GetMapping("/disableArticleType")
    public Result disableArticleType(Integer id, Integer status){
        try {
            boolean update = articleTypeService.update(new UpdateWrapper<ArticleType>().set("status", status).eq("id", id));
            if (update){
                List<ArticleType> list = articleTypeService.list();
                return new Result(list);
            }else {
                return new Result(ResultCodeMessage.FAIL);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(e);
        }
    }

}
