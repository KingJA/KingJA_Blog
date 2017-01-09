package com.kingja.springmvc.service;


import com.kingja.springmvc.entity.Article;
import com.kingja.springmvc.util.Page;

/**
 * Description：TODO
 * Create Time：2016/11/21 15:28
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public interface AdminService {
    Page<Article> getArticlesByPage(int currentPage, int pageSize);
}
