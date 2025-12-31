package com.ignek.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import com.ignek.constant.EmployeeConstant;
import com.ignek.dao.EmployeeDao;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LogManager.getLogger(DeleteEmployeeServlet.class.getName());
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int employeeId = Integer.parseInt(request.getParameter(EmployeeConstant.ID));
			int status = EmployeeDao.deleteEmployee(employeeId);
			if(status > 0) {
				response.sendRedirect(request.getContextPath() + "/GetAllEmployeeServlet");
			} else {
				logger.info("Sorry, unable to delete record");
			}
		} catch (Exception e) {
			logger.error("Unexcepted error occred in DeleteEmployeeServlet");
			e.printStackTrace();
		}
	}
}
