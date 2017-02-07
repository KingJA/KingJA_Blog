package com.kingja.springmvc.listener;

import com.kingja.springmvc.entity.Counter;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Description：TODO
 * Create Time：2017/2/7 16:43
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class OnlineCounterListener implements HttpSessionListener {
    private static Logger logger = Logger.getLogger(OnlineCounterListener.class);
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        logger.error("sessionCreated");
        Counter.raise();
    }

    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        logger.error("sessionDestroyed");
        Counter.reduce();
    }
}
