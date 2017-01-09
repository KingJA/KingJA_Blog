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
    private String tag;
    private String title;
    private String content;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
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


    @Override
    public String toString() {
        return "SaveArticle{" +
                "id=" + id +
                ", tag='" + tag + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                '}';
    }

    public long getAuthorId() {
        return authorId;
    }

    public void setAuthorId(long authorId) {
        this.authorId = authorId;
    }
}
