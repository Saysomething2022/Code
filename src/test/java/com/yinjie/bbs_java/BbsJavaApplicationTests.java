package com.yinjie.bbs_java;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yinjie.bbs_java.entity.Article;
import com.yinjie.bbs_java.service.ArticleService;
import com.yinjie.bbs_java.util.filter.WordFilter;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class BbsJavaApplicationTests {

    @Autowired
    private ArticleService articleService;

    @Test
    void contextLoads() {
        for(int i = 0;i < 10;i ++){
            Article article = new Article();
            article.setTitle(i+"为什么为什么为什么");
            article.setContent("为什么有互联网大佬用IMABCDE这七个字母总结归纳了当今最流行的前沿技术，他们分别是IoT物联网、Mobile移动计算、AI人工智能、Blockchain区块链、Cloud云计算、Data大数据、Edge边缘计乍一眼看上去眼花缭乱，给人无穷的学习压力，但其实，我想说，这七大技术全都是以分布式技术为基石的在全球经济增速趋缓的大背景下，与许多应用业务大量裁人形成鲜明对比的是，各大巨头的中间件团队、实验室等基础部门，依然在大规模地招兵买马。随着业务扩展，以及IMABCDE等新兴技术领域的布局，分布式技术人才已然成为巨头们争夺的焦点我认为，谁更好地掌握了分布式技术，谁就更容易在新一轮技术浪潮中获得主动。");
            article.setCategory("");
            article.setAuthorId("028a7457e1436360a6c405be3149da21");
            article.setComments(5);
            article.setApproves(100);
            article.setTypeId(5);
            article.setViews(200);
            articleService.save(article);
        }

    }

    @Test
    void selectArticle(){
        List<Article> list = articleService.list(new QueryWrapper<Article>().eq("Category", "article"));
        System.out.println(list);
    }

    @Test
    void test(){
        String s = WordFilter.replaceWords("TMD,哈哈哈哈");
        System.out.println(WordFilter.getSensitiveWord("TMD",1));
        System.out.println(s);
    }

}
