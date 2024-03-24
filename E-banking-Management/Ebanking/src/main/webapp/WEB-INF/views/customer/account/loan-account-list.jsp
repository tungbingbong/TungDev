<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>LOAN ACCOUNT</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="<c:url value='/admin'/>">Dashboard</a></li>
							<li><a href="#">Account</a></li>
							<li class="active">Loan Account</li>
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
						<strong class="card-title">Loan Account List</strong>
					</div>
					<div class="card-body">
						<table id="bootstrap-data-table"
							class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>Account Number</th>
									<th>Tenor</th>
									<th>Total Amount</th>
									<th>Remain Amount</th>	
									<th>Open Date</th>
									<th>Close Date</th>
									<th>Status</th>
									<th>Pay</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="loanAccounts" items="${loanAccounts}" varStatus="i">
									<tr>
										<td>${i.index +1 }</td>
										<td>${loanAccounts.accNo}</td>
										<td>${loanAccounts.tenor}</td>
										<td>${loanAccounts.totalAmount}</td>
										<td>${loanAccounts.remainAmount}</td>
										<td>${loanAccounts.openDate}</td>
										<td>${loanAccounts.closeDate}</td>
										<c:if test = "${loanAccounts.status == 2}">
											<td><span class="badge badge-pending">Finished</span></td>
										</c:if>
										<c:if test = "${loanAccounts.status == 1}">
											<td><span class="badge badge-pending">Active</span></td>
										</c:if>	
										<c:if test = "${loanAccounts.status == 0}">
											<td><span class="badge badge-pending">Pending</span></td>
										</c:if>	
										<td>
											<c:if test = "${loanAccounts.status == 1}">
												<a href="<c:url value='/customer/loan-account/pay'/>" ><i class="fa fa-usd"></i></a>
											</c:if>	
										</td>									
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
				<a href="<c:url value='/customer/loan-account/create'/>">
					<button type="button" class="btn btn-success btn-lg btn-block"><i class="fa fa-plus-circle"></i> Make New Loan Account</button>
				</a>
			</div>
		</div>
	</div>
	<!-- .animated -->
</div>
<!-- .content -->