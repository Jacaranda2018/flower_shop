package com.qimo.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.qimo.bean.Orders;
import com.qimo.bean.Users;
import com.qimo.dao.CartDao;
import com.qimo.dao.OrdersDao;

@WebServlet("/orderServlet")
public class OrderServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		if (action.equals("addOrder")) {
			String o_dids = request.getParameter("dids");
			String o_nums = request.getParameter("nums");
			String o_money = request.getParameter("money");
			String[] cids = request.getParameter("cids").split(",");
			Orders order = new Orders();
			order.setO_dids(o_dids);
			order.setO_money(Double.parseDouble(o_money));
			order.setO_nums(o_nums);
			order.setUser(user);
			OrdersDao.insertOrder(order);
			for (int i = 0; i < cids.length; i++) {
				CartDao.delById(Integer.parseInt(cids[i]));
			}
		}
	}
}
