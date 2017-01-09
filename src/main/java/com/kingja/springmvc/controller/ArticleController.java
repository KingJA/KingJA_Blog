package com.kingja.springmvc.controller;

import com.kingja.springmvc.dao.ArticleDao;
import com.kingja.springmvc.entity.SaveArticle;
import com.kingja.springmvc.entity.JResult;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Description：管理员
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/article")
public class ArticleController {
    @Autowired
    ArticleDao articleDao;

    private static Logger logger = Logger.getLogger(ArticleController.class);

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit() {
        ModelAndView modelAndView = new ModelAndView("edit");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/doPublish", method = RequestMethod.POST)
    public JResult doPublish(SaveArticle saveArticle) {
        JResult<Object> jResult = new JResult<Object>();
        logger.error("Save SaveArticle :"+ saveArticle.toString());
        int effectLine = articleDao.publishArticle(saveArticle);
        if (effectLine > 0) {
            jResult.setResultCode(0);
        }else{
            jResult.setResultCode(4).setResultText("发布失败");
        }
        return jResult;
    }


}
