<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>DEPOSIT</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="<c:url value='/customer'/>">Dashboard</a></li>
							<li><a href="#">Transaction</a></li>
							<li class="active">Deposit</li>
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
						<strong class="card-title">Deposit History</strong>
					</div>
					<div class="card-body">
						<table id="bootstrap-data-table"
							class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>Amount</th>	
									<th>Date</th>
									<th>Status</th>
									<th>Description</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="transaction" items="${transaction}" varStatus="i">
									<tr>
										<td>${i.index +1 }</td>
										<td>${transaction.amount}</td>
										<td>${transaction.date}</td>
										<c:if test = "${transaction.status == 0}">
											<td><span class="badge badge-pending">Pending</span></td>
										</c:if>
										<c:if test = "${transaction.status == 1}">
											<td><span class="badge badge-pending">Done</span></td>
										</c:if>
										<td>${transaction.description}</td>										
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
				<a href="<c:url value='/customer/transaction/deposit'/>">
					<button type="button" class="btn btn-success btn-lg btn-block"><i class="fa fa-plus-circle"></i> Make New Deposit</button>
				</a>
			</div>
		</div>
	</div>
	<!-- .animated -->
</div>
<!-- .content -->