package com.kingja.springmvc.entity;

import com.kingja.springmvc.util.DateUtil;

/**
 * Description：TODO
 * Create Time：2017/1/10 16:02
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class Month {
    private String month;

    public String getSingleMonth() {
        return month;
    }

    public void setSingleMonth(String singleMonth) {
        this.singleMonth = singleMonth;
    }

    private String singleMonth;
    private int count;

    public String getMonth() {
        return DateUtil.StrTime2EStrTime(month,"yyyy-MM","MMM,yyyy");
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
