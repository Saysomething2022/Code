package com.yinjie.bbs_java.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yinjie.bbs_java.dto.ParComment;
import com.yinjie.bbs_java.dto.vo.ArticleFilter;
import com.yinjie.bbs_java.entity.Article;
import com.yinjie.bbs_java.mapper.ArticleMapper;
import com.yinjie.bbs_java.service.ArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;
    @Override
    public IPage<Article> selectArticlePage(IPage<Article> page, String category,Integer type_id,String title) {
        return articleMapper.selectArticlePage(page,category,type_id,title);
    }

    @Override
    public List<Article> selectPersonArticle(String uid,String category) {
        return articleMapper.selectPersonArticle(uid,category);
    }

    @Override
    public Article selectArticleById(Integer id) {
        return articleMapper.selectArticleById(id);
    }

    @Override
    public List<ParComment> selectComment(Integer id) {
        return articleMapper.selectComment(id);
    }

    @Override
    public List<Article> selectMyCollection(String uid) {
        return articleMapper.SelectMyCollection(uid);
    }

    @Override
    public List<Article> selectALLArticle() {
        return articleMapper.selectALLArticle();
    }

    @Override
    public List<Article> selectALLArticle(ArticleFilter articleFilter) {
        return articleMapper.selectALLArticle(articleFilter);
    }

    @Override
    public List<Article> selectArticleByType(Integer typeId) {
        return articleMapper.selectArticleByType(typeId);
    }


}
