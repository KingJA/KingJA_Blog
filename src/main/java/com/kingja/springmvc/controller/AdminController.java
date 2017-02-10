package com.kingja.springmvc.controller;

import com.kingja.springmvc.dao.AdminDao;
import com.kingja.springmvc.dao.AccountDao;
import com.kingja.springmvc.entity.*;
import com.kingja.springmvc.service.AdminService;
import com.kingja.springmvc.util.Page2;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Description：管理员 - 控制器
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    AccountDao accountDao;
    @Autowired
    AdminDao adminDao;

    @Autowired
    AdminService adminService;
    private static Logger logger = Logger.getLogger(AdminController.class);

    /**
     * 登录界面
     *
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView main() {
        ModelAndView modelAndView = new ModelAndView("/admin/login");
        return modelAndView;
    }

    /**
     * 登录逻辑
     *
     * @param name
     * @param password
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public JResult doLogin(@RequestParam("name") String name, @RequestParam("password") String password, HttpSession session) {
        JResult<Object> jResult = new JResult<Object>();
        List<Account> accounts = accountDao.checkAdmin(name, password);
        if (accounts.size() > 0) {//登录成功
            jResult.setResultCode(0).setResultText("登录成功");
            Account account = accounts.get(0);
            session.setAttribute("User", account);
            logger.error(account.toString());
        } else {
            jResult.setResultCode(4).setResultText("用户名或密码错误，请重新登录");
        }
        return jResult;
    }


    /**
     * 文章列表 - 首页
     *
     * @return
     */
    @RequestMapping(value = "/article", method = RequestMethod.GET)
    public ModelAndView article() {
        logger.error("article");
        ModelAndView modelAndView = new ModelAndView("/admin/article");
        Page2<Article> articlePage = adminService.getArticles(1, 10);
        modelAndView.addObject("articlePage", articlePage);
        return modelAndView;
    }

    /**
     * 文章列表
     *
     * @param page
     * @return
     */
    @RequestMapping(value = "/article/{page}", method = RequestMethod.GET)
    public ModelAndView articleByPage(@PathVariable("page") int page) {
        logger.error("articleByPage");
        ModelAndView modelAndView = new ModelAndView("/admin/article");
        Page2<Article> articlePage = adminService.getArticles(page, 10);
        modelAndView.addObject("articlePage", articlePage);
        return modelAndView;
    }

    /**
     * 账号列表 - 首页
     *
     * @return
     */
    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public ModelAndView account() {
        ModelAndView modelAndView = new ModelAndView("/admin/account");
        Page2<Account> accountPage = adminService.getAccount(1, 10);
        modelAndView.addObject("accountPage", accountPage);
        return modelAndView;
    }

    /**
     * 账号列表
     *
     * @return
     */
    @RequestMapping(value = "/account/{page}", method = RequestMethod.GET)
    public ModelAndView account(@PathVariable("page") int page) {
        ModelAndView modelAndView = new ModelAndView("/admin/account");
        Page2<Account> accountPage = adminService.getAccount(page, 10);
        modelAndView.addObject("accountPage", accountPage);
        return modelAndView;
    }

    /**
     * 草稿箱- 首页
     *
     * @return
     */
    @RequestMapping(value = "/drafts", method = RequestMethod.GET)
    public ModelAndView drafts() {
        ModelAndView modelAndView = new ModelAndView("/admin/drafts");
        Page2<Article> articlePage = adminService.getDraftsArticles(1, 10);
        modelAndView.addObject("articlePage", articlePage);
        return modelAndView;
    }

    /**
     * 草稿箱- 分页
     *
     * @return
     */
    @RequestMapping(value = "/drafts/{page}", method = RequestMethod.GET)
    public ModelAndView drafts(@PathVariable("page") int page) {
        ModelAndView modelAndView = new ModelAndView("/admin/drafts");
        Page2<Article> articlePage = adminService.getDraftsArticles(page, 10);
        modelAndView.addObject("articlePage", articlePage);
        return modelAndView;
    }

    /**
     * 评论列表-首页
     *
     * @return
     */
    @RequestMapping(value = "/comment", method = RequestMethod.GET)
    public ModelAndView comment() {
        ModelAndView modelAndView = new ModelAndView("/admin/comment");
        Page2<Comment> commentPage = adminService.getComment(1, 10);
        modelAndView.addObject("commentPage", commentPage);
        return modelAndView;
    }

    /**
     * 评论列表-分页
     *
     * @return
     */
    @RequestMapping(value = "/comment/{page}", method = RequestMethod.GET)
    public ModelAndView comment(@PathVariable("page") int page) {
        ModelAndView modelAndView = new ModelAndView("/admin/comment");
        Page2<Comment> commentPage = adminService.getComment(page, 10);
        modelAndView.addObject("commentPage", commentPage);
        return modelAndView;
    }

    /**
     * 分类列表
     *
     * @return
     */
    @RequestMapping(value = "/category", method = RequestMethod.GET)
    public ModelAndView category() {
        ModelAndView modelAndView = new ModelAndView("/admin/category");
        List<Category> categorys = adminDao.getAdminCategorys();
        logger.error("categorys数量：" + categorys.size());
        modelAndView.addObject("categorys", categorys);
        return modelAndView;
    }


    /**
     * 添加分类
     *
     * @param name
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/addCategory", method = RequestMethod.POST)
    public JResult addCategory(@RequestParam("name") String name) {
        JResult<Object> jResult = new JResult<Object>();
        int effectLine = adminDao.addCategory(name);
        if (effectLine > 0) {
            jResult.setResultCode(0);
        } else {
            jResult.setResultCode(4).setResultText("操作失败");
        }
        return jResult;
    }

    /**
     * 删除分类
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteCategory", method = RequestMethod.POST)
    public JResult deleteCategory(@RequestParam("id") long id) {
        JResult<Object> jResult = new JResult<Object>();
        int effectLine = adminDao.deleteCategory(id);
        if (effectLine > 0) {
            jResult.setResultCode(0);
        } else {
            jResult.setResultCode(4).setResultText("操作失败");
        }
        return jResult;
    }

    /**
     * 编辑分类
     *
     * @param id
     * @param name
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/editCategory", method = RequestMethod.POST)
    public JResult editCategory(@RequestParam("id") long id, @RequestParam("name") String name) {
        JResult<Object> jResult = new JResult<Object>();
        int effectLine = adminDao.editCategory(id, name);
        if (effectLine > 0) {
            jResult.setResultCode(0);
        } else {
            jResult.setResultCode(4).setResultText("操作失败");
        }
        return jResult;
    }

    /**
     * 评论 删除
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/comment/doDelete", method = RequestMethod.POST)
    public JResult deleteComment(@RequestParam("id") long id) {
        JResult<Object> jResult = new JResult<Object>();
        int effectLine = adminDao.deleteComment(id);
        if (effectLine > 0) {
            jResult.setResultCode(0);
        } else {
            jResult.setResultCode(4).setResultText("操作失败");
        }
        return jResult;
    }

    /**
     * 账户 删除
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/account/doDelete", method = RequestMethod.POST)
    public JResult deleteAccount(@RequestParam("id") long id) {
        JResult<Object> jResult = new JResult<Object>();
        int effectLine = adminDao.deleteAccount(id);
        if (effectLine > 0) {
            jResult.setResultCode(0);
        } else {
            jResult.setResultCode(4).setResultText("操作失败");
        }
        return jResult;
    }
}
