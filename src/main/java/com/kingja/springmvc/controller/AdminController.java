package com.kingja.springmvc.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/admin")
public class AdminController {
    private static Logger logger = Logger.getLogger(AdminController.class);

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView main() {
        logger.debug("login");
        ModelAndView modelAndView = new ModelAndView("login");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public String doLogin(@RequestParam("name") String name, @RequestParam("password") String password, HttpSession session) {
        logger.error("doLogin");
        if ("aaa".equals(name)) {

        }else{

        }
        return "";
    }


}
