<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User Registration</title>
</head>
<body style="color:white;">
	<div class="container">
	<c:if test="${displaySuccessRegistered == true}">
	<div class="alert alert-success"><strong>Registration successfull</strong></div>
	</c:if>
		<div class="panel-body">
			<form:form class="form-horizontal" role="form" method="post"
				commandName="user" action="user/register">
				<div class="form-group">
					<label class="control-label col-sm-2" for="useremail">Email</label>
					<div class="col-sm-10">
						<form:input path="useremail" type="email" class="form-control"
							id="useremail" placeholder="Enter your email id" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="userphone">Contact
						No:</label>
					<div class="col-sm-10">
						<form:input path="usercontact" type="text" class="form-control"
							title="Enter your mobile number" id="usercontact"
							name="usercontact" placeholder="Enter Contact Number" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="userphone">First
						Name</label>
					<div class="col-sm-10">
						<form:input path="first_name" type="text" class="form-control"
							title="Enter your First Name" id="first_name" name="first_name"
							placeholder="Enter your First Name" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="userphone">Last
						Name</label>
					<div class="col-sm-10">
						<form:input path="last_name" type="text" class="form-control"
							title="Enter your Last Name" id="last_name" name="last_name"
							placeholder="Enter your Last Name" />
					</div>
				</div>
				<div class="form-group ">
					<label for="gender" class="control-label col-sm-2">Gender</label>
					<div class="col-sm-offset-1 col-sm-9">
						<label for="maleGender" class="radio-inline  label-control"><form:radiobutton
								path="gender" name="gender" id="maleGender" required="true"
								value="Male" />Male</label> <label for="femaleGender"
							class="radio-inline label-control"> <form:radiobutton
								path="gender" name="gender" id="femaleGender" value="Female" />Female
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="password">Password</label>
					<div class="col-sm-10">
						<form:input path="password" type="password" class="form-control"
							id="password" placeholder="Enter password" name="password" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="password">Address</label>
					<div class="col-sm-10">
						<form:input path="address" type="text" class="form-control"
							id="address" placeholder="Enter address" name="address" />
					</div>
				</div>

				<input type="submit" value="Sign Up"
					class="col-sm-offset-2 btn btn-danger btn-md">
			</form:form>
		</div>
	</div>
</body>
</html>

