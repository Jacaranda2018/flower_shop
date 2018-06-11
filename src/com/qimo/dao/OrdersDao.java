package com.qimo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.qimo.bean.Flower;
import com.qimo.bean.Orders;
import com.qimo.util.DBUtil;
import com.qimo.util.PreSql;

public class OrdersDao {

	public static ArrayList<Orders> findById(int id) {
		Connection conn = DBUtil.getConn();
		ArrayList<Orders> list = new ArrayList<Orders>();
		String sql = "select * from orders where o_uid = ?";
		PreparedStatement state = PreSql.deal(conn, sql, id);
		try {
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				Orders order = new Orders();
				order.setOid(rs.getInt("oid"));
				order.setUser(UsersDao.getUser(rs.getInt("o_uid")));
				order.setO_nums(rs.getString("o_nums"));
				order.setO_money(rs.getDouble("o_money"));
				order.setO_dids(rs.getString("o_dids"));
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static boolean insertOrder(Orders order) {
		String sql = "insert into orders(o_uid,o_dids,o_nums,o_money) values(?,?,?,?)";
		Connection conn = DBUtil.getConn();
		boolean flag = false;
		try {
			PreparedStatement state = conn.prepareStatement(sql);
			state.setInt(1, order.getUser().getId());
			state.setString(2, order.getO_dids());
			state.setDouble(4, order.getO_money());
			state.setString(3, order.getO_nums());
			flag = state.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public static ArrayList<Flower> getDishesByDids(String dids) {
		ArrayList<Flower> list = new ArrayList<Flower>();
		String[] str = dids.split(",");
		for (int i = 0; i < str.length; i++) {
			list.add(FlowerDao.getById(Integer.parseInt(str[i])));
		}
		return list;
	}

	public static String[] getNums(String nums) {
		return nums.split(",");
	}
}
