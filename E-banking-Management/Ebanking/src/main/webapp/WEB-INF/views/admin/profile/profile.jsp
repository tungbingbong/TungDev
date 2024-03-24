<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>Profile</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="<c:url value='/admin'/>">Dashboard</a></li>
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
			<div class="col-md-5">
				<div class="card">
					<div class="card-header">
						<strong class="card-title pl-2">Profile</strong>
					</div>
					<div class="card-body">
						<div class="mx-auto d-block">
							<img class="rounded-circle mx-auto d-block"
								src="<c:url value='/template/admin/images/admin.jpg'/>" alt="User Avatar">
							<h5 class="text-sm-center mt-2 mb-1"><strong>${user.firstName} ${user.lastName}</strong></h5>
							
							<div class="location text-sm-center">
								<i class="fa fa-user"></i> ${user.username}
							</div>
							<div class="location text-sm-center">
								<i class="fa fa-map-marker"></i> ${user.city},
								${user.nationality}
							</div>
						</div>
						<hr>
						<div class="card-text text-sm mx-auto">
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Gender</label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.gender}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Date of Birth</label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.dob}</a>
								</div>
							</div>
							
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Email</label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.email}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Phone</label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.phone}</a>
								</div>
							</div>	
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Address</label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.address}</a>
								</div>
							</div>	
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Salary</label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.salary}</a>
								</div>
							</div>	
						</div>
						<hr>
						<a href="<c:url value='/admin/profile/edit'/>"><i class="fa fa-edit"></i> Edit Profile &emsp; &emsp; &emsp;</a> 
						<a href="<c:url value='/admin/profile/change-password'/>"><i class="fa fa-key"></i> Change password</a>
					</div>
				</div>
			</div>
		</div>
		<!-- .row -->
	</div>
	<!-- .animated -->
</div>
<!-- .content -->

