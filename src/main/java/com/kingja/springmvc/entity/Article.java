package com.kingja.springmvc.entity;

import com.kingja.springmvc.util.DateUtil;

import java.util.Date;

/**
 * Description：TODO
 * Create Time：2017/1/9 10:29
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class Article {
    private long id;
    private long categoryId;
    private long authorId;
    private String category;
    private String title;
    private String content;
    private int readCount;

    public int getTop() {
        return top;
    }

    public void setTop(int top) {
        this.top = top;
    }

    private int top;
    private int commentCount;
    private Date createTime;

    public int getReadCount() {
        return readCount;
    }

    public void setReadCount(int readCount) {
        this.readCount = readCount;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    public String getCreateTime() {
        return DateUtil.Date2EString(createTime,"MMM d,yyyy");
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return DateUtil.getYearDay(updateTime);
    }
    public String getFullUpdateTime() {
        return DateUtil.getDateTime(updateTime);
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    private Date updateTime;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public long getAuthorId() {
        return authorId;
    }

    public void setAuthorId(long authorId) {
        this.authorId = authorId;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", categoryId=" + categoryId +
                ", authorId=" + authorId +
                ", category='" + category + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", readCount=" + readCount +
                ", commentCount=" + commentCount +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
