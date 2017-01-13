package com.kingja.springmvc.entity;

import com.kingja.springmvc.util.DateUtil;

import java.util.Date;

/**
 * Description：TODO
 * Create Time：2017/1/13 15:15
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class Comment {
    private long id;
    private long articleId;
    private String name;
    private String email;
    private String site;
    private String content;
    private Date createTime;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getArticleId() {
        return articleId;
    }

    public void setArticleId(long articleId) {
        this.articleId = articleId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", articleId=" + articleId +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", site='" + site + '\'' +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                '}';
    }

    public String getCreateTime() {
        return DateUtil.getFormatTime(createTime,"yyyy年MM月dd日 HH:mm:ss");
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
