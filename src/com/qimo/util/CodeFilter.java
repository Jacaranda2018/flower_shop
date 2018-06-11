package com.qimo.util;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

public class CodeFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 判断请求的方式 get/post
		HttpServletRequest req = (HttpServletRequest) request;
		String method = req.getMethod();
		if (method.equalsIgnoreCase("post")) {
			request.setCharacterEncoding("utf-8");
		} else {
			// 枚举
			Enumeration en = request.getParameterNames();
			while (en.hasMoreElements()) {
				String name = en.nextElement().toString();
				String[] values = request.getParameterValues(name);
				for (int i = 0; i < values.length; i++) {
					byte[] by = values[i].getBytes("ISO-8859-1");
					values[i] = new String(by, "utf-8");
				}
			}
		}

		response.setContentType("text/html;charset=utf-8");
		// 利用过滤方式返回到servlet jsp 界面
		chain.doFilter(request, response);

	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
