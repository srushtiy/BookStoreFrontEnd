<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<spring:url var="fonts" value="/resources/fonts" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Tangerine">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Harmattan"
	rel="stylesheet">
<link
	href='http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css'
	rel='stylesheet'>
<link
	href='//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css'
	rel="stylesheet">
<link rel="stylesheet" href="${css}/my-css.css">
<link rel="stylesheet" href="${css}/bootstrap.min.css">
<link rel="stylesheet" href="${css}/google-fonts.css">
<link rel="stylesheet" href="${css}/fonts-2.css">
<link rel="stylesheet" href="${css}/fonts-3.css">
<link rel="stylesheet" href="${css}/google-fonts.css">
<link rel="stylesheet" href="${fonts}/bootstrap-glyphicons.css">
<link href="${css}/bootstrap.css" rel="stylesheet">
<link href="${css}/bootstrap-theme.css" rel="stylesheet">
<link href="${css}/webapp.css" rel="stylesheet">
<link rel="stylesheet" href="${css}/boostrap.css.map">
<link rel="stylesheet" href="${css}/boostrap-theme.css.map">
</head>
<body>
	<%@include file="./shared/menu.jsp"%>
	<c:if test="${isHomeClicked==true}">
		<%@include file="HomePage.jsp"%>
	</c:if>

	<div data-role="page">
		<div data-role="header" data-position="fixed">
			<table width="100%">
				<tr>
					<c:choose>
						<c:when test="${empty loggedInUser}">
							<h1>Welcome to Elixir! Register here!</h1>
							<td align="left">Existing user<a href="loginHere"> Login
									here</a></td>
							<td align="center">New user<a href="registerHere">
									Register here</a></td>
						</c:when>
						<c:when test="${not empty loggedInUser}">
							<td>Welcome ${loggedInUser},</td>
							<td align="right"><a href="logout"> logout</a></td>
						</c:when>

					</c:choose>
				</tr>
				<tr>
					<c:if test="${loggedOut==true}">
						<td>${logoutMessage}</td>
					</c:if>
				</tr>
				<tr>
					<c:if test="${not empty cartSize}">
						<td align="right"><a href="myCart"> My Cart </a>( ${cartSize}
							)</td>
					</c:if>
				</tr>
			</table>
		</div>

		<div data-role="main" class="ui-content">

			<hr color="red" size="5">

			<ul id="menu">
				<c:if test="${not empty categoryList}">
					<c:forEach items="${categoryList}" var="category">
						<li><a href=${category.catname}>${category.catname}</a>
							<ul>
								<%-- <c:forEach items="${category}" var="product">

									<li><a href="<c:url value='product/get/${product.id}' />">${product.name}</a></li>

								</c:forEach>
 --%>
							</ul></li>
					</c:forEach>
				</c:if>

			</ul>
			<hr size="5">
			<br> <br> <br>
			<div>
				<c:if test="${!empty selectedProduct.name}">
					<table>
						<tr>
							<th align="left" width="80">Product ID</th>
							<th align="left" width="120">Product Name</th>
							<th align="left" width="200">Product Description</th>
							<th align="left" width="80">Price</th>
							<th align="left" width="200">Product Category</th>
							<th align="left" width="200">Product Supplier</th>

						</tr>
						<tr>
							<td align="left">${selectedProduct.id}</td>
							<td align="left">${selectedProduct.name}</td>
							<td align="left">${selectedProduct.description}</td>
							<td align="left">${selectedProduct.price}</td>
							<td align="left">${selectedProduct.category.name}</td>
							<td align="left">${selectedProduct.supplier.name}</td>
						</tr>
					</table>
				</c:if>
			</div>

			<div id="registerHere">
				<c:if test="${isUserClickedRegisterHere==true}">
					<%@ include file="/WEB-INF/views/register.jsp"%>
				</c:if>
			</div>

			<div id="loginHere">
				<c:if
					test="${isUserClickedLoginHere==true || invalidCredentials==true}">
					<div id="error">${errorMessage}</div>
					<%@ include file="/WEB-INF/views/login.jsp"%>

				</c:if>
			</div>

			<div id="admin">

				<c:if test="${isAdmin==true}">

					<%@ include file="/WEB-INF/views/adminPage.jsp"%>

				</c:if>
				<div id="categories">
					<c:if test="${isAdminClickedCategories==true}">
						<%@ include file="/WEB-INF/views/adminPage.jsp"%>
						<%@ include file="/WEB-INF/views/category.jsp"%>
					</c:if>
				</div>

				<div id="products">
					<c:if test="${isAdminClickedProducts==true}">
						<%@ include file="/WEB-INF/views/adminPage.jsp"%>
						<%@ include file="/WEB-INF/views/product.jsp"%>
					</c:if>
				</div>

				<div id="suppliers">
					<c:if test="${isAdminClickedSuppliers==true}">
						<%@ include file="/WEB-INF/views/adminPage.jsp"%>
						<%@ include file="/WEB-INF/views/supplier.jsp"%>
					</c:if>
				</div>

			</div>

			<div id="displayCart">
				<c:if test="${displayCart==true}">

					<table>
						<tr>
							<th align="left" width="80">Cart ID</th>
							<th align="left" width="120">Product Name</th>
							<th align="left" width="200">Quantity</th>
							<th align="left" width="80">Price</th>
							<th align="left" width="60">Delete from Cart</th>

						</tr>
						<c:forEach items="${cartList}" var="cart">
							<tr>
								<td align="left">${cart.id}</td>
								<td align="left">${cart.productName}</td>
								<td align="left">${cart.quantity}</td>
								<td align="left">${cart.price}</td>
								<td align="left"><a
									href="<c:url value='/cart/delete/${cart.id}'  />">Delete</a></td>
								<td align="left"><a href="<c:url value='pay/${cart.id}' />">
										Proceed</a></td>
							</tr>
						</c:forEach>

					</table>

					<h2>Total cost : ${totalAmount}</h2>
					<%-- <a href="<c:url value='/pay/${cart.userID}'/>">Proceed</a>  --%>
					<a href="<c:url value='/pay/${cart.id}'/>">Proceed</a>
				</c:if>

			</div>
		</div>
		<div data-role="footer" data-position="fixed">
			<h1>&copy; 2016 - Shopping Cart</h1>
		</div>
	</div>

</body>
<%@include file="./shared/footer.jsp"%>
</html>

