package com.ignek.connection;

import java.sql.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import com.ignek.constant.EmployeeConstant;

public class DbConnection {
	private static final Logger logger = LogManager.getLogger();
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName(EmployeeConstant.DRIVER);
			connection = DriverManager.getConnection(EmployeeConstant.PATH, EmployeeConstant.USER_NAME, EmployeeConstant.PASSWORD);
			logger.info("Database connection established successfully");
		} catch (Exception e) {
			logger.error("Error connecting to the database.");
			e.printStackTrace();
		}
		return connection;
	}
}
