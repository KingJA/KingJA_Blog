package com.kingja.springmvc.controller;

import com.kingja.springmvc.dao.AdminDao;
import com.kingja.springmvc.dao.CommonDao;
import com.kingja.springmvc.entity.Article;
import com.kingja.springmvc.entity.Category;
import com.kingja.springmvc.entity.Month;
import com.kingja.springmvc.service.AdminService;
import com.kingja.springmvc.util.Page2;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Description：首页
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "")
public class MainController {
    private static Logger logger = Logger.getLogger(MainController.class);
    @Autowired
    AdminService adminService;
    @Autowired
    CommonDao commonDao;
    @Autowired
    AdminDao adminDao;


    /**
     * 首页
     * @return
     */
    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView("/main/index");
        //1.获取文章列表
        Page2<Article> articlePage = adminService.getArticles(1, 5);
        modelAndView.addObject("articlePage", articlePage);
        //2.获取热门文章列表
        List<Article> hotArticles = commonDao.getHotArticle(5);
        modelAndView.addObject("hotArticles", hotArticles);
        //3.获取月份列表
        List<Month> months = commonDao.getMonth(5);
        modelAndView.addObject("months", months);
        //4.获取分类列表
        List<Category> categorys = adminDao.getAdminCategorys();
        modelAndView.addObject("categorys", categorys);
        return modelAndView;
    }

    /**
     * 时间分类首页
     * @return
     */
    @RequestMapping(value = "/article/date/{date}", method = RequestMethod.GET)
    public ModelAndView dateList(@PathVariable("date") String date) {
        logger.error(date);
        ModelAndView modelAndView = new ModelAndView("/main/dateList");
        modelAndView.addObject("date", date);
        //1.获取文章列表
        Page2<Article> articlePage = adminService.getArticlesByDate(1, 5,date);
        modelAndView.addObject("articlePage", articlePage);
        //2.获取热门文章列表
        List<Article> hotArticles = commonDao.getHotArticle(5);
        modelAndView.addObject("hotArticles", hotArticles);
        //3.获取月份列表
        List<Month> months = commonDao.getMonth(5);
        modelAndView.addObject("months", months);
        //4.获取分类列表
        List<Category> categorys = adminDao.getAdminCategorys();
        modelAndView.addObject("categorys", categorys);
        return modelAndView;
    }

    /**
     * 文章列表 - 分页
     * @param page
     * @return
     */
    @RequestMapping(value = "/page/{page}", method = RequestMethod.GET)
    public ModelAndView homeByPage(@PathVariable("page") int page) {
        ModelAndView modelAndView = new ModelAndView("/main/index");
        //1.获取文章列表
        Page2<Article> articlePage = adminService.getArticles(page, 5);
        modelAndView.addObject("articlePage", articlePage);

        //2.获取热门文章列表
        List<Article> hotArticles = commonDao.getHotArticle(5);
        modelAndView.addObject("hotArticles", hotArticles);

        //3.获取月份列表
        List<Month> months = commonDao.getMonth(5);
        modelAndView.addObject("months", months);
        //4.获取分类列表
        List<Category> categorys = adminDao.getAdminCategorys();
        modelAndView.addObject("categorys", categorys);
        return modelAndView;
    }
}
