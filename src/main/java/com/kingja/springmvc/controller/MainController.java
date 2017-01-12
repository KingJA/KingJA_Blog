package com.kingja.springmvc.controller;

import com.kingja.springmvc.dao.AdminDao;
import com.kingja.springmvc.dao.CommonDao;
import com.kingja.springmvc.entity.Article;
import com.kingja.springmvc.entity.Category;
import com.kingja.springmvc.entity.Month;
import com.kingja.springmvc.service.AdminService;
import com.kingja.springmvc.util.HttpClientUtil;
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
    @Autowired
    CommonDao commonDao;
    @Autowired
    AdminDao adminDao;

    public static String decodeUnicode(String theString) {
        char aChar;
        int len = theString.length();
        StringBuffer outBuffer = new StringBuffer(len);
        for (int x = 0; x < len; ) {
            aChar = theString.charAt(x++);
            if (aChar == '\\') {
                aChar = theString.charAt(x++);
                if (aChar == 'u') {
                    // Read the xxxx
                    int value = 0;
                    for (int i = 0; i < 4; i++) {
                        aChar = theString.charAt(x++);
                        switch (aChar) {
                            case '0':
                            case '1':
                            case '2':
                            case '3':
                            case '4':
                            case '5':
                            case '6':
                            case '7':
                            case '8':
                            case '9':
                                value = (value << 4) + aChar - '0';
                                break;
                            case 'a':
                            case 'b':
                            case 'c':
                            case 'd':
                            case 'e':
                            case 'f':
                                value = (value << 4) + 10 + aChar - 'a';
                                break;
                            case 'A':
                            case 'B':
                            case 'C':
                            case 'D':
                            case 'E':
                            case 'F':
                                value = (value << 4) + 10 + aChar - 'A';
                                break;
                            default:
                                throw new IllegalArgumentException(
                                        "Malformed   \\uxxxx   encoding.");
                        }

                    }
                    outBuffer.append((char) value);
                } else {
                    if (aChar == 't')
                        aChar = '\t';
                    else if (aChar == 'r')
                        aChar = '\r';
                    else if (aChar == 'n')
                        aChar = '\n';
                    else if (aChar == 'f')
                        aChar = '\f';
                    outBuffer.append(aChar);
                }
            } else
                outBuffer.append(aChar);
        }
        return outBuffer.toString();
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView home() {
        String result = HttpClientUtil.getInstance().sendHttpsGet("http://ip.taobao.com/service/getIpInfo.php?ip=221.131.238.146");
        result = decodeUnicode(result);
        logger.error("result:" + result);
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
     * 获取文章列表
     *
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
