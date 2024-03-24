<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Banking</title>
</head>
<body>
<h1>Edit Customer Information</h1>
<form action="<c:url value='/admin/customer/edit'/>" method="post">
  <div>    
    <label for="firstname"><b>First Name</b></label><br>
    <input type="text" placeholder="Enter First Name" name="firstname" value="${user.firstName}" required><br>
    
    <label for="lastname"><b>Last Name</b></label><br>
    <input type="text" placeholder="Enter Last Name" name="lastname" value="${user.lastName}" required><br>
    
    <label for="gender"><b>Gender</b></label><br>
    <input type="text" placeholder="Enter Gender" name="gender" value="${user.gender}"required><br>
    
    <label for="dob"><b>DOB</b></label><br>
    <input type="date" placeholder="Enter DOB" name="dob" value="${user.dob}" required><br>
    
    <label for="email"><b>Email</b></label><br>
    <input type="email" placeholder="Enter Email" name="email" value="${user.email}"required><br>
    
    <label for="phone"><b>Phone</b></label><br>
    <input type="text" placeholder="Enter Phone" name="phone" value="${user.phone}"required><br>
    
    <label for="nationality"><b>Nationality</b></label><br>
    <input type="text" placeholder="Enter Nationality" name="nationality" value="${user.nationality}" required><br>
    
    <label for="city"><b>City</b></label><br>
    <input type="text" placeholder="Enter City" name="city" value="${user.city}" required><br>
    
    <label for="address"><b>Address</b></label><br>
    <input type="text" placeholder="Enter Address" name="address" value="${user.address}" required><br>
    
    <label for="salary"><b>Salary</b></label><br>
    <input type="text" placeholder="Enter Salary" name="salary" value="${user.salary}" required><br>
    
    <label for="username"><b>Username</b></label><br>
    <input type="text" placeholder="Enter Username" name="username" value="${user.username}" required><br>

    <label for="password"><b>Password</b></label><br>
    <input type="password" placeholder="Enter Password" name="password" value="${user.password}" required><br>

    <button type="submit">Update</button><br> 
  </div>
</form>
</body>
</html> -->
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>Customer Management</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="#">Dashboard</a></li>
							<li><a href="#">Extras</a></li>
							<li class="active">Customer Management</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="content">
	<div class="animated fadeIn">
		<div class="row">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-header">
						<strong>Edit</strong> Customer Information
					</div>
					<div class="card-body card-block">
						<c:url var="editUser" value='/admin/customer/edit/${user.id}'/>
						<form:form action="${editUser}" method="post" modelAttribute="user" enctype="multipart/form-data" class="form-horizontal">
							<div class="row form-group">
								<div class="col col-md-3">
									<label class=" form-control-label">Username</label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" placeholder="Enter Username" path="username" value="${user.username}" 
									class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">First Name</label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" id="text-input" placeholder="Enter First Name" path="firstName" value="${user.firstName}"
									class="form-control"/>
									<!-- <small class="form-text text-muted">This is a help text</small> -->
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">Last Name</label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" id="text-input" placeholder="Enter Last Name" path="lastName" value="${user.lastName}"
									class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">Gender</label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" id="text-input" placeholder="Enter Gender" path="gender" value="${user.gender}"
									 class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">Date of Birth</label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="date" id="text-input" placeholder="Enter DOB" path="dob" value="${user.dob}"
									 class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="email-input" class=" form-control-label">Email </label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="email" id="email-input" placeholder="Enter Email" path="email" value="${user.email}"
									class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="email-input" class=" form-control-label">Phone </label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" id="text-input" placeholder="Enter Phone" path="phone" value="${user.phone}"
									class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="email-input" class=" form-control-label">Nationality </label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" id="text-input" placeholder="Enter Nationality" path="nationality" value="${user.nationality}"
									class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="email-input" class=" form-control-label">City </label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" id="text-input" placeholder="Enter City" path="city" value="${user.city}"
									class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="email-input" class=" form-control-label">Address </label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" id="text-input" placeholder="Enter Address" path="address" value="${user.address}"
									class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="email-input" class=" form-control-label">Salary </label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="number" id="text-input" placeholder="Enter Salary" path="salary" value="${user.salary}"
									class="form-control"/>
								</div>
							</div>							
							<hr>
							<div class="">							
								<button type="submit" class="btn btn-primary btn-sm">
									<i class="fa fa-dot-circle-o"></i> Submit
								</button>
								<button type="reset" class="btn btn-danger btn-sm">
									<i class="fa fa-ban"></i> Reset
								</button>
							</div>
						</form:form>
					</div>					
				</div>
			</div>
		</div>
	</div>
	<!-- .animated -->
</div>
<!-- .content -->