package com.kingja.springmvc.entity;

/**
 * Description：TODO
 * Create Time：2016/11/16 14:00
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class JResult<T> {
    private int resultCode;
    private String resultText;
    private T resultData;



    public JResult setResultText(String resultText) {
        this.resultText = resultText;
        return this;
    }


    public JResult setResultData(T resultData) {
        this.resultData = resultData;
        return this;
    }


    public JResult setResultCode(int resultCode) {
        this.resultCode = resultCode;
        return this;
    }
}
