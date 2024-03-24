<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>INTEREST RATE</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="#">Dashboard</a></li>
							<li><a href="#">Extra</a></li>
							<li class="active">Interest Rate</li>
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
						<strong class="card-title">Interest Rate List</strong>
					</div>
					<div class="card-body">
						<table id="bootstrap-data-table"
							class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Id</th>
									<th>Type</th>
									<th>Rate (%)</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="interestRate" items="${interestRate}" varStatus="i">
									<tr>
										<td>${i.index +1 }</td>
										<td>${interestRate.type}</td>	
										<td>${interestRate.interestRate}</td>
										<td><a href="<c:url value='/admin/interest-rate/edit/${interestRate.id}'/>"><i class="fa fa-edit"></i></a></td>		
										<td><a href="<c:url value='/admin/interest-rate/delete/${interestRate.id}'/>"><i class="fa fa-trash"></i></a></td>															
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
				<a href="<c:url value='/admin/interest-rate/create'/>">
					<button type="button" class="btn btn-success btn-lg btn-block"><i class="fa fa-plus-circle"></i> Make New Interest Rate</button>
				</a>
			</div>
		</div>
	</div>
	<!-- .animated -->
</div>
<!-- .content -->