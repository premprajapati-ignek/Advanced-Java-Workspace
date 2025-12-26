<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/employee-portal/CSS/styles.css">
<title>Employee-portal</title>
</head>

<body>
<div class="outerContainer">

	<div class="innerContainer1">		
		<c:set var="isUpdate" value="${employee != null}" />
		
		<h3>
			<c:choose>
       			<c:when test="${isUpdate}">Edit employee details :</c:when>
       			<c:otherwise>Add employee details :</c:otherwise>
   			</c:choose>
		</h3>
		
		<form action="/employee-portal/InsertUpdateEmployeeServlet" method="post">
		
		    <input type="hidden" name="id" value="${isUpdate ? employee.id : 0}">
		
		    <label>Name:</label>
		    <input type="text" name="name" value="${employee.name}" required/>
		    <br><br>
		
		    <label>Email:</label>
		    <input type="email" name="email" value="${employee.email}" required/>
		    <br><br>
		
		    <label>Age:</label>
		    <input type="number" name="age" min="1" value="${employee.age}" required/>
		    <br><br>
		
		    <label>Gender:</label>
		    <input type="radio" name="gender" value="M" <c:if test="${employee.gender eq 'M'}">checked</c:if>> Male
			<input type="radio" name="gender" value="F" <c:if test="${employee.gender eq 'F'}">checked</c:if>> Female
		    <br><br>
		
		    <label>Joining Date:</label>
		    <input type="date" name="joiningDate" value="${employee.joiningDate}" required/>
		    <br><br>
		
		    <label>Salary:</label>
		    <input type="number" name="salary" min="0" value="${employee.salary}"/>
		    <br><br>
		
		    <label>isFullTime:</label>
		    <input type="checkbox" name="isFullTime" value="1" ${employee.isFullTime ? 'checked' : ''}/>
		    <br><br>
		
		    <button type="submit">${isUpdate ? 'Update' : 'Add'} Employee</button>
		
		</form>
	</div>
	<div class="innerContainer2">
		<h3>All Employee Details :</h3>
		
		<table border="1">
		<tr>
		    <th>ID</th>
		    <th>Name</th>
		    <th>Email</th>
		    <th>Age</th>
		    <th>Gender</th>
		    <th>Joining Date</th>
		    <th>Salary</th>
		    <th>IsFullTime</th>
		    <th>Action</th>
		</tr>
		
		<c:forEach var="employee" items="${employees}">
			<tr>
			    <td>${employee.id}</td>
			    <td>${employee.name}</td>
			    <td>${employee.email}</td>
			    <td>${employee.age}</td>
			    <td>
			    	<c:if test="${employee.gender == 'M'}">Male</c:if>
			    	<c:if test="${employee.gender == 'F'}">Female</c:if>
			    </td>
			    <td>${employee.joiningDate}</td>
			    <td>${employee.salary}</td>
			    <td>${employee.isFullTime}</td>
			    <td>
			        <a href="InsertUpdateEmployeeServlet?id=${employee.id}">Edit</a> |
			        <a href="/employee-portal/DeleteEmployeeServlet?id=${employee.id}">Delete</a>
			    </td>
			</tr>
		</c:forEach>
		</table>
		
		<br/>
		<div>
		    <a href="GetAllEmployeeServlet">Add new employee</a>
		</div>
	</div>
</div>
</body>
</html>