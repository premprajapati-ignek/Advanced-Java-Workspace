package com.ignek.model;

import java.sql.Date;

public class Employee {
	private int id;
	private String name;
	private String email;
	private int age;
	private String gender;
	private Date joiningDate;
	private double salary;
	private boolean isFullTime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return this.gender;
	}
	public void setGender(String gender) {	
		this.gender = gender;
	}
	public Date getJoiningDate() {
		return joiningDate;
	}
	public void setJoiningDate(Date joiningDate) {
		this.joiningDate = joiningDate;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public boolean getIsFullTime() {
		return isFullTime;
	}
	public void setFullTime(boolean isFullTime) {
		this.isFullTime = isFullTime;
	}
}