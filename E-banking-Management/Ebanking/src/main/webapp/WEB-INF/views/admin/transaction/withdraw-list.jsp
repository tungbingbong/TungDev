<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>WITHDRAW INFORMATION</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="<c:url value='/admin'/>">Dashboard</a></li>
							<li><a href="#">Transaction</a></li>
							<li class="active">Withdraw Log</li>
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
						<strong class="card-title">Withdraw Log</strong>
					</div>
					<div class="card-body">
						<table id="bootstrap-data-table"
							class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>Account Number</th>
									<th>Customer</th>
									<th>Amount</th>
									<th>Date</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="withdraw" items="${withdraw}" varStatus="i">
									<tr>
										<td>${i.index +1 }</td>
										<td>${withdraw.currentAccount.accNo}</td>
										<td>${withdraw.currentAccount.user.firstName} ${withdraw.currentAccount.user.lastName}</td>
										<td>${withdraw.amount}</td>
										<td>${withdraw.date}</td>													
										<td><a href="<c:url value='/admin/transaction/withdraw/detail/${withdraw.id}'/>"><i class="fa fa-list"></i></a></td>
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