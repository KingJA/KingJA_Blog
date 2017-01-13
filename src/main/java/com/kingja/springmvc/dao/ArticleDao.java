package com.kingja.springmvc.dao;

import com.kingja.springmvc.entity.Article;
import com.kingja.springmvc.entity.Comment;
import com.kingja.springmvc.entity.SaveArticle;
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


    List<Comment> getComments(@Param(value = "articleId")long articleId);
    int postComment(Comment comment);
    int publishArticle(SaveArticle alticle);
    int editArticle(SaveArticle alticle);
    int deleteArticle(@Param(value = "id")long id);
    Article getArticleById(@Param(value = "id")long id);
    int setTop(@Param(value = "id") long id,@Param(value = "top") long top);
}
