package com.kingja.springmvc.dao;

import com.kingja.springmvc.entity.Article;
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
public interface AdminDao {
    List<Article> getArticlesByPage(@Param(value = "startRow") int startRow, @Param(value = "pageSize") int pageSize);
}
