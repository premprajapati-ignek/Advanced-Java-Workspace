package com.ignek.connection;

import java.sql.*;
import com.ignek.constant.EmployeeConstant;

public class DbConnection {
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName(EmployeeConstant.DRIVER);
			connection = DriverManager.getConnection(EmployeeConstant.PATH, EmployeeConstant.USER_NAME, EmployeeConstant.PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}
