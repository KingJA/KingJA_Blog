package com.kingja.springmvc.dao;

import com.kingja.springmvc.entity.Article;
import com.kingja.springmvc.entity.Month;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:13
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Repository
public interface CommonDao {
    /*获取热门文章前N*/
    List<Article> getHotArticle(@Param(value = "top") int top);
    /*获取月份前N*/
    List<Month> getMonth(@Param(value = "monthSize") int monthSize);
}
