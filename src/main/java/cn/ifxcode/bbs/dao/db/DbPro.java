package cn.ifxcode.bbs.dao.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

public abstract class DbPro<T> {

	public Connection conn;
	public PreparedStatement pstmt;
	
	public void init(String sql) {
		DbConn dbConn = DbConn.getInstance();
		conn = dbConn.getConnection();
		pstmt = dbConn.PreparedStatement(conn, sql);
	}
	
	public abstract int batchSave(List<T> list, Object... objects);

}
