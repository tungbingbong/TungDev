<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>CUSTOMER DETAIL</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="<c:url value='/admin'/>">Dashboard</a></li>
							<li><a href="#">Customer</a></li>
							<li class="active">Customer Detail</li>
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
			<div class="col-md-6">
				<div class="card border border-secondary">
					<div class="card-header">
						<strong class="card-title">Customer ID: ${user.id}</strong>
					</div>
					<div class="card-body">
						<div class="card-text text-sm mx-auto">
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Username </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.username}</a>
								</div>
							</div>	
							<div class="row form-group">
								<div class="col col-md-4">
									<label>First Name</label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.firstName}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Last Name</label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.lastName}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Gender </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.gender}</a>
								</div>
							</div>							
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Date of Birth </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.dob}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Phone </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.phone}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Email </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.email}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Nationality </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.nationality}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>City </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.city}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Address </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.address}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Salary </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${user.salary}</a>
								</div>
							</div>
							<hr>
							<div class="row form-group">
								<div class="col col-md-6">
									<label>Primary Account Number </label>
								</div>
								<div class="col-12 col-md-6">
									<a>${user.currentAccounts.accNo}</a>
								</div>
							</div>	
							<div class="row form-group">
								<div class="col col-md-6">
									<label>Number of Saving Account </label>
								</div>
								<div class="col-12 col-md-6">
									<a>${user.savingAccounts.size()}</a>
								</div>
							</div>	
							<div class="row form-group">
								<div class="col col-md-6">
									<label>Number of Loan Account </label>
								</div>
								<div class="col-12 col-md-6">
									<a>${user.loanAccounts.size()}</a>
								</div>
							</div>														
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- .animated -->
</div>
<!-- .content -->