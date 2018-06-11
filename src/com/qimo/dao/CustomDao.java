package com.qimo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.qimo.bean.Custom;
import com.qimo.bean.Flower;
import com.qimo.util.DBUtil;

public class CustomDao {
	// 判断定制表中是否有此记录
	public static boolean judge(int uid, int bid) {
		Connection conn = DBUtil.getConn();
		String sql = "select * from custom where cuid = ? and cfid = ?";
		boolean flag = false;
		try {
			PreparedStatement state = conn.prepareStatement(sql);
			state.setInt(1, uid);
			state.setInt(2, bid);
			ResultSet rs = state.executeQuery();
			Custom c = new Custom();
			if (rs.next()) {
				c.setCid(rs.getInt("cid"));
			}
			if (c.getCid() != 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	// 修改一条新的记录
	public static boolean updateOne(int uid, int bid, int cnum) {
		Connection conn = DBUtil.getConn();
		Flower product = FlowerDao.getById(bid);
		String sql = "update custom set cnum = cnum+1 ,cmoney = ? where cuid = ? and cfid = ?";
		boolean flag = false;
		try {
			PreparedStatement state = conn.prepareStatement(sql);
			state.setDouble(1, product.getF_price() * (cnum + 1));
			state.setInt(2, uid);
			state.setInt(3, bid);
			flag = state.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public static boolean updateOnes(int uid, int cid, int cnum, double money) {
		Connection conn = DBUtil.getConn();
		String sql = "update custom set cnum = ? ,cmoney = ? where cuid = ? and cid = ?";
		boolean flag = false;
		try {
			PreparedStatement state = conn.prepareStatement(sql);
			state.setInt(1, cnum);
			state.setDouble(2, money);
			state.setInt(3, uid);
			state.setInt(4, cid);
			flag = state.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	// 添加一条新的记录
	public static boolean insertOne(Custom c) {
		String sql = "insert into custom(cfid,cnum,cmoney,cuid) values(?,?,?,?)";
		Connection conn = DBUtil.getConn();
		boolean flag = false;
		try {
			PreparedStatement state = conn.prepareStatement(sql);
			state.setInt(1, c.getFlower().getF_id());
			state.setInt(2, c.getNum());
			state.setDouble(3, c.getMoney());
			state.setInt(4, c.getUser().getId());
			flag = state.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	// 根据用户ID查询该用户下的购物车
	public static ArrayList<Custom> findByUid(int uid) {
		Connection conn = DBUtil.getConn();
		String sql = "select * from custom where cuid = ?";
		ArrayList<Custom> Customs = new ArrayList<Custom>();
		try {
			PreparedStatement state = conn.prepareStatement(sql);
			state.setInt(1, uid);
			ResultSet rs = state.executeQuery();
			while (rs.next()) {
				Custom c = new Custom();
				c.setCid(rs.getInt("cid"));
				try {
					c.setUser(UsersDao.getUser(rs.getInt("cuid")));
				} catch (Exception e) {
					e.printStackTrace();
				}
				c.setFlower(FlowerDao.getById(rs.getInt("cfid")));
				c.setMoney(rs.getDouble("cmoney"));
				c.setNum(rs.getInt("cnum"));
				Customs.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Customs;
	}

	// 根据用户ID，书编号，得到该用户购物车数量
	public static int findNum(int uid, int bid) {
		Connection conn = DBUtil.getConn();
		String sql = "select cnum from custom where cuid = ? and cfid = ?";
		Custom c = new Custom();
		try {
			PreparedStatement state = conn.prepareStatement(sql);
			state.setInt(1, uid);
			state.setInt(2, bid);
			ResultSet rs = state.executeQuery();
			if (rs.next()) {
				c.setNum(rs.getInt("cnum"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c.getNum();
	}

	// 删除
	public static boolean delById(int cid) {
		Connection conn = DBUtil.getConn();
		String sql = "delete from custom where cid = ?";
		boolean flag = false;
		try {
			PreparedStatement state = conn.prepareStatement(sql);
			state.setInt(1, cid);
			flag = state.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	// 根据cid和cuid修改数量和金额
	public static boolean updateCustom(int cid, int cnum, double cmoney, int cuid) {
		Connection conn = DBUtil.getConn();
		String sql = "update custom set cnum = ?,cmoney = ? where cid = ? and cuid = ?";
		boolean flag = false;
		try {
			PreparedStatement state = conn.prepareStatement(sql);
			state.setInt(1, cnum);
			state.setDouble(2, cmoney);
			state.setInt(3, cid);
			state.setInt(4, cuid);
			flag = state.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	// 根据cid得到bid
	public static int findBid(int cid) {
		Connection conn = DBUtil.getConn();
		String sql = "select * from custom where cid = ?";
		Custom c = new Custom();
		try {
			PreparedStatement state = conn.prepareStatement(sql);
			state.setInt(1, cid);
			ResultSet rs = state.executeQuery();
			if (rs.next()) {
				int bid = rs.getInt("cfid");
				Flower product = new Flower();
				product.setF_id(bid);
				c.setFlower(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c.getFlower().getF_id();
	}
}
