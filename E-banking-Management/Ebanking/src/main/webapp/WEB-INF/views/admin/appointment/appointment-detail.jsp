<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>APPOINTMENT DETAIL</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="<c:url value='/admin'/>">Dashboard</a></li>
							<li><a href="#">Appointment</a></li>
							<li class="active">Appointment Detail</li>
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
						<strong class="card-title">Appointment ID: ${appointment.id}</strong>
					</div>
					<div class="card-body">
						<div class="card-text text-sm mx-auto">
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Customer </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${appointment.user.firstName} ${appointment.user.lastName}</a>
								</div>
							</div>	
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Name</label>
								</div>
								<div class="col-12 col-md-8">
									<a>${appointment.name}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Date </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${appointment.date}</a>
								</div>
							</div>							
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Description </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${appointment.description}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Status </label>
								</div>
								<div class="col-12 col-md-8">
									<c:if test = "${appointment.status == 0}">
										<a style="color: grey;">Pending</a>
									</c:if>
									<c:if test = "${appointment.status == 1}">
										<a style="color: green;">Accepted</a>
									</c:if>
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