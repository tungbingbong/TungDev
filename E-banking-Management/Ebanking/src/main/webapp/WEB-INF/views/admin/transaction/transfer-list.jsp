<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>TRANSFER INFORMATION</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="<c:url value='/admin'/>">Dashboard</a></li>
							<li><a href="#">Transaction</a></li>
							<li class="active">Transfer Log</li>
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
						<strong class="card-title">Transfer Log</strong>
					</div>
					<div class="card-body">
						<table id="bootstrap-data-table"
							class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>Account Number</th>
									<th>Customer</th>
									<th>Receiver</th>
									<th>Amount</th>
									<th>Date</th>
									<th>Description</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="transfer" items="${transfer}" varStatus="i">
									<tr>
										<td>${i.index +1 }</td>
										<td>${transfer.currentAccount.accNo}</td>
										<td>${transfer.currentAccount.user.firstName} ${transfer.currentAccount.user.lastName}</td>
										<td>${transfer.receiver.firstName} ${transfer.receiver.lastName}</td>
										<td>${transfer.amount}</td>
										<td>${transfer.date}</td>	
										<td>${transfer.description}</td>																								 
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