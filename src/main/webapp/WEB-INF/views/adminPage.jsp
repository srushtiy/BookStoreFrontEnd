<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- <div class="container" style="background-color: transparent;">
	<div class="dropdown">
		<button class="btn btn-primary dropdown-toggle" type="button"
			data-toggle="dropdown">
			Manage Categories <span class="caret"></span>
		</button>
		<ul class="dropdown-menu">
			<li><a href="#">Add Category</a></li>
			<li><a href="#">Edit Category</a></li>
		</ul>
	</div>
	<div class="dropdown">
		<button class="btn btn-primary dropdown-toggle" type="button"
			data-toggle="dropdown">
			Manage Suppliers <span class="caret"></span>
		</button>
		<ul class="dropdown-menu">
			<li><a href="#">Add Supplier</a></li>
			<li><a href="#">Edit Supplier</a></li>
		</ul>
	</div>
	<div class="dropdown">
		<button class="btn btn-primary dropdown-toggle" type="button"
			data-toggle="dropdown">
			Manage Products <span class="caret"></span>
		</button>
		<ul class="dropdown-menu">
			<li><a href="admin/viewCat/addProduct">Add Product</a></li>
			<li><a href="#">Edit Product</a></li>
		</ul>
	</div>
</div> -->

<!-- <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="admin/viewCat/addCategory">Add a Category</a></li>
          <li><a href="admin/viewCat/editCategory">Edit a Category</a></li>
        </ul>
      </li>
      <li><a href="admin">Product</a>
      <ul class="dropdown-menu">
          <li><a href="admin/viewCat/addProduct">Add a Product</a></li>
          <li><a href="admin/viewCat/editProduct">Edit a Product</a></li>
        </ul></li>
      <li><a href="/ShoppingCartFrontEnd/admin/viewSupplier/addSupplier">Supplier</a>
       <li><a href="admin/viewSupplier/addSupplier">Add a Supplier</a></li>
          <li><a href="admin/viewSupplier/editSupplier">Edit a Supplier</a></li>
        </ul>
  </div>
</nav> -->

<div class="row">
    <div class="col-xs-4">
        <div class="well" style="text-align:center;"><a href="/ShoppingCartFrontEnd/admin/viewCategory/addCategory"> Add a Category </a></div>
    </div>
    <div class="col-xs-4">
       <div class="well" style="text-align:center;"><a href="/ShoppingCartFrontEnd/admin/viewCategory/addCategory"> Add a Product </a></div>
    </div>
    
    <div class="col-xs-4">
       <div class="well" style="text-align:center;"><a href="/ShoppingCartFrontEnd/admin/viewSupplier/addSupplier"> Add a Supplier </a></div>
    </div>
</div>
<div class="row">
    <div class="col-xs-4">
        <div class="well" style="text-align:center;color:black;"><a href="/ShoppingCartFrontEnd/admin/viewCategory/editCategory"> Edit a Category </a></div>
    </div>
    <div class="col-xs-4">
       <div class="well" style="text-align:center;"><a href="/ShoppingCartFrontEnd/admin/viewCategory/editCategory"> Edit a Product </a></div>
    </div>
    
    <div class="col-xs-4">
       <div class="well" style="text-align:center;"><a href="/ShoppingCartFrontEnd/admin/viewSupplier/editSupplier"> Edit a Supplier </a></div>
    </div>
</div>

<div class="row">
    <div class="col-xs-4">
        <div class="well" style="text-align:center;color:black;"><a href="/ShoppingCartFrontEnd/admin/viewCategory"> Edit Category </a></div>
    </div>
    <div class="col-xs-4">
       <div class="well" style="text-align:center;"><a href="/ShoppingCartFrontEnd/admin/viewProduct"> Edit Product </a></div>
    </div>
    
    <div class="col-xs-4">
       <div class="well" style="text-align:center;"><a href="/ShoppingCartFrontEnd/admin/viewSupplier/showSupplier"> View Supplier </a></div>
    </div>
</div>


<!-- <table class="table">
    <thead>
        <tr>
            <th>Category</th>
            <th>Supplier</th>
            <th>Products</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Add a Category</td>
            <td>Add a Supplier</td>
            <td>Add a Product</td>
        </tr>
        <tr>
            <td>Edit a Category</td>
            <td>Edit a Supplier</td>
            <td>Edit a Product</td>
        </tr>
        <tr>
    </table> -->



