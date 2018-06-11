package com.qimo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	public static String DateToString(Date date) {
		return new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);
	}

	public static Date addDate(Date date, int days) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DAY_OF_MONTH, days);
		return c.getTime();
	}

	public static double subDate(Date date1, Date date2) {
		return (date1.getTime() - date2.getTime()) / (1000 *60*60*24);
	}

	public static Date StringToDate(String str) {
		Date d = null;
		try {
			d = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return d;
	}

	public static void main(String[] args) {
		System.out.println(DateToString(addDate(new Date(), 50)));
	}
}
