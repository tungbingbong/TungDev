<%@ page import="com.ebanking.util.SecurityUtils" %>
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
							<li><a href="#">Dashboard</a></li>
							<li><a href="#">Extras</a></li>
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
						<strong>Change</strong> Password
					</div>
					<div class="card-body card-block">
						<c:url var="changePassword" value='/admin/profile/change-password'/>
						<form:form action="${changePassword}" modelAttribute="user" method="post" class="form-horizontal">
							<div class="row form-group">
								<div class="col col-md-4">
									<label class=" form-control-label">Username</label>
								</div>
								<div class="col-12 col-md-8">
									<form:input type="text" placeholder="Enter Username" path="username" value="${user.username}" readonly="true" 
									class="form-control"/>
								</div>
							</div>							
							<div class="row form-group">
								<div class="col col-md-4">
									<label for="password-input" class=" form-control-label">Password</label>
								</div>
								<div class="col-12 col-md-8">
									<form:password id="password-input" placeholder="Enter Password" path="password" 
									class="form-control"/>
									<small class="form-text text-muted"><form:errors path="password" style="color:red;" cssClass="error"/></small>
								</div>
							</div> 
							<div class="row form-group">
								<div class="col col-md-4">
									<label for="password-input" class=" form-control-label">Confirm Password</label>
								</div>
								<div class="col-12 col-md-8">
									<form:password id="password-input" placeholder="Enter Password Again" path="password" 
									class="form-control"/>
									<small class="form-text text-muted"><form:errors path="password" style="color:red;" cssClass="error"/></small>
								</div>
							</div>
							<hr>
							<div class="row form-group">							
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