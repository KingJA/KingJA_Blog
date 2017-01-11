package com.kingja.springmvc.service;


import com.kingja.springmvc.entity.Article;
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
    Page2<Article> getDraftsArticles(int currentPage, int pageSize);
}
