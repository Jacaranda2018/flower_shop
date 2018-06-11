package com.qimo.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qimo.bean.Cart;
import com.qimo.bean.Users;
import com.qimo.dao.CartDao;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {
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
		if (action.equals("updateCart")) {
			String cid = request.getParameter("cid");
			String num = request.getParameter("num");
			String money = request.getParameter("money");
			CartDao.updateOnes(user.getId(), Integer.parseInt(cid),
					Integer.parseInt(num), Double.parseDouble(money));
		} else if (action.equals("deleteCart")) {
			String id = request.getParameter("cid");
			int cid = Integer.parseInt(id);
			CartDao.delById(cid);
			ArrayList<Cart> cartss = CartDao.findByUid(user.getId());
			request.setAttribute("cartss", cartss);
			response.sendRedirect("lookShoppingCar.jsp");
		}
	}
}
