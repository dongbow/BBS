package cn.ifxcode.bbs.dao.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.google.common.collect.Maps;

import cn.ifxcode.bbs.utils.PropertiesUtils;

public class DbConn {

	private Logger logger = LoggerFactory.getLogger(DbConn.class);
	
	private static DbConn dbConn;
	
	private DataSource dataSource;
	
	private DbConn() {}
	
	public synchronized static DbConn getInstance() {
		if (dbConn == null) {
			dbConn = new DbConn();
		}
		return dbConn;
	}

	public DataSource getDataSource() {
		if (dataSource == null) {
			try {
				dataSource = DruidDataSourceFactory.createDataSource(getJdbc());
			} catch (Exception e) {
				logger.error("datasource create fail", e);
			}
		}
		return dataSource;
	}
	
	public Map<String, String> getJdbc() {
		Map<String, String> jdbc = Maps.newHashMap();
		jdbc.put("driverClassName", PropertiesUtils.getValue("jdbc.driver"));
		jdbc.put("url", PropertiesUtils.getValue("jdbc.url"));
		jdbc.put("username", PropertiesUtils.getValue("jdbc.username"));
		jdbc.put("password", PropertiesUtils.getValue("jdbc.password"));
		jdbc.put("initialSize", PropertiesUtils.getValue("jdbc.initialSize"));
		jdbc.put("minIdle", PropertiesUtils.getValue("jdbc.minIdle"));
		jdbc.put("maxActive", PropertiesUtils.getValue("jdbc.maxActive"));
		jdbc.put("maxWait", PropertiesUtils.getValue("jdbc.maxWait"));
		jdbc.put("timeBetweenEvictionRunsMillis", "60000");
		jdbc.put("minEvictableIdleTimeMillis", "300000");
		jdbc.put("validationQuery", "SELECT 'x'");
		jdbc.put("testWhileIdle", "true");
		jdbc.put("testOnBorrow", "false");
		jdbc.put("testOnReturn", "false");
		jdbc.put("poolPreparedStatements", "true");
		jdbc.put("maxPoolPreparedStatementPerConnectionSize", "20");
		jdbc.put("filters", "stat");
		return jdbc;
		
	}
	
	public Connection getConnection() {
		Connection connection = null;
		try {
			connection = getDataSource().getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public PreparedStatement PreparedStatement(Connection conn, String sql) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pstmt;
	}
	
}
