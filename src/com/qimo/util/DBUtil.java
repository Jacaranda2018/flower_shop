package com.qimo.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DBUtil {
	private static Connection conn;
	private static Properties pro = new Properties();
	private static String url;
	private static String username;
	private static String password;
	private static String driver;
	private static String DbName = "mysql";
	static {
		InputStream is = DBUtil.class.getResourceAsStream("db.properties");
		try {
			pro.load(is);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		driver = pro.getProperty(DbName+".driver");
		url = pro.getProperty(DbName+".url");
		username = pro.getProperty(DbName+".username");
		password = pro.getProperty(DbName+".password");

		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConn() {
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static synchronized Connection getCurrentConnection()
			throws SQLException {
		if (conn == null) {
			conn = DriverManager.getConnection(url, username, password);
		}
		return conn;
	}

	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void close(Connection conn, Statement stmt) {
		close(conn, stmt, null);
	}

	public static void close(Connection conn) {
		close(conn, null, null);
	}

	public static void close(Connection conn, PreparedStatement stmt,
			ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void close(Connection conn, PreparedStatement stmt) {
		close(conn, stmt, null);
	}

	public static void main(String[] args) {
		System.out.println(getConn());
	}

}
