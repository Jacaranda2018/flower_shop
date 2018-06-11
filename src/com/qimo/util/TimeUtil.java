package com.qimo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by anaconda on 2017/4/5.
 */
public class TimeUtil {

	public static long changeDateTo(String theDate) {
		System.out.println("日期为：：" + theDate);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long dateToMill = 0;
		try {
			Date date = sdf.parse(theDate);
			dateToMill = date.getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dateToMill;
	}

	public static String changeDateToString(long theDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar now = Calendar.getInstance();
		now.setTimeInMillis(theDate);
		return sdf.format(now.getTime());
	}
}
