package com.kingja.springmvc.dao;

import com.kingja.springmvc.entity.User;
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
public interface UserDao {

    List<User> checkAdmin(@Param(value = "name") String name, @Param(value = "password") String password);

}
