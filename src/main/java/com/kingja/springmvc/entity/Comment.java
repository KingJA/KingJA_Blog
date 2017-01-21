package com.kingja.springmvc.entity;

import com.kingja.springmvc.util.DateUtil;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    private long childId;/*下级评论id*/
    private long fatherId;/*上级评论id*/
    private static Logger logger = Logger.getLogger(Comment.class);
    public Comment getChildComment() {
        return childComment;
    }

    private Comment childComment;

    public long getChildId() {
        return childId;
    }

    public void setChildId(long childId) {
        this.childId = childId;
    }


    public long getFatherId() {
        return fatherId;
    }

    public void setFatherId(long fatherId) {
        this.fatherId = fatherId;
    }



    public List<Comment> getChildComments() {
        return childComments;
    }

    private List<Comment> childComments=new ArrayList<Comment>();/*下级评论*/


    public void addChildComment(List<Comment> comments) {
        if (this.childId != 0) {
            logger.error("childId:"+childId+" fatherId:"+fatherId);
            comments.add(childComment);
            Comment childComment = getChildComment();
            childComment.addChildComment(comments);
        }else{
            this.childComments.add(this);
        }
    }


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
                ", content=" + content +
                ", name='" + name ;
    }

    public String getCreateTime() {
        return DateUtil.getFormatTime(createTime,"yyyy年MM月dd日 HH:mm:ss");
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public void setChildComment(Comment childComment) {
        this.childComment = childComment;
    }

    public List<Comment> getTotleComment() {
        return totleComment;
    }

    public void setTotleComment(List<Comment> totleComment) {
        this.totleComment = totleComment;
    }

    private List<Comment> totleComment=new ArrayList<Comment>();

}
