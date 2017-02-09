package com.kingja.springmvc.service;


import com.kingja.springmvc.entity.Article;
import com.kingja.springmvc.entity.Comment;
import com.kingja.springmvc.entity.User;
import com.kingja.springmvc.util.Page;
import com.kingja.springmvc.util.Page2;

/**
 * Description：TODO
 * Create Time：2016/11/21 15:28
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public interface AdminService {
    Page<Article> getArticlesByPage(int currentPage, int pageSize);
    Page2<Article> getArticles(int currentPage, int pageSize);
    Page2<Article> getArticlesByDate(int currentPage, int pageSize,String publishDate);
    Page2<Article> getArticlesByCategory(int currentPage, int pageSize,long categoryId);
    Page2<Article> getDraftsArticles(int currentPage, int pageSize);
    Page2<Comment> getComment(int currentPage, int pageSize);
    Page2<User> getAccount(int currentPage, int pageSize);
}
