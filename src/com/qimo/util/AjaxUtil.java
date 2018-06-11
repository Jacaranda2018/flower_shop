package com.qimo.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

public class AjaxUtil {
	public static void printJsonData(HttpServletResponse response,Object obj){
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			out = response.getWriter();
			String data = JSON.toJSONString(obj);
			System.out.println(data);
			out.println(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
