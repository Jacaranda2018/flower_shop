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
			// System.out.println("conditionΪ��"+condition);
			sql = con.createStatement();
			if (boo) {
				ResultSet rs = sql.executeQuery(condition);
				boolean m = rs.next();
				if (m == true) {// ���õ�½�ɹ��ķ�����
					int id = rs.getInt("id");
					HttpSession session = request.getSession();
					session.setAttribute("user", UsersDao.getUser(id));
					success(request, response, logname, password, id);
					// RequestDispatcher
					// dispatcher=request.getRequestDispatcher("login.jsp");
					// //ת��
					// dispatcher.forward(request,response);

				} else {
					String backNews = "��������û�" + logname + "������,�����벻ƥ��";
					// ���õ�½ʧ�ܵķ���:
					fail(request, response, logname, backNews);
				}
			} else {
				String backNews = "�������û���������";
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
				loginBean.setBackNews("�Ѿ���¼");
				loginBean.setLogname(logname);
			} else {
				// loginBean.setBackNews(logname+"��½�ɹ�");
				loginBean.setBackNews("��¼�ɹ�");
				loginBean.setLogname(logname);

			}
		} catch (Exception ee) {
			loginBean = new Login();
			session.setAttribute("loginBean", loginBean);
			loginBean.setBackNews(logname + "��½�ɹ�");
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