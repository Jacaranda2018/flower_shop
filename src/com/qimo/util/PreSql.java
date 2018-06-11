package com.qimo.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PreSql {
	public static PreparedStatement deal(Connection conn, String sql,
			Object... obj) {
		PreparedStatement state = null;
		try {
			state = conn.prepareStatement(sql);
			for (int i = 0; i < obj.length; i++) {
				state.setObject(i + 1, obj[i]);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return state;
	}
}
