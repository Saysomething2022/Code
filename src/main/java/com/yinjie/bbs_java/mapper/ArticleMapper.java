package com.yinjie.bbs_java.mapper;

import  com.baomidou.mybatisplus.core.metadata.IPage;
import com.yinjie.bbs_java.dto.ParComment;
import com.yinjie.bbs_java.dto.vo.ArticleFilter;
import com.yinjie.bbs_java.entity.Article;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.swagger.models.auth.In;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 */
@Mapper
public interface ArticleMapper extends BaseMapper<Article> {

    //多表分页查询
    IPage<Article> selectArticlePage(IPage<Article> page, String category, Integer type_id,String title);

    //根据文章id查询文章
    Article selectArticleById(Integer id);

    //根据文章id查询对应的评论
    List<ParComment> selectComment(Integer id);

    List<Article> selectPersonArticle(String uid,String category);

    List<Article> SelectMyCollection(String uid);

    List<Article> selectALLArticle(ArticleFilter articleFilter);

    List<Article> selectALLArticle();

    //根据类型查询时间最新的五条文章
    List<Article> selectArticleByType(Integer typeId);
}
