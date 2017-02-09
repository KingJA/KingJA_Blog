package com.kingja.springmvc.dao;

import com.kingja.springmvc.entity.Account;
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
public interface AccountDao {

    List<Account> checkAdmin(@Param(value = "name") String name, @Param(value = "password") String password);

}
