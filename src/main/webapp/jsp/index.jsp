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
<body class="bg-palettes-dark-green">
	<div class="container-fluid">
        <div class="row">
            <div class="col-12 col-xl-4 py-2">
                <div class="bg-palettes-light-green rounded-1 p-3 ">
                <div class="bg-palettes-beige p-4 rounded">
                <c:set var="isUpdate" value="${employee != null}" />
                <h5 class="mb-4 fw-bolder">
                    <c:choose>
                        <c:when test="${isUpdate}">Edit employee details :</c:when>
                        <c:otherwise>Add employee details :</c:otherwise>
                    </c:choose>
                </h5>
                
               <form class="row g-2 needs-validation" action="/employee-portal/InsertUpdateEmployeeServlet" method="post" novalidate>
                    <input type="hidden" name="id" value="${isUpdate ? employee.id : 0}">
                        <div class="col-12">
                            <label for="name" class="form-label">Name:</label>
                            <input type="text" class="form-control" id="name" name="name" pattern="[a-zA-Z]+s" minlength="3" maxlength="50" value="${employee.name}" required/>
                            <div class="valid-feedback">Name looks good!</div>
                            <div class="invalid-feedback">please enter name / please enter valid name</div>
                        </div>
                        <div class="col-12">
                            <label for="email"  class="form-label">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" maxlength="100" placeholder="abc@example.com" pattern=".+@.+\.com" value="${employee.email}" required/>
                            <div class="valid-feedback">email looks good!</div>
                            <div class="invalid-feedback">please enter email / please enter valid email</div>
                        </div>
                        <div class="col-12">
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
                        <div class="col-12">
                            <label for="joiningDate" class="form-label">Joining Date:</label>
                            <input class="form-control" type="date" id="joiningDate" name="joiningDate" max="${date}" value="${employee.joiningDate}" required/>
                            <div class="invalid-feedback">Please choose a date.</div>
                        </div>
                        <div class="col-md-6">
                            <label for="age" class="form-label">Age:</label>
                            <input class="form-control" id="age" type="number" name="age" min="18" max="55" value="${employee.age}" required/>
                            <div class="invalid-feedback">please enter age / please enter valid age</div>
                        </div>
                        <div class="col-md-6">
                            <label for="salary" class="form-label">Salary:</label>
                            <input class="form-control" type="number" id="salary" name="salary" min="5000" value="${employee.salary}" required/>
                            <div class="invalid-feedback">please enter salary / please enter valid salary</div>
                        </div>
                        <div class="col-12">
                            <div class="form-check">
	                            <label class="form-check-label" for="isFullTime">
	                                Full-time
	                            </label>
	                            <input class="form-check-input" type="checkbox" name="isFullTime" id="isFullTime" value="1" ${employee.isFullTime ? 'checked' : ''}>
                        	</div>
                        </div>
                    <button type="submit" class="btn bg-palettes-dark-green col-12 text-white">${isUpdate ? 'Update' : 'Add'} Employee</button>
                </form>
                </div>
            </div>
            </div>
            <div class="col-12 col-xl-8 py-2">
                <div class="bg-palettes-light-green rounded-1 p-3  h-100">
                	<h5 class="mb-4 fw-bolder p-2 bg-palettes-beige rounded">All Employee Details :</h5>
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
                                    <td><small class="text-nowrap">
                                    	<c:if test="${employee.isFullTime == true}">Yes</c:if>
                                        <c:if test="${employee.isFullTime == false}">No</c:if>
                                        </small></td>
                                    <td>
                                        <a class="btn btn-success btn-sm" href="InsertUpdateEmployeeServlet?id=${employee.id}">Edit</a> |
                                        <a class="btn btn-danger btn-sm" href="DeleteEmployeeServlet?id=${employee.id}">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div>
                        <a class="btn bg-palettes-dark-green text-white" href="GetAllEmployeeServlet">Add new employee</a>
                    </div>
                </div>
            </div>
        </div>
    </div>	
</body>
<script>
//Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</html>