<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container">
	<c:if test="${addedSupplierMessage==true}">
		<div class="alert alert-success" id="addedSupplierMessage">
			<strong>Added! </strong> Supplier with name <strong>
				${supplierName} </strong> You now have ${supplierSize} suppliers.
		</div>
	</c:if>
	<c:if test="${deletedSupplierMessage== true }">
		<div class="alert alert-danger" id="deletedSupplierMessage">
			<strong>Deleted!</strong> <strong>${supplierNameDeleted}</strong>  supplier has been deleted!
		</div>
	</c:if>
	<c:if test="${updatedSupplierMessage== true }">
		<div class="alert alert-warning" id="updatedSupplierMessage">
			<strong>Updated! ${updatedSupplierName}  has been updated </strong>
		</div>
	</c:if>
</div>
<%-- <table border="1">
	<tr>
		<td><a href="${contextPath}/admin/viewSupplier/addSupplier"
			class="btn btn-lg btn-primary">Add a New Supplier </a></td>
		<td><a href="${contextPath}/admin/viewSupplier/editSupplier"
			class="btn btn-lg btn-primary">Edit Suppliers</a></td>
	</tr>
</table> --%>

<a href="${contextPath}/admin/viewSupplier/addSupplier"
	class="btn btn-lg btn-success">Add Supplier</a>
<br>
<br>

<div class="table-outer" style="background-color:white;">
	<table class="table table-hover table-responsive" id="viewTable">
		<thead>
			<%
				int i = 1;
				int j = 0;
			%>

			<tr class="table-primary">
				<c:forEach items="${suppliers}" var="supplier">
					<%
						j++;
					%>
				</c:forEach>
				<th>No <span>( <%
					out.println(j);
				%> )
				</span>
				</th>

				<th>Supplier Name</th>
				<th>Supplier Contact</th>
				<th>Supplier Email</th>
				<th>Supplier Address</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${suppliers}" var="supplier">
				<tr>
					<td>
						<%
							out.println(i);
						%>
					</td>
					<td>${supplier.supname}</td>
					<td>${supplier.supcontact}</td>
					<td>${supplier.supemail}</td>
					<td>${supplier.supaddress}</td>
					<td>
						<div class="btn-group-vertical">
							<a
								href="${contextPath}/admin/viewSupplier/updateSupplier/${supplier.supid}"
								class="btn btn-sm btn-primary">Update Supplier</a> <a
								href="${contextPath}/admin/viewSupplier/deleteSupplier/${supplier.supid}"
								class="btn btn-sm btn-primary"> Delete Supplier </a>
						</div>
					</td>
				</tr>
				<%
					i++;
				%>
			</c:forEach>
	</table>
</div>