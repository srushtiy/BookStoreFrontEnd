<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Add Supplier -->
<head>
<style>
body {
font-color: white;
}
</style>
</head>

<div class="panel panel-primary" style="background:light blue;">
	<div class="panel-heading">Add Category</div>
	<div class="panel-body" style="font-color:white;">
		<div class="row">

			<form:form
				action="${contextPath}/admin/viewCategory?${_csrf.parameterName}=${_csrf.token}"
				class="form-horizontal" method="post" commandName="category"
				enctype="multipart/form-data">
				<div class="form-group">
					<label for="catname" class="control-label col-sm-2">Category
						Name</label>
					<div class="col-sm-10">
						<form:errors path="catname" class="error" />
						<form:input type="text" path="catname" name="catname"
							placeholder="Enter Category name" class="form-control"
							required="required" />
					</div>
				</div>
				<div class="form-group">
					<label for="supaddress" class="control-label col-sm-2">Category Description
						</label>
					<div class="col-sm-10">
						<form:errors path="catdescription" class="error" />
						<form:textarea path="catdescription" name="catdescription"
							rows="7" class="form-control" required="required" />
					</div>
				</div>
				<input type="submit" value="Add Category"
					class="col-sm-offset-2 btn btn-danger btn-md">
			</form:form>
		</div>
	</div>
</div>
