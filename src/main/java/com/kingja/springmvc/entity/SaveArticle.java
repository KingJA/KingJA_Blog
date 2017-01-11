package com.kingja.springmvc.entity;

/**
 * Description：TODO
 * Create Time：2017/1/9 10:29
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class SaveArticle {


    private long id;
    private long authorId;
    private long categoryId;
    private String title;
    private String content;
    private int display;


    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
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

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getAuthorId() {
        return authorId;
    }

    public void setAuthorId(long authorId) {
        this.authorId = authorId;
    }

    public int getDisplay() {
        return display;
    }

    public void setDisplay(int display) {
        this.display = display;
    }
}
