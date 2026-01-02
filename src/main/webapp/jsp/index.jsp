<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Employee-portal</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="/employee-portal/CSS/style.css">
</head>
<body>
	<div class="container-fluid w-100 bg-palettes-beige vh-100">
        <div class="row">
            <div class="col-12 col-xl-4 py-2">
                <div class="bg-palettes-dark-green rounded-1 p-3 text-palettes-black">
                <div class="bg-palettes-light-green p-4 rounded">
                <c:set var="isUpdate" value="${employee != null}" />
                <h5 class="mb-4 fw-bolder">
                    <c:choose>
                        <c:when test="${isUpdate}">Edit employee details :</c:when>
                        <c:otherwise>Add employee details :</c:otherwise>
                    </c:choose>
                </h5>
                
                <form action="/employee-portal/InsertUpdateEmployeeServlet" method="post">
                    <input type="hidden" name="id" value="${isUpdate ? employee.id : 0}">
                    <div class="row mb-2">
                        <div class="col">
                            <label id="name" class="form-label">Name:</label>
                            <input type="text" class="form-control" name="name" value="${employee.name}" required/>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col">
                            <label id="email" class="form-label">Email:</label>
                            <input type="email" class="form-control" name="email" value="${employee.email}" required/>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col">
                            <label class="form-label">Gender:</label>
                            <div class="d-flex">
	                            <div class="form-check me-4">
			                        <input class="form-check-input" type="radio" name="gender" id="male" value="M" <c:if test="${employee.gender eq 'M'}">checked</c:if>>
			                        <label class="form-check-label" for="male">
			                            Male
			                        </label>
		                        </div>
		                        <div class="form-check">
		                            <input class="form-check-input" type="radio" name="gender" id="female" value="F" <c:if test="${employee.gender eq 'F'}">checked</c:if>>
		                            <label class="form-check-label" for="female">
		                                Female
		                            </label>
		                        </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col">
                            <label id="joiningDate" class="form-label">Joining Date:</label>
                            <input class="form-control" type="date" name="joiningDate" value="${employee.joiningDate}" required/>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-12 col-md-6">
                            <label class="form-label" id="age">Age:</label>
                            <input class="form-control" type="number" name="age" min="1" value="${employee.age}" required/>
                        </div>
                        <div class="col-12 col-md-6">
                            <label id="salary" class="form-label">Salary:</label>
                            <input class="form-control" type="number" name="salary" min="0" value="${employee.salary}"/>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col">
                            <div class="form-check">
	                            <label class="form-check-label" for="isFullTime">
	                                isFullTime
	                            </label>
	                            <input class="form-check-input" type="checkbox" name="isFullTime" id="isFullTime" value="1" ${employee.isFullTime ? 'checked' : ''}>
                        	</div>
                        </div>
                    </div>
                    <button type="submit" class="btn bg-palettes-beige">${isUpdate ? 'Update' : 'Add'} Employee</button>
                </form>
                </div>
            </div>
            </div>
            <div class="col-12 col-xl-8 py-2">
                <div class="bg-palettes-dark-green rounded-1 p-3 text-palettes-black h-100">
                	<h5 class="mb-4 fw-bolder p-2 bg-palettes-light-green rounded">All Employee Details :</h5>
                    <table class="table table-striped rounded overflow-hidden table-warning">
                        <thead>
                            <tr>
                                <th><small class="text-nowrap">ID</small></th>
                                <th><small class="text-nowrap">Name</small></th>
                                <th><small class="text-nowrap">Email</small></th>
                                <th><small class="text-nowrap">Age</small></th>
                                <th><small class="text-nowrap">Gender</small></th>
                                <th><small class="text-nowrap">Joining Date</small></th>
                                <th><small class="text-nowrap">Salary</small></th>
                                <th><small class="text-nowrap">IsFullTime</small></th>
                                <th><small class="text-nowrap">IsFullTime</small>x</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="employee" items="${employees}">
                                <tr>
                                    <td><small class="text-nowrap">${employee.id}</small></td>
                                    <td><small class="text-nowrap">${employee.name}</small></td>
                                    <td><small class="text-nowrap">${employee.email}</small></td>
                                    <td><small class="text-nowrap">${employee.age}</small></td>
                                    <td><small class="text-nowrap">
                                        <c:if test="${employee.gender == 'M'}">Male</c:if>
                                        <c:if test="${employee.gender == 'F'}">Female</c:if>
                                    </small></td>
                                    <td><small class="text-nowrap">${employee.joiningDate}</small></td>
                                    <td><small class="text-nowrap">${employee.salary}</small></td>
                                    <td><small class="text-nowrap">${employee.isFullTime}</small></td>
                                    <td>
                                        <a class="btn btn-success btn-sm" href="InsertUpdateEmployeeServlet?id=${employee.id}">Edit</a> |
                                        <a class="btn btn-danger btn-sm" href="/employee-portal/DeleteEmployeeServlet?id=${employee.id}">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div>
                        <a class="btn bg-palettes-beige" href="GetAllEmployeeServlet">Add new employee</a>
                    </div>
                </div>
            </div>
        </div>
    </div>	
</body>
</html>