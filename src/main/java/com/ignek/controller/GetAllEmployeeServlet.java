package com.ignek.controller;

import com.ignek.constant.EmployeeConstant;
import com.ignek.dao.EmployeeDao;
import com.ignek.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/GetAllEmployeeServlet")
public class GetAllEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Employee> employees = EmployeeDao.getAllEmployees();
		request.setAttribute(EmployeeConstant.EMPLOYEES, employees);
		request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
	}
}