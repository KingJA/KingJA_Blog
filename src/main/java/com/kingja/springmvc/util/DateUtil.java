package com.kingja.springmvc.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	public static String getDateTime(Object date){
		if(date==null) return "";
		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return f.format(date);
	}
	public static String getYearDay(Object date){
		if(date==null) return "";
		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd");
		return f.format(date);
	}
	public static String getTimeTip(String time) {
		String result = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d hh:mm:ss");
		long postTime = 0;
		try {
			postTime = sdf.parse(time).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long distanceTime = System.currentTimeMillis() - postTime;
		if (distanceTime < 30 * 1000) {
			result = "刚刚";
		} else if (distanceTime >= 30 * 1000 && distanceTime < 60 * 1000) {
			result = "1分钟前";
		} else if (distanceTime >= 60 * 1000 && distanceTime < 60 * 60 * 1000) {
			result = distanceTime / (60 * 1000) + "分钟前";
		} else if (distanceTime >= 60 * 60 * 1000 && distanceTime < 24 * 60 * 60 * 1000) {
			result = distanceTime / (60 * 60 * 1000) + "小时前";
		} else if (distanceTime >= 24 * 60 * 60 * 1000 && distanceTime < 48 * 60 * 60 * 1000) {
			result = "昨天";
		} else if (distanceTime >= 48 * 60 * 60 * 1000) {
			result = Date2String(new Date(postTime), "M月d日");
		}
		if (!Date2String(new Date(postTime), "yyyy").equals(String.valueOf(Calendar.getInstance().get(Calendar.YEAR)))) {
			result = Date2String(new Date(postTime), "yyyy年M月d日");
		}
		return result;
	}
	/**
	 * Date=>时间字符串
	 *
	 * @param date
	 * @param timeFormat yyyy-MM-dd  yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String Date2String(Date date, String timeFormat) {

		SimpleDateFormat df = new SimpleDateFormat(timeFormat);

		return df.format(date);
	}

	public static String StrTime2StrTime(String from,String fromFormat, String toFormat) {
		Date fromDate = StrToDate(from, fromFormat);
		return DateToStr(fromDate,toFormat);
	}

	/**
	 * 日期转换成字符串
	 * @param date
	 * @return str
	 */
	public static String DateToStr(Date date,String formatStr) {

		SimpleDateFormat format = new SimpleDateFormat(formatStr);
		String str = format.format(date);
		return str;
	}

	/**
	 * 字符串转换成日期
	 * @param str
	 * @return date
	 */
	public static Date StrToDate(String str,String formatStr) {

		SimpleDateFormat format = new SimpleDateFormat(formatStr);
		Date date = null;
		try {
			date = format.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

}
