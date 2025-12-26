package com.ignek.dao;

import com.ignek.connection.DbConnection;
import com.ignek.constant.EmployeeConstant;
import com.ignek.model.Employee;
import java.sql.*;
import java.util.*;

public class EmployeeDao {
	public static int insertEmployee(Employee employee) {
		int status = 0;
		try {
			Connection connection = DbConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(EmployeeConstant.INSERT);
			preparedStatement.setString(1, employee.getName());
			preparedStatement.setString(2, employee.getEmail());
			preparedStatement.setInt(3, employee.getAge());
			preparedStatement.setString(4, employee.getGender());
			preparedStatement.setDate(5, employee.getJoiningDate());
			preparedStatement.setDouble(6, employee.getSalary());
			preparedStatement.setBoolean(7, employee.getIsFullTime());
			status = preparedStatement.executeUpdate();
			preparedStatement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static List<Employee> getAllEmployees(){
		List<Employee> employeeList = new ArrayList<>();
		try {
			Connection connection = DbConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(EmployeeConstant.SELECT_EMPLOYEES);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Employee employee = new Employee();
				employee.setId(resultSet.getInt(1));
				employee.setName(resultSet.getString(2));
				employee.setEmail(resultSet.getString(3));
				employee.setAge(resultSet.getInt(4));
				employee.setGender(resultSet.getString(5));
				employee.setJoiningDate(resultSet.getDate(6));
				employee.setSalary(resultSet.getDouble(7));
				employee.setFullTime(resultSet.getBoolean(8));
				employeeList.add(employee);
			}
			resultSet.close();
			preparedStatement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return employeeList;
	}
	
	public static Employee getEmployeeById(int employeeId) {
		Employee employee = new Employee();
		try {
			Connection connection = DbConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(EmployeeConstant.SELECT_BY_ID);
			preparedStatement.setInt(1, employeeId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				employee.setId(resultSet.getInt(1));
				employee.setName(resultSet.getString(2));
				employee.setEmail(resultSet.getString(3));
				employee.setAge(resultSet.getInt(4));
				employee.setGender(resultSet.getString(5));
				employee.setJoiningDate(resultSet.getDate(6));
				employee.setSalary(resultSet.getDouble(7));
				employee.setFullTime(resultSet.getBoolean(8));
			}
			resultSet.close();
			preparedStatement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return employee;
	}
	
	public static int updateEmployee(Employee employee) {
		int status = 0;
		try {
			Connection connection = DbConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(EmployeeConstant.UPDATE_BY_ID);
			preparedStatement.setString(1, employee.getName());
			preparedStatement.setString(2, employee.getEmail());
			preparedStatement.setInt(3, employee.getAge());
			preparedStatement.setString(4, employee.getGender());
			preparedStatement.setDate(5, employee.getJoiningDate());
			preparedStatement.setDouble(6, employee.getSalary());
			preparedStatement.setBoolean(7, employee.getIsFullTime());
			preparedStatement.setInt(8, employee.getId());
			status = preparedStatement.executeUpdate();
			preparedStatement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static int deleteEmployee(int employeeId) {
	    int status = 0;
	    try {
	        Connection connection = DbConnection.getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement(EmployeeConstant.DELETE_BY_ID);
	        preparedStatement.setInt(1, employeeId);
	        status = preparedStatement.executeUpdate();
	        preparedStatement.close();
	        connection.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return status;
	}
}
