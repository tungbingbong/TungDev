<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>APPOINTMENT</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="<c:url value='/customer'/>">Dashboard</a></li>
							<li><a href="#">Appointment</a></li>
							<li class="active">Create Appointment</li>
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
						<strong>Create</strong> New Appointment
					</div>
					<div class="card-body card-block">
						<c:url var="appointmentCreate" value='/customer/appointment/create'/>
						<form:form action="${appointmentCreate}" method="post" commandName="appointment" class="form-horizontal">
							<div class="row form-group">
								<div class="col col-md-3">
									<label class=" form-control-label">Name</label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" placeholder="Enter Appointment Name" path="name" value="" 
									class="form-control"/>
									<small class="form-text text-muted"><form:errors path="name" style="color:red;" cssClass="error"/></small>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">Date</label>
								</div>
								<div class="col-12 col-md-6">
									<form:input type="datetime-local" id="text-input" placeholder="Enter Date" path="date" value=""
									class="form-control"/>
									<small class="form-text text-muted"><form:errors path="date" style="color:red;" cssClass="error"/></small>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">Description</label>
								</div>
								<div class="col-12 col-md-9">
									<form:textarea id="w3review" path="description" rows="8" cols="30" class="form-control"/>
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