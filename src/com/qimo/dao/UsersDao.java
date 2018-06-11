package com.qimo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.mail.Flags.Flag;

import com.qimo.bean.Users;
import com.qimo.util.DBUtil;

public class UsersDao {
	// 根据ID得到User
	public static Users getUser(int id) {
		Users user = new Users();
		Connection conn = DBUtil.getConn();
		String sql = "select * from user where id = ?";
		try {
			PreparedStatement state = conn.prepareStatement(sql);
			state.setInt(1, id);
			ResultSet rs = state.executeQuery();
			if (rs.next()) {
				user.setId(rs.getInt("id"));
				user.setLogname(rs.getString("logname"));
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getString("phone"));
				user.setRealname(rs.getString("realname"));
				user.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public static boolean update(Users user){
		boolean flag =false;
		String sql = "update user set logname = ? , password = ? ,phone = ? , address = ?,realname = ? where id = ?";
		try {
			Connection conn = DBUtil.getConn();
			PreparedStatement state = conn.prepareStatement(sql);
			state.setString(1, user.getLogname());
			state.setString(2, user.getPassword());
			state.setString(3, user.getPhone());
			state.setString(4, user.getAddress());
			state.setString(5, user.getRealname());
			state.setInt(6, user.getId());
			flag = state.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
}
