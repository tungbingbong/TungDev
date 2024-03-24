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
							<li class="active">Appointment List</li>
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
			<div class="col-md-9">
				<div class="card">
					<div class="card-header">
						<strong class="card-title">Appointment List</strong>
					</div>
					<div class="card-body">
						<table id="bootstrap-data-table"
							class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>Appointment Name</th>	
									<th>Date</th>
									<th>Description</th>
									<th>Status</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="appointment" items="${appointment}" varStatus="i">
									<tr>
										<td>${i.index +1 }</td>
										<td>${appointment.name}</td>
										<td>${appointment.date}</td>
										<td>${appointment.description}</td>
										<c:if test = "${appointment.status == 0}">
											<td><span class="badge badge-pending">Pending</span></td>
										</c:if>
										<c:if test = "${appointment.status == 1}">
											<td><span class="badge badge-pending">Accepted</span></td>
										</c:if>
										<!-- <td><span class="badge badge-pending">Pending</span></td> -->
										<td><a href="<c:url value='/customer/appointment/delete/${appointment.id}'/>"><i class="fa fa-trash"></i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-4">
				<a href="<c:url value='/customer/appointment/create'/>">
					<button type="button" class="btn btn-success btn-lg btn-block"><i class="fa fa-plus-circle"></i> Make A New Appointment</button>
				</a>
			</div>
		</div>
	</div>
	<!-- .animated -->
</div>
<!-- .content -->