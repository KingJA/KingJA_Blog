package com.kingja.springmvc.entity;

import java.util.Date;

/**
 * Description：TODO
 * Create Time：2017/1/9 10:30
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class User {
    private long id;
    private String nick;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private String name;
    private Date createTime;
    private int role;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }
}
