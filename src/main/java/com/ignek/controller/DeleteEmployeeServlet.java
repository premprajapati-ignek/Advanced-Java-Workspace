package com.ignek.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import com.ignek.constant.EmployeeConstant;
import com.ignek.dao.EmployeeDao;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			int employeeId = Integer.parseInt(request.getParameter(EmployeeConstant.ID));
			int status = EmployeeDao.deleteEmployee(employeeId);
			
			if(status > 0) {
				response.sendRedirect(request.getContextPath() + "/GetAllEmployeeServlet");
			}
			else {
				out.print("<h4>Sorry, unable to delete record</h4>");
			}
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
