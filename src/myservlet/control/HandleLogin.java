package myservlet.control;

import mybean.data.*;
import java.sql.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.qimo.dao.UsersDao;
import com.qimo.util.AjaxUtil;
import com.qimo.util.DBUtil;

import java.util.*;

public class HandleLogin extends HttpServlet {
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (Exception e) {

		}
	}

	public String handleString(String s) {
		try {
			byte bb[] = s.getBytes("iso-8859-1");
			s = new String(bb);

		} catch (Exception e) {
		}
		return s;
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection con;
		Statement sql;
		// String logname=request.getParameter("logname").trim(),
		// password=request.getParameter("password").trim();
		String logname = request.getParameter("logname");
		String password = request.getParameter("password");
		boolean boo = (logname.length() > 0) && (password.length() > 0);
		try {
			con = DBUtil.getConn();
			String condition = "select * from user where logname='" + logname
					+ "'and password='" + password + "'";
			// System.out.println("condition为："+condition);
			sql = con.createStatement();
			if (boo) {
				ResultSet rs = sql.executeQuery(condition);
				boolean m = rs.next();
				if (m == true) {// 调用登陆成功的方法：
					int id = rs.getInt("id");
					HttpSession session = request.getSession();
					session.setAttribute("user", UsersDao.getUser(id));
					success(request, response, logname, password, id);
					// RequestDispatcher
					// dispatcher=request.getRequestDispatcher("login.jsp");
					// //转发
					// dispatcher.forward(request,response);

				} else {
					String backNews = "您输入的用户" + logname + "不存在,或密码不匹配";
					// 调用登陆失败的方法:
					fail(request, response, logname, backNews);
				}
			} else {
				String backNews = "请输入用户名和密码";
				fail(request, response, logname, backNews);
			}
			con.close();
		} catch (SQLException exp) {
			String backNews = "" + exp;
			fail(request, response, logname, backNews);
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	public void success(HttpServletRequest request,
			HttpServletResponse response, String logname, String password,
			int id) {
		Login loginBean = null;
		HttpSession session = request.getSession(true);
		try {
			loginBean = (Login) session.getAttribute("loginBean");
			if (loginBean == null) {
				loginBean = new Login();
				session.setAttribute("loginBean", loginBean);
				loginBean = (Login) session.getAttribute("loginBean");

			}
			String name = loginBean.getLogname();
			if (name.equals(logname)) {
				loginBean.setBackNews("已经登录");
				loginBean.setLogname(logname);
			} else {
				// loginBean.setBackNews(logname+"登陆成功");
				loginBean.setBackNews("登录成功");
				loginBean.setLogname(logname);

			}
		} catch (Exception ee) {
			loginBean = new Login();
			session.setAttribute("loginBean", loginBean);
			loginBean.setBackNews(logname + "登陆成功");
			loginBean.setLogname(logname);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("content", loginBean);
		map.put("code", "1");
		AjaxUtil.printJsonData(response, map);
	}

	public void fail(HttpServletRequest request, HttpServletResponse response,
			String logname, String backNews) {
		Login loginBean = null;
		HttpSession session = request.getSession(true);
		loginBean = (Login) session.getAttribute("loginBean");
		loginBean.setBackNews(backNews);
		loginBean.setLogname(logname);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("content", loginBean);
		map.put("code", "2");
		AjaxUtil.printJsonData(response, map);
	}
}