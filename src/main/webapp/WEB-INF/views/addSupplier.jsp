<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Add Supplier -->
<head>
<style>
body {
font-color: white;
}
</style>
</head>

<div class="panel panel-primary" style="background:transparent;">
	<div class="panel-heading">Add Supplier</div>
	<div class="panel-body" style="font-color:white;">
		<div class="row">

			<form:form
				action="${contextPath}/admin/viewSupplier?${_csrf.parameterName}=${_csrf.token}"
				class="form-horizontal" method="post" commandName="supplier"
				enctype="multipart/form-data">
				<div class="form-group">
					<label for="supname" class="control-label col-sm-2">Supplier
						Name</label>
					<div class="col-sm-10">
						<form:errors path="supname" class="error" />
						<form:input type="text" path="supname" name="supname"
							placeholder="Enter supplier name" class="form-control"
							required="required" />
					</div>
				</div>
				<div class="form-group">
					<label for="" class="control-label col-sm-2">Supplier
						Contact No</label>
					<div class="col-sm-10">
						<form:errors path="supcontact" class="error" />
						<form:input path="supcontact" type="text"
						placeholder="Enter supplier contact number"
							pattern="^[0-9]{10}" class="form-control" required="true" />
					</div>
				</div>
				<div class="form-group">
					<label for="supemail" class="control-label col-sm-2">Supplier
						Email Id</label>
					<div class="col-sm-10">
						<form:errors path="supemail" class="error" />
						<form:input path="supemail" type="email" name="supemail"
						placeholder="Enter supplier email id"
							class="form-control" required="required" />
					</div>
				</div>
				<div class="form-group">
					<label for="supaddress" class="control-label col-sm-2">Supplier
						Address</label>
					<div class="col-sm-10">
						<form:errors path="supaddress" class="error" />
						<form:textarea path="supaddress" name="supaddress"
						placeholder="Enter supplier address"
							rows="7" class="form-control" required="required" />
					</div>
				</div>
				<input type="submit" value="Add Supplier"
					class="col-sm-offset-2 btn btn-danger btn-md">
			</form:form>
		</div>
	</div>
</div>
