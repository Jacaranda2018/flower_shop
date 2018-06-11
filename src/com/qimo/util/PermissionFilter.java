package com.qimo.util;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qimo.bean.Users;


@WebFilter("*.jsp")
public class PermissionFilter implements Filter {

	public void destroy() {
		System.out.println("权限访问过滤器销毁!");
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		String uri = request.getRequestURI();
		System.out.println(uri);
		Users user = (Users) request.getSession().getAttribute("user");
		if(user!=null&&user.getId()!=0||uri.equals("/qimo/lookCosmetic.jsp")||uri.equals("/lookCosmetic.jsp")||uri.equals("/inputRegisterMess.jsp")||uri.equals("/qimo/inputRegisterMess.jsp")){
			chain.doFilter(req, resp);
		}else{
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("权限访问过滤器初始化!");
	}

}
