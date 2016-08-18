<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="<c:url value="/resources/admin.css" />">
<html>
<head>
<title>Edit Suppliers</title>

</head>
<%-- <h3> List of Suppliers</h3>
<c:if test = "${!empty supplierList}">
<table class = "tg">
<tr>
<th width = "100"> Supplier ID </th>
<th width = "100"> Supplier Name </th>
<th width = "120"> Supplier Address </th>
<th width = "100"> Edit </th>
<th width = "100"> Delete </th>
</tr>
<c:forEach items="${supplierList}" var="supplier">
<tr> 
<td>${supplier.supid}</td>
<td>${supplier.supname}</td>
<td>${supplier.supaddress}</td>
<td><a href="<c:url value='supplier/edit/${supplier.id}' />"> Edit</a></td>
<td><a href="<c:url value='supplier/delete/${supplier.id}' />"> Delete </a></td>
</tr>
</c:forEach>
</table>
</c:if> --%>
<div class="container-fluid">
	<form:form
		action="${contextPath}/admin/viewSupplier/update?${_csrf.parameterName}=${_csrf.token}"
		class="form-horizontal" method="post" commandName="supplier"
		enctype="multipart/form-data">
		<form:hidden path="supid" />
		<div class="form-group">
			<label for="updateSupplierName" class="control-label col-sm-2">Supplier
				Name</label>
			<div class="col-sm-10">
				<form:errors path="supname" class="error" />
				<form:input path="supname" type="text"
					name="updateSupplierName" value="${supplier.supname}"
					class="form-control" placeholder="Enter supplier's new name"
					required="required" />
			</div>
		</div>

		<div class="form-group">
			<form:errors path="" class="error" />
			<label for="updateSuppierContact" class="control-label col-sm-2">Supplier
				Contact No</label>
			<div class="col-sm-10">
				<form:errors path="supcontact" class="error" />
				<form:input path="supcontact" type="text"
					name="updateSuppierContact" class="form-control"
					value="${supplier.supcontact}"
					placeholder="Enter supplier's new Contact No" required="required" />
			</div>
		</div>
		<div class="form-group">
			<label for="updateSupplierEmail" class="control-label col-sm-2">Email
				Id</label>
			<div class="col-sm-10">
				<form:errors path="supemail" class="error" />
				<form:input type="email" path="supemail"
					name="updateSupplierEmail" class="form-control"
					value="${supplier.supemail}"
					placeholder="Enter supplier's new Email Id" required="required" />
			</div>
		</div>
		<div class="form-group">
			<label for="updateSupplierAddress" class="control-label col-sm-2">Supplier
				Address</label>
			<div class="col-sm-10">
				<form:errors path="supaddress" class="error" />
				<form:textarea type="text" rows="7" name="updateSupplierddress"
				value="${supplier.supaddress}" placeholder="Enter a new supplier description"
					path="supaddress" class="form-control" required="required" />
			</div>
		</div>
		<div class="form-group">
				<input type="submit" value="Update Supplier"
					class="btn btn-warning btn-md">
</div>
</form:form>
</div>
	</body>
</html>