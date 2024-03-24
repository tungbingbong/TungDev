<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
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
							<li><a href="<c:url value='/admin'/>">Dashboard</a></li>
							<li><a href="#">Customer</a></li>
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
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<strong class="card-title">CUSTOMER LIST</strong>
					</div>
					<div class="card-body">
						<table id="bootstrap-data-table"
							class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>Full Name</th>
									<th>Username</th>
									<th>Email</th>
									<th>Phone</th>		
									<th></th>	
									<th></th>													
								</tr>
							</thead>
							<tbody>
								<c:forEach var="user" items="${user}" varStatus="i">
									<tr>
										<td>${i.index +1 }</td>
										<td>${user.firstName } ${user.lastName }</td>
										<td>${user.username }</td>
										<td>${user.email }</td>
										<td>${user.phone }</td>									
										<td><a href="<c:url value='/admin/customer/edit/${user.id}'/>"><i class="fa fa-edit"></i></a></td>
										<td><a href="<c:url value='/admin/customer/detail/${user.id}'/>"><i class="fa fa-list"></i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- .animated -->
</div>
<!-- .content -->