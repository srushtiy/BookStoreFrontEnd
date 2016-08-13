<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<body style="color:white;">

	<h2 style="text-align: center">Login to your Elixir Account!</h2>
	<br> ${message}
	<c:url var="action" value="loginHere"></c:url>
	
	<div class="container">
		<div class="panel-body">
			<form:form class="form-horizontal" role="form" method="post"
				commandName="user" action="">
				<div class="form-group">
					<label class="control-label col-sm-2" for="useremail" style="color:white;"> Email</label>
					<div class="col-sm-10">
						<form:input path="useremail" type="email" class="form-control"
							id="useremail" placeholder="Enter your email id" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="password" style="color:white;">Password</label>
					<div class="col-sm-10">
						<form:input path="password" type="password" class="form-control"
							id="password" placeholder="Enter your password" />
					</div>
				</div>
				</form:form>


</div>
</div>
</body>
</html>