<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="<c:url value="/resources/admin.css" />">
<html>
<head>
<title>Edit Suppliers</title>

</head>
<h3> List of Suppliers</h3>
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
</c:if>
</body>
</html>