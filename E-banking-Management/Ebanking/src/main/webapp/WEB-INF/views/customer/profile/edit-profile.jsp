<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>PROFILE</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="#">Dashboard</a></li>
							<li><a href="#">Extra</a></li>
							<li class="active">Profile</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="content">
	<div class="animated fadeIn">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-header">
						<strong>Edit</strong> Profile
					</div>
					<div class="card-body card-block">
						<c:url var="profileEdit" value='/customer/profile/edit'/>
						<form:form action="${profileEdit}" method="post" modelAttribute="user" class="form-horizontal">
							<div class="row form-group">
								<div class="col col-md-3">
									<label class=" form-control-label">Username</label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" placeholder="Enter Username" path="username" value="${user.username}" readonly="true"
									class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">First Name</label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" id="text-input" placeholder="Enter First Name" path="firstName" value="${user.firstName}"
									readonly="true" class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">Last Name</label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" id="text-input" placeholder="Enter Last Name" path="lastName" value="${user.lastName}"
									readonly="true" class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">Gender</label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" id="text-input" placeholder="Enter Gender" path="gender" value="${user.gender}"
									readonly="true" class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">Date of Birth</label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="date" id="text-input" placeholder="Enter DOB" path="dob" value="${user.dob}"
									readonly="true" class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="email-input" class=" form-control-label">Email </label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="email" id="email-input" placeholder="Enter Email" path="email" value="${user.email}"
									class="form-control"/>
									<small class="form-text text-muted"><form:errors path="email" style="color:red;" cssClass="error"/></small>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="email-input" class=" form-control-label">Phone </label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" id="text-input" placeholder="Enter Phone" path="phone" value="${user.phone}"
									class="form-control"/>
									<small class="form-text text-muted"><form:errors path="phone" style="color:red;" cssClass="error"/></small>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="email-input" class=" form-control-label">Nationality </label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" id="text-input" placeholder="Enter Nationality" path="nationality" value="${user.nationality}"
									readonly="true" class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="email-input" class=" form-control-label">City </label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" id="text-input" placeholder="Enter City" path="city" value="${user.city}"
									readonly="true" class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="email-input" class=" form-control-label">Address </label>
								</div>
								<div class="col-12 col-md-9">
									<form:textarea id="w3review" path="address" rows="4" cols="30" value="${user.address}"
									placeholder="Enter Address" readonly="true" class="form-control"/>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="email-input" class=" form-control-label">Salary </label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" id="text-input" placeholder="Enter Salary" path="salary" value="${user.salary}"
									readonly="true" class="form-control"/>
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