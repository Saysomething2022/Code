package com.yinjie.bbs_java.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yinjie.bbs_java.dto.ParComment;
import com.yinjie.bbs_java.dto.vo.ArticleFilter;
import com.yinjie.bbs_java.entity.Article;
import com.baomidou.mybatisplus.extension.service.IService;
import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Jack
 * @since 2022-03-09 15:57:10
 */
public interface ArticleService extends IService<Article> {

        IPage<Article> selectArticlePage(IPage<Article> page,String category,Integer type_id,String title);

        List<Article> selectPersonArticle(String uid,String category);

        Article selectArticleById(Integer id);

        List<ParComment> selectComment(Integer id);

        List<Article> selectMyCollection(String uid);

        List<Article> selectALLArticle();

        List<Article> selectALLArticle(ArticleFilter articleFilter);

        List<Article> selectArticleByType(Integer typeId);
}
