package com.kingja.springmvc.service.impl;

import com.kingja.springmvc.dao.AdminDao;
import com.kingja.springmvc.entity.Article;
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
        List<Article> articles = adminDao.getArticlesByPage(page.getStartRow(), pageSize);
        logger.error("Result articles:" + articles.toString());
        page.setPageDatas(articles);
        page.setTotelItems(articles.size());
        return page;
    }

    public Page2<Article> getArticles(int currentPage, int pageSize) {
        List<Article> articles = adminDao.getArticles();
        Page2<Article> page2 = new Page2<Article>().setCurrentPage(currentPage)
                .setPageSize(pageSize)
                .setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE)
                .setAllDatas(articles);
        return page2;
    }
}
