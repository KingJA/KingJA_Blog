package com.kingja.springmvc.dao;

import com.kingja.springmvc.entity.Article;
import com.kingja.springmvc.entity.SaveArticle;
import com.kingja.springmvc.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:13
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Repository
public interface ArticleDao {


    int publishArticle(SaveArticle alticle);

    Article getArticleById(@Param(value = "id")long id);
}
