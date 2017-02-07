package com.kingja.springmvc.entity;

/**
 * Description：TODO
 * Create Time：2017/2/7 16:45
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class Counter {
    private static long online = 0;

    public static long getOnline() {
        return online;
    }

    public static void raise(){
        online++;
    }

    public static void reduce(){
        online--;
    }
}
