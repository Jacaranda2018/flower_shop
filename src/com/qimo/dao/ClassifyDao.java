package com.qimo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.qimo.bean.Classify;
import com.qimo.util.DBUtil;
import com.qimo.util.PreSql;

public class ClassifyDao {
	/**
	 * 根据id查询
	 */
	public static Classify getById(int id) {
		Connection conn = DBUtil.getConn();
		Classify classify = new Classify();
		String sql = "select * from classify where id = ?";
		PreparedStatement state = PreSql.deal(conn, sql, id);
		try {
			ResultSet rs = state.executeQuery();
			if(rs.next()){
				classify.setId(rs.getInt("id"));
				classify.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return classify;
	}
	
	/**
	 * 查询所有的
	 */
	public static ArrayList<Classify> getAll(){
		Connection conn = DBUtil.getConn();
		ArrayList<Classify> list = new ArrayList<Classify>();
		String sql = "select * from classify";
		PreparedStatement state = PreSql.deal(conn, sql);
		try {
			ResultSet rs = state.executeQuery();
			while(rs.next()){
				Classify classify = new Classify();
				classify.setId(rs.getInt("id"));
				classify.setName(rs.getString("name"));
				list.add(classify);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
