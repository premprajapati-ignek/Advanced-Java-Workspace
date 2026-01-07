package com.ignek.constant;

public class EmployeeConstant {
	public static String DRIVER = "com.mysql.cj.jdbc.Driver";
	public static String PATH = "jdbc:mysql://localhost:3306/employeedb";
	public static String USER_NAME = "prem";
	public static String PASSWORD = "password";
	public static String INSERT = "insert into employees(name, email, age, gender, joining_date, salary, isFullTime) values(?, ?, ?, ?, ?, ?, ?)";
	public static String SELECT_EMPLOYEES = "select * from employees";
	public static String SELECT_BY_ID = "select * from employees where id=?";
	public static String UPDATE_BY_ID = "update employees set name=?, email=?, age=?, gender=?, joining_date=?, salary=?, isFullTime=? where id=?";
	public static String DELETE_BY_ID = "delete from employees where id=?";
	public static String EMPLOYEE = "employee";
	public static String EMPLOYEES = "employees";
	public static String ID = "id";
	public static String NAME = "name";
	public static String EMAIL = "email";
	public static String AGE = "age";
	public static String GENDER = "gender";
	public static String JOINING_DATE = "joiningDate";
	public static String SALARY = "salary";
	public static String IS_FULL_TIME = "isFullTime";
	public static String DATE = "date";
}
