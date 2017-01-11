package com.kingja.springmvc.dao;

import com.kingja.springmvc.entity.Article;
import com.kingja.springmvc.entity.SaveArticle;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:13
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Repository
public interface ArticleDao {


    int publishArticle(SaveArticle alticle);
    int editArticle(SaveArticle alticle);
    int deleteArticle(@Param(value = "id")long id);
    Article getArticleById(@Param(value = "id")long id);
}
