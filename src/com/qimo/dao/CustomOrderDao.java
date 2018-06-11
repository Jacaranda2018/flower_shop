package com.qimo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.qimo.bean.CustomOrder;
import com.qimo.bean.Flower;
import com.qimo.util.DBUtil;
import com.qimo.util.PreSql;

public class CustomOrderDao {
	public static ArrayList<CustomOrder> findById(int id) {
		Connection conn = DBUtil.getConn();
		ArrayList<CustomOrder> list = new ArrayList<CustomOrder>();
		String sql = "select * from customorders where tuid = ?";
		PreparedStatement state = PreSql.deal(conn, sql, id);
		try {
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				CustomOrder order = new CustomOrder();
				order.setTid(rs.getInt("tid"));
				order.setUser(UsersDao.getUser(rs.getInt("tuid")));
				order.setTnums(rs.getString("tnums"));
				order.setTmoney(rs.getDouble("tmoney"));
				order.setTfids(rs.getString("tfids"));
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static boolean insertOrder(CustomOrder order) {
		String sql = "insert into customorders(tuid,tfids,tnums,tmoney) values(?,?,?,?)";
		Connection conn = DBUtil.getConn();
		boolean flag = false;
		try {
			PreparedStatement state = conn.prepareStatement(sql);
			state.setInt(1, order.getUser().getId());
			state.setString(2, order.getTfids());
			state.setDouble(4, order.getTmoney());
			state.setString(3, order.getTnums());
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
