package com.ignek.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import com.ignek.constant.EmployeeConstant; 
import com.ignek.dao.EmployeeDao; 
import com.ignek.model.Employee; 

@WebServlet("/InsertUpdateEmployeeServlet")
public class InsertUpdateEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LogManager.getLogger(InsertUpdateEmployeeServlet.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int employeeId = Integer.parseInt(request.getParameter(EmployeeConstant.ID));
            
            Employee employee = EmployeeDao.getEmployeeById(employeeId);
            request.setAttribute(EmployeeConstant.EMPLOYEE, employee);

            List<Employee> employees = EmployeeDao.getAllEmployees();
            request.setAttribute(EmployeeConstant.EMPLOYEES, employees);
            
            LocalDate date = LocalDate.now();
			request.setAttribute(EmployeeConstant.DATE, date);

            request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
        } catch (Exception e) {
        	logger.error("Unexcepted error occred in InsertUpdateEmployeeServlet get-request");
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try {
            String id = request.getParameter(EmployeeConstant.ID);
            String name = request.getParameter(EmployeeConstant.NAME);
            String email = request.getParameter(EmployeeConstant.EMAIL);
            int age = Integer.parseInt(request.getParameter(EmployeeConstant.AGE));
            String gender = request.getParameter(EmployeeConstant.GENDER);
            Date joining_date = Date.valueOf(request.getParameter(EmployeeConstant.JOINING_DATE));
            double salary = Double.parseDouble(request.getParameter(EmployeeConstant.SALARY));
            boolean isFullTime = request.getParameter(EmployeeConstant.IS_FULL_TIME) != null;

            Employee employee = new Employee();
            employee.setName(name);
            employee.setEmail(email);
            employee.setAge(age);
            employee.setGender(gender);
            employee.setJoiningDate(joining_date);
            employee.setSalary(salary);
            employee.setFullTime(isFullTime);

            int status = 0;
            if (!id.equals("0")) {
                int intId = Integer.parseInt(id); 
                employee.setId(intId);
                status = EmployeeDao.updateEmployee(employee);
            } else {
                status = EmployeeDao.insertEmployee(employee);
            }

            if (status > 0) {
                response.sendRedirect(request.getContextPath() + "/GetAllEmployeeServlet"); 
            } else {
            	logger.info("Sorry, unable to save/update record");
            }
        } catch (Exception e) {
        	logger.error("Unexcepted error occred in InsertUpdateEmployeeServlet post-request");
            e.printStackTrace();
        }
    }
}
