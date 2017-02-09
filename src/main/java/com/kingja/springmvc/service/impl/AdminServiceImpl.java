package com.kingja.springmvc.service.impl;

import com.kingja.springmvc.dao.AdminDao;
import com.kingja.springmvc.entity.Account;
import com.kingja.springmvc.entity.Article;
import com.kingja.springmvc.entity.Comment;
import com.kingja.springmvc.service.AdminService;
import com.kingja.springmvc.util.Page;
import com.kingja.springmvc.util.Page2;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description：TODO
 * Create Time：2016/11/28 9:54
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;
    private static Logger logger = Logger.getLogger(AdminServiceImpl.class);


    public Page<Article> getArticlesByPage(int currentPage, int pageSize) {
        Page<Article> page = new Page<Article>();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        page.setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE);
        List<Article> articles = adminDao.getAdminArticlesByPage(page.getStartRow(), pageSize);
        logger.error("Result articles:" + articles.toString());
        page.setPageDatas(articles);
        page.setTotelItems(articles.size());
        return page;
    }

    public Page2<Article> getArticles(int currentPage, int pageSize) {
        List<Article> articles = adminDao.getAdminArticles();
        Page2<Article> page2 = new Page2<Article>().setCurrentPage(currentPage)
                .setPageSize(pageSize)
                .setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE)
                .setAllDatas(articles);
        return page2;
    }

    public Page2<Article> getArticlesByDate(int currentPage, int pageSize,String publishDate) {
        List<Article> articles = adminDao.getAdminArticlesByDate(publishDate);
        Page2<Article> page2 = new Page2<Article>().setCurrentPage(currentPage)
                .setPageSize(pageSize)
                .setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE)
                .setAllDatas(articles);
        return page2;
    }

    public Page2<Article> getArticlesByCategory(int currentPage, int pageSize,long categoryId) {
        List<Article> articles = adminDao.getAdminArticlesByCategory(categoryId);
        Page2<Article> page2 = new Page2<Article>().setCurrentPage(currentPage)
                .setPageSize(pageSize)
                .setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE)
                .setAllDatas(articles);
        return page2;
    }

    public Page2<Article> getDraftsArticles(int currentPage, int pageSize) {
        List<Article> articles = adminDao.getDraftsArticles();
        Page2<Article> page2 = new Page2<Article>().setCurrentPage(currentPage)
                .setPageSize(pageSize)
                .setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE)
                .setAllDatas(articles);
        return page2;
    }

    public Page2<Comment> getComment(int currentPage, int pageSize) {
        List<Comment> articles = adminDao.getComment();
        Page2<Comment> page2 = new Page2<Comment>().setCurrentPage(currentPage)
                .setPageSize(pageSize)
                .setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE)
                .setAllDatas(articles);
        return page2;
    }

    public Page2<Account> getAccount(int currentPage, int pageSize) {
        List<Account> articles = adminDao.getAccount();
        Page2<Account> page2 = new Page2<Account>().setCurrentPage(currentPage)
                .setPageSize(pageSize)
                .setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE)
                .setAllDatas(articles);
        return page2;
    }
}
