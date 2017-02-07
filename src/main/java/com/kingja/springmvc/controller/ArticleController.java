package com.kingja.springmvc.controller;

import com.kingja.springmvc.dao.AdminDao;
import com.kingja.springmvc.dao.ArticleDao;
import com.kingja.springmvc.dao.CommonDao;
import com.kingja.springmvc.entity.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Description：文章 - 控制器
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/article")
public class ArticleController {
    @Autowired
    ArticleDao articleDao;

    @Autowired
    CommonDao commonDao;
    @Autowired
    AdminDao adminDao;

    private static Logger logger = Logger.getLogger(ArticleController.class);

    /**
     * 文章发布 界面
     *
     * @return
     */
    @RequestMapping(value = "/publish", method = RequestMethod.GET)
    public ModelAndView publish() {
        ModelAndView modelAndView = new ModelAndView("/admin/publish");
        //获取分类信息
        List<Category> categorys = adminDao.getCategorys();
        modelAndView.addObject("categorys", categorys);
        return modelAndView;
    }

    /**
     * 文章修改
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("id") long id) {
        ModelAndView modelAndView = new ModelAndView("/admin/edit");
        //获取根据id获取文章信息
        Article editArticle = articleDao.getArticleById(id);
        logger.error("editArticle:" + editArticle.toString());
        modelAndView.addObject("editArticle", editArticle);
        //获取分类信息
        List<Category> categorys = adminDao.getCategorys();
        modelAndView.addObject("categorys", categorys);
        return modelAndView;
    }

    /**
     * 文章发布逻辑
     *
     * @param saveArticle
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/doPublish", method = RequestMethod.POST)
    public JResult doPublish(SaveArticle saveArticle) {
        JResult<Object> jResult = new JResult<Object>();
        logger.error("Save SaveArticle :" + saveArticle.toString());
        int effectLine = articleDao.publishArticle(saveArticle);
        if (effectLine > 0) {
            jResult.setResultCode(0);
        } else {
            jResult.setResultCode(4).setResultText("操作失败");
        }
        return jResult;
    }

    /**
     * 文章修改
     *
     * @param saveArticle
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/doEdit", method = RequestMethod.POST)
    public JResult doEdit(SaveArticle saveArticle) {
        JResult<Object> jResult = new JResult<Object>();
        logger.error("Edit SaveArticle :" + saveArticle.toString());
        int effectLine = articleDao.editArticle(saveArticle);
        if (effectLine > 0) {
            jResult.setResultCode(0);
        } else {
            jResult.setResultCode(4).setResultText("操作失败");
        }
        return jResult;
    }

    /**
     * 文章 删除
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/doDelete", method = RequestMethod.POST)
    public JResult doDelete(@RequestParam("id") long id) {
        JResult<Object> jResult = new JResult<Object>();
        int effectLine = articleDao.deleteArticle(id);
        if (effectLine > 0) {
            jResult.setResultCode(0);
        } else {
            jResult.setResultCode(4).setResultText("操作失败");
        }
        return jResult;
    }

    /**
     * 文章置顶
     *
     * @param id
     * @param top
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/setTop", method = RequestMethod.POST)
    public JResult setTop(@RequestParam("id") long id, @RequestParam("top") long top) {
        JResult<Object> jResult = new JResult<Object>();
        int effectLine = articleDao.setTop(id, top);
        if (effectLine > 0) {
            jResult.setResultCode(0);
        } else {
            jResult.setResultCode(4).setResultText("操作失败");
        }
        return jResult;
    }

    /**
     * 文章详情页
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public ModelAndView detail(@PathVariable("id") long id) {
        ModelAndView modelAndView = new ModelAndView("/main/detail");
        Article article = articleDao.getArticleById(id);
        //1.获取文章详情
        logger.error(article.getContent());
        modelAndView.addObject("article", article);

        //2.获取热门文章列表
        List<Article> hotArticles = commonDao.getHotArticle(5);
        modelAndView.addObject("hotArticles", hotArticles);

        //3.获取月份列表
        List<Month> months = commonDao.getMonth(5);
        modelAndView.addObject("months", months);

        //4.获取分类列表
        List<Category> categorys = commonDao.getAvailableCategory(99);
        modelAndView.addObject("categorys", categorys);

        //获取评论列表
        List<Comment> comments = articleDao.getComments(id);

        modelAndView.addObject("comments", comments);

        return modelAndView;
    }

    /**
     * 发表评论
     *
     * @param comment
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/postComment", method = RequestMethod.POST)
    public JResult postComment(Comment comment) {
        logger.error("comment:" + comment.toString());
        JResult<Object> jResult = new JResult<Object>();
        int effectLine = articleDao.postComment(comment);
        if (effectLine > 0) {
            jResult.setResultCode(0);
        } else {
            jResult.setResultCode(4).setResultText("操作失败");
        }
        return jResult;
    }

}
