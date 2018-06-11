package com.qimo.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qimo.bean.CustomOrder;
import com.qimo.bean.Orders;
import com.qimo.bean.Users;
import com.qimo.dao.CartDao;
import com.qimo.dao.CustomDao;
import com.qimo.dao.CustomOrderDao;
import com.qimo.dao.OrdersDao;

@WebServlet("/customOrderServlet")
public class CustomOrderServlet extends HttpServlet {
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
			CustomOrder order = new CustomOrder();
			order.setTfids(o_dids);
			order.setTmoney(Double.parseDouble(o_money));
			order.setTnums(o_nums);
			order.setUser(user);
			CustomOrderDao.insertOrder(order);
			for (int i = 0; i < cids.length; i++) {
				CustomDao.delById(Integer.parseInt(cids[i]));
			}
		}
	}
}
