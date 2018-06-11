package com.qimo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qimo.bean.Users;
import com.qimo.dao.UsersDao;
@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		System.out.println(req.getCharacterEncoding());
		Users user = (Users) session.getAttribute("user");
		if (action.equals("update")) {
			String logname = req.getParameter("logname");
			String password = req.getParameter("password");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			String realname = req.getParameter("realname");
			user.setAddress(address);
			user.setPassword(password);
			user.setLogname(logname);
			user.setPhone(phone);
			user.setRealname(realname);
			UsersDao.update(user);
		}
	}
	
	
}
