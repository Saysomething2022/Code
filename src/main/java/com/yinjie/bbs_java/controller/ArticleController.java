package com.yinjie.bbs_java.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yinjie.bbs_java.annotation.Systemlog;
import com.yinjie.bbs_java.common.Result;
import com.yinjie.bbs_java.common.ResultCodeMessage;
import com.yinjie.bbs_java.common.WebSocketServer;
import com.yinjie.bbs_java.dto.Achievement;
import com.yinjie.bbs_java.dto.ChildComment;
import com.yinjie.bbs_java.dto.ParComment;
import com.yinjie.bbs_java.dto.vo.ArticleFilter;
import com.yinjie.bbs_java.dto.vo.ArticleTypeFilter;
import com.yinjie.bbs_java.entity.*;
import com.yinjie.bbs_java.service.*;
import com.yinjie.bbs_java.util.filter.WordFilter;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Jack
 * @since 2022-03-09 15:57:10
 */
@RestController
@RequestMapping("/article")
@Api(tags = "主页文章接口")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ArticleTypeService articleTypeService;

    @Autowired
    private ParCommentService parCommentService;

    @Autowired
    private ChildCommentService childCommentService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserCollectionService userCollectionService;

    @Autowired
    private MessageService messageService;


    @ApiOperation(value = "主页接口",notes = "展示主页列表")
    @GetMapping()
    public Result<IPage> index(@RequestParam(defaultValue = "article") String category,
                                  Integer type_id,
                               @RequestParam(defaultValue = "1",name = "page") Integer page,
                               String title){
        Page<Article> page1 = new Page<>(page,10);
        IPage<Article> page2 = articleService.selectArticlePage(page1, category, type_id,title);
        return new Result<IPage>(page2);
    }

    @ApiOperation(value = "后台文章类型接口",notes = "提供类型列表")
    @GetMapping("/typeList")
    public Result<List<ArticleType>> selectTypes(ArticleTypeFilter articleTypeFilter){
        try {
            QueryWrapper<ArticleType> articleTypeQueryWrapper = new QueryWrapper<>();
            if (articleTypeFilter != null){
                if (articleTypeFilter.getType() != null && articleTypeFilter.getType() != ""){
                    articleTypeQueryWrapper.eq("type",articleTypeFilter.getType());
                }
                if (articleTypeFilter.getCreatorId() != null){
                    articleTypeQueryWrapper.eq("creator_id",articleTypeFilter.getCreatorId());
                }
                if (articleTypeFilter.getStartTime() != null){
                    articleTypeQueryWrapper.gt("type",articleTypeFilter.getType());
                }
                if (articleTypeFilter.getEndTime() != null){
                    articleTypeQueryWrapper.eq("type",articleTypeFilter.getType());
                }
            }
            List<ArticleType> typeLists = articleTypeService.list(articleTypeQueryWrapper);
            return new Result<List<ArticleType>>(typeLists);
        } catch (Exception e) {
            return new Result<>(e);
        }
    }

    @ApiOperation(value = "前台文章类型接口",notes = "提供类型列表")
    @GetMapping("/typeList1")
    public Result<List<ArticleType>> selectTypes(){
        try {
            List<ArticleType> typeLists = articleTypeService.list(new QueryWrapper<ArticleType>().eq("status",0));
            return new Result<List<ArticleType>>(typeLists);
        } catch (Exception e) {
            return new Result<>(e);
        }
    }

    @Systemlog(desc = "用户发布了文章")
    @ApiOperation(value = "发布文章接口",notes = "发布文章")
    @RequiresAuthentication
    @PostMapping("/post")
    public Result postArticle(@Valid @RequestBody Article article){
        try {
            String context = article.getContent() + article.getTitle();
            //敏感词过滤
            String sensitiveWord = WordFilter.replaceWords(context);
            List<String> sensitiveWord1 = WordFilter.getSensitiveWord(context, 1);
            System.out.println(sensitiveWord1);
            if (!sensitiveWord1.isEmpty()){
                return new Result(ResultCodeMessage.EXIST_SENSITIVE_WORDS,sensitiveWord1);
            }
            //默认都是未审核
            article.setStatus(1);
            articleService.saveOrUpdate(article);
            return new Result(ResultCodeMessage.SUCCESS);
        } catch (Exception e) {
            return new Result(e);
        }
    }

    @Systemlog(desc = "浏览文章详细")
    @ApiOperation(value = "文章详情",notes = "通过id查询文章详情")
    @GetMapping("/articleDetail")
    public Result selectArticleById(Integer articleId){
        Article article = articleService.selectArticleById(articleId);
        return new Result(article);
    }

    @Systemlog(desc = "查询我的成就")
    @ApiOperation(value = "我的成就接口",notes = "查询我的成就")
    @RequiresAuthentication
    @GetMapping("/achievement")
    public Result selectAchievement(String authorId){
        HashMap<String, String> map = new HashMap<>();
        map.put("author_id",authorId);
        map.put("category","article");
        long articleCount = articleService.count(new QueryWrapper<Article>().allEq(map));
        map.clear();
        map.put("author_id",authorId);
        map.put("category","answer");
        long answerCount = articleService.count(new QueryWrapper<Article>().allEq(map));
        Article article = articleService.getOne(new QueryWrapper<Article>().select("sum(approves) as approvesCount").eq("author_id",authorId));
        Achievement achievement = new Achievement();
        achievement.setArticleCount(articleCount);
        achievement.setAnswerCount(answerCount);
        if (article != null){
            achievement.setApproves(article.getApprovesCount());
        }else {
            achievement.setApproves(0l);
        }
        return new Result(achievement);
    }


    @Systemlog(desc = "用户删除了自己的文章")
    @RequiresAuthentication
    @ApiOperation(value = "删除文章接口",notes = "删除自己的文章")
    @GetMapping("/deleteArticle")
    public Result deleteArticle(Integer articleId){
        try {
            articleService.removeById(articleId);
            return new Result(ResultCodeMessage.SUCCESS);
        } catch (Exception e) {
            return new Result(e);
        }
    }

    @Systemlog(desc = "用户点赞了文章")
    @RequiresAuthentication
    @ApiOperation(value = "点赞接口",notes = "点赞和取消点赞")
    @GetMapping("/approve")
    public Result approve(Integer id,boolean good){
        Article article = articleService.getById(id);
        UpdateWrapper<Article> articleUpdateWrapper = new UpdateWrapper<>();
        articleUpdateWrapper.eq("id",id);
        if (good){
            articleUpdateWrapper.set("approves",article.getApproves() + 1);
            articleService.update(articleUpdateWrapper);
        }else {
            articleUpdateWrapper.set("approves",article.getApproves() - 1);
            articleService.update(articleUpdateWrapper);
        }
        return new Result(ResultCodeMessage.SUCCESS);
    }

    @ApiOperation(value = "评论接口",notes = "根据文章id查出该文章所有的评论")
    @GetMapping("/selectComment")
    public Result selectComment(Integer id){
        List<ParComment> parComments = articleService.selectComment(id);
        parComments.forEach(s -> System.out.println(s));
        return new Result(parComments);
    }

    @Systemlog(desc = "用户进行了评论")
    @RequiresAuthentication
    @ApiOperation(value = "父评论接口",notes = "一级评论的添加")
    @PostMapping("/addParComment")
    public Result addParComment(@Valid @RequestBody ParComment parComment){
        Article article = articleService.getById(parComment.getArticleId());
        User user = userService.getById(parComment.getUserId());
        try {
                WebSocketServer.sendInfo(user.getEmail()+"用户评论了你的文章",article.getAuthorId());
            Message message = new Message();
            message.setOriId(parComment.getUserId());
            message.setDesId(user.getId());
            message.setContent("评论了你");
            message.setMesType(0);
            message.setStatus(0);
            messageService.save(message);
        } catch (IOException e) {
            e.printStackTrace();
        }
        parCommentService.save(parComment);

        //评论数加一
        articleService.update(new UpdateWrapper<Article>().set("comments",article.getComments() + 1).eq("id",article.getId()));
        return new Result(ResultCodeMessage.SUCCESS);
    }

    @Systemlog(desc = "用户进行了评论")
    @RequiresAuthentication
    @ApiOperation(value = "子评论接口",notes = "二级评论的添加")
    @PostMapping("/addChildComment")
    public Result addChildComment(@Valid @RequestBody ChildComment childComment){
        //给被评论者发一个提示信息，提示他的评论被别人回复了
        try {
            System.out.println("是否有回复者，id为========》"+childComment.getReplyReplyId().equals(""));
            if (childComment.getReplyReplyId() != null && !childComment.getReplyReplyId().equals("")){
                WebSocketServer.sendInfo(childComment.getReplyEmail()+"用户回复了你的评论",childComment.getReplyReplyId());
                Message message = new Message();
                message.setOriId(childComment.getReplyId());
                message.setDesId(childComment.getReplyReplyId());
                message.setContent("回复了你");
                message.setMesType(0);
                message.setStatus(0);
                messageService.save(message);
            }else {
                ParComment parComment = parCommentService.getById(childComment.getParentId());
                WebSocketServer.sendInfo(childComment.getReplyEmail()+"用户回复了你的评论",parComment.getUserId());
                Message message = new Message();
                message.setOriId(childComment.getReplyId());
                message.setDesId(parComment.getUserId());
                message.setContent("回复了你");
                message.setMesType(0);
                message.setStatus(0);
                messageService.save(message);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        childCommentService.save(childComment);
        Article article = articleService.getById(childComment.getArticleId());
        //评论数加一
        articleService.update(new UpdateWrapper<Article>().set("comments",article.getComments() + 1).eq("id",article.getId()));
        return new Result(ResultCodeMessage.SUCCESS);
    }

    @ApiOperation(value = "浏览记录接口",notes = "记录浏览数量")
    @GetMapping("/addviews")
    public Result addview(Integer articleId){
        Article article = articleService.getById(articleId);
        System.out.println("点赞的文章是========》"+article);
        articleService.update(new UpdateWrapper<Article>().set("views",article.getViews() + 1).eq("id",articleId));
        return new Result(ResultCodeMessage.SUCCESS);
    }

    @Systemlog(desc = "用户收藏了文章")
    @ApiOperation(value = "收藏文章接口",notes = "用于收藏文章")
    @PostMapping("/addCollection")
    @RequiresAuthentication
    public Result addCollection(@RequestBody UserCollection userCollection){
        System.out.println(userCollection);
        try {
            if (userCollection.getIsCollection() == 1){
                userCollectionService.save(userCollection);
                //该文章收藏+1
                Article article = articleService.getById(userCollection.getArticleId());
                articleService.update(new UpdateWrapper<Article>().set("collections",article.getCollections()+1).eq("id",article.getId()));

            }else {
                HashMap<String, Object> map = new HashMap<>();
                map.put("article_id",userCollection.getArticleId());
                map.put("user_id",userCollection.getUserId());
                userCollectionService.remove(new QueryWrapper<UserCollection>().allEq(map));
            }

        } catch (Exception e) {
            e.printStackTrace();
            return new Result(e);
        }
        return new Result(ResultCodeMessage.SUCCESS);
    }

    @ApiOperation(value = "查询所有文章",notes = "用于管理员查询所有文章")
    @GetMapping("/selectALLArticle")
    public Result selectALLArticle(ArticleFilter articleFilter){
        System.out.println(articleFilter);
        List<Article> articleList = articleService.selectALLArticle(articleFilter);
        return new Result(articleList);
    }

    @ApiOperation(value = "查询同类型的文章五条",notes = "")
    @GetMapping("/selectArticleByType")
    public Result selectArticleByType(Integer typeId){
        List<Article> articleList = articleService.selectArticleByType(typeId);
        return new Result(articleList);
    }
}
