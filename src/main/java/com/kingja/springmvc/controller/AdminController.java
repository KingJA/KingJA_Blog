package com.kingja.springmvc.controller;

import com.kingja.springmvc.dao.UserDao;
import com.kingja.springmvc.entity.Article;
import com.kingja.springmvc.entity.JResult;
import com.kingja.springmvc.entity.User;
import com.kingja.springmvc.service.AdminService;
import com.kingja.springmvc.util.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Description：管理员
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    UserDao userDao;

    @Autowired
    AdminService adminService;
    private static Logger logger = Logger.getLogger(AdminController.class);

    /**
     * 登录页
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView main() {
        ModelAndView modelAndView = new ModelAndView("login");
        return modelAndView;
    }

    /**
     * 登录处理
     * @param name
     * @param password
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public JResult doLogin(@RequestParam("name") String name, @RequestParam("password") String password, HttpSession session) {
        JResult<Object> jResult = new JResult<Object>();
        List<User> users = userDao.checkAdmin(name, password);
        if (users.size()> 0) {//登录成功
            jResult.setResultCode(0).setResultText("登录成功");
            User user = users.get(0);
            session.setAttribute("User",user);
            logger.error(user.toString());
        } else {
            jResult.setResultCode(4).setResultText("用户名或密码错误，请重新登录");
        }
        return jResult;
    }

    /**
     * 文章管理页
     * @return
     */
    @RequestMapping(value = "/article", method = RequestMethod.GET)
    public ModelAndView article() {
        ModelAndView modelAndView = new ModelAndView("article");
        return modelAndView;
    }

    /**
     * 获取文章列表
     * @param currentPage
     * @return
     */
    @RequestMapping(value = "/article/{currentPage}", method = RequestMethod.GET)
    public ModelAndView shop(@PathVariable int currentPage) {
        ModelAndView modelAndView = new ModelAndView("article");
        Page<Article> articlePage = adminService.getArticlesByPage(currentPage, 5);
        modelAndView.addObject("articlePage",articlePage);
        return modelAndView;
    }
}
