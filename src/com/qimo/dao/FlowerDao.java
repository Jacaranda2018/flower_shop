package com.qimo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.qimo.bean.Flower;
import com.qimo.util.DBUtil;
import com.qimo.util.PreSql;

public class FlowerDao {
	/**
	 * 根据id查询
	 */
	public static Flower getById(int id) {
		Connection conn = DBUtil.getConn();
		Flower flower = new Flower();
		String sql = "select * from flower where f_number = ?";
		PreparedStatement state = PreSql.deal(conn, sql, id);
		try {
			ResultSet rs = state.executeQuery();
			if (rs.next()) {
				flower.setClassify(ClassifyDao.getById(rs.getInt("cid")));
				flower.setF_color(rs.getString("f_color"));
				flower.setF_id(id);
				flower.setF_message(rs.getString("f_message"));
				flower.setF_name(rs.getString("f_name"));
				flower.setF_picture(rs.getString("f_picture"));
				flower.setF_place(rs.getString("f_place"));
				flower.setF_price(rs.getDouble("f_price"));
				flower.setF_stock(rs.getInt("f_stock"));
				flower.setRecommend(rs.getInt("recommend"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flower;
	}

	/**
	 * 查询所有的
	 */
	public static ArrayList<Flower> getAll() {
		Connection conn = DBUtil.getConn();
		ArrayList<Flower> list = new ArrayList<Flower>();
		String sql = "select * from flower";
		PreparedStatement state = PreSql.deal(conn, sql);
		try {
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				Flower flower = new Flower();
				flower.setClassify(ClassifyDao.getById(rs.getInt("cid")));
				flower.setF_color(rs.getString("f_color"));
				flower.setF_id(rs.getInt("f_number"));
				flower.setF_message(rs.getString("f_message"));
				flower.setF_name(rs.getString("f_name"));
				flower.setF_picture(rs.getString("f_picture"));
				flower.setF_place(rs.getString("f_place"));
				flower.setF_price(rs.getDouble("f_price"));
				flower.setF_stock(rs.getInt("f_stock"));
				flower.setRecommend(rs.getInt("recommend"));
				list.add(flower);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static ArrayList<Flower> getAllByCid(int cid) {
		Connection conn = DBUtil.getConn();
		ArrayList<Flower> list = new ArrayList<Flower>();
		String sql = "select * from flower where cid = ?";
		PreparedStatement state = PreSql.deal(conn, sql, cid);
		try {
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				Flower flower = new Flower();
				flower.setClassify(ClassifyDao.getById(rs.getInt("cid")));
				flower.setF_color(rs.getString("f_color"));
				flower.setF_id(rs.getInt("f_number"));
				flower.setF_message(rs.getString("f_message"));
				flower.setF_name(rs.getString("f_name"));
				flower.setF_picture(rs.getString("f_picture"));
				flower.setF_place(rs.getString("f_place"));
				flower.setF_price(rs.getDouble("f_price"));
				flower.setF_stock(rs.getInt("f_stock"));
				flower.setRecommend(rs.getInt("recommend"));
				list.add(flower);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static ArrayList<Flower> findByCondition(String condition) {
		Connection conn = DBUtil.getConn();
		ArrayList<Flower> list = new ArrayList<Flower>();
		String sql = "select * from flower where f_name like '%" + condition
				+ "%' or f_color like '%" + condition + "%' or f_place like '%"
				+ condition + "%'";
		//System.out.println(sql);
		PreparedStatement state = PreSql.deal(conn, sql);
		try {
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				Flower flower = new Flower();
				flower.setClassify(ClassifyDao.getById(rs.getInt("cid")));
				flower.setF_color(rs.getString("f_color"));
				flower.setF_id(rs.getInt("f_number"));
				flower.setF_message(rs.getString("f_message"));
				flower.setF_name(rs.getString("f_name"));
				flower.setF_picture(rs.getString("f_picture"));
				flower.setF_place(rs.getString("f_place"));
				flower.setF_price(rs.getDouble("f_price"));
				flower.setF_stock(rs.getInt("f_stock"));
				flower.setRecommend(rs.getInt("recommend"));
				list.add(flower);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
