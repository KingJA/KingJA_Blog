package com.kingja.springmvc.controller;

import com.kingja.springmvc.entity.Article;
import com.kingja.springmvc.service.AdminService;
import com.kingja.springmvc.util.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Description：TODO
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
    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView("index");
        Page<Article> articlePage = adminService.getArticlesByPage(1, 5);
        modelAndView.addObject("articlePage",articlePage);
        return modelAndView;
    }

    /**
     * 获取文章列表
     * @param page
     * @return
     */
    @RequestMapping(value = "/page/{page}", method = RequestMethod.GET)
    public ModelAndView homeByPage(@PathVariable("page") int page) {
        ModelAndView modelAndView = new ModelAndView("index");
        Page<Article> articlePage = adminService.getArticlesByPage(page, 5);
        modelAndView.addObject("articlePage",articlePage);
        return modelAndView;
    }
}
