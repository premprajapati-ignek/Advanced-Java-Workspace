package com.ignek.controller;

import com.ignek.constant.EmployeeConstant;
import com.ignek.dao.EmployeeDao;
import com.ignek.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet("/GetAllEmployeeServlet")
public class GetAllEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LogManager.getLogger(GetAllEmployeeServlet.class.getName());

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<Employee> employees = EmployeeDao.getAllEmployees();
			request.setAttribute(EmployeeConstant.EMPLOYEES, employees);
			request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
		} catch (Exception e) {
			logger.error("Unexcepted error occred in GetAllEmployeeServlet");
			e.printStackTrace();
		}
	}
}