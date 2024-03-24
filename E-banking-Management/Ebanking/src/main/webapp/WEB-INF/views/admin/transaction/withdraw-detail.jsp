<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>WITHDRAW DETAIL</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="<c:url value='/admin'/>">Dashboard</a></li>
							<li><a href="#">Transaction</a></li>
							<li class="active">Withdraw Detail</li>
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
						<strong class="card-title">Withdrawal ID: ${transaction.id}</strong>
					</div>
					<div class="card-body">
						<div class="card-text text-sm mx-auto">
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Account Number</label>
								</div>
								<div class="col-12 col-md-8">
									<a>${transaction.currentAccount.accNo}</a>
								</div>
							</div>	
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Customer </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${transaction.currentAccount.user.firstName} ${transaction.currentAccount.user.lastName}</a>
								</div>
							</div>							
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Amount </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${transaction.amount}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Date </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${transaction.date}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Description</label>
								</div>
								<div class="col-12 col-md-8">
									<a>${transaction.description}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Status</label>
								</div>
								<div class="col-12 col-md-8">
									<c:if test = "${transaction.status == 0}">
										<a style="color: grey;">Pending</a>
									</c:if>
									<c:if test = "${transaction.status == 1}">
										<a style="color: green;">Done</a>
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