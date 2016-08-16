<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container">
	<c:if test="${addedCategoryMessage==true}">
		<div class="alert alert-primary" id="addedCategoryMessage">
			<strong>Added! </strong> Category with name <strong>
				${categoryName} </strong> You now have ${categorySize} categories.
		</div>
	</c:if>
	<c:if test="${deletedCategoryMessage== true }">
		<div class="alert alert-danger" id="deletedSupplierMessage">
			<strong>Deleted! </strong> Category with name <strong>
				${categoryNameDeleted}</strong>
		</div>
	</c:if>
	<c:if test="${updatedCategoryMessage== true }">
		<div class="alert alert-warning" id="updatedSupplierMessage">
			<strong>Updated! </strong> Category with name <strong>${updatedCategoryName}</strong>
		</div>
	</c:if>
	<table border="1">
		<tr>
			<td><a href="${contextPath}/admin/viewCategory/addCategory"
				class="btn btn-lg btn-primary">Add a New Category </a></td>
			<td><a href="${contextPath}/admin/viewSupplier/editSupplier"
				class="btn btn-lg btn-primary">Edit Category</a></td>
		</tr>
	</table>
<div class="table-outer" style="background-color:white;">
	<table class="table table-hover table-responsive" id="viewTable">
		<thead>
			<%
				int i = 1;
				int j = 0;
			%>

			<tr class="table-primary">
				<c:forEach items="${categories}" var="categories">
					<%
						j++;
					%>
				</c:forEach>
				<th>No <span>( <%
					out.println(j);
				%> )
				</span>
				</th>

				<th>Category Name</th>
				<th>Category Description</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${categories}" var="categories">
				<tr>
					<td>
						<%
							out.println(i);
						%>
					</td>
					<td>${category.catname}</td>
					<td>${category.catdescription}</td>
					<td>
						<div class="btn-group-vertical">
							<a
								href="${contextPath}/admin/viewCategory/updateCategory/${category.catid}"
								class="btn btn-sm btn-primary">Update Category</a> <a
								href="${contextPath}/admin/viewCategory/deleteCategory/${category.catid}"
								class="btn btn-sm btn-primary"> Delete Category </a>
						</div>
					</td>
				</tr>
				<%
					i++;
				%>
			</c:forEach>
	</table>
</div>
</div>
