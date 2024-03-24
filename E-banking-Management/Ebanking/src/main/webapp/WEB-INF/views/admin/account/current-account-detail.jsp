<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>PRIMARY ACCOUNT DETAIL</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="<c:url value='/admin'/>">Dashboard</a></li>
							<li>Account</li>
							<li class="active">Primary Account Detail</li>
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
						<strong class="card-title">Primary Account ID: ${currentAccount.id}</strong>
					</div>
					<div class="card-body">
						<div class="card-text text-sm mx-auto">
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Account Number </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${currentAccount.accNo}</a>
								</div>
							</div>	
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Card Number</label>
								</div>
								<div class="col-12 col-md-8">
									<a>${currentAccount.cardNo}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Customer </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${currentAccount.user.firstName} ${currentAccount.user.lastName}</a>
								</div>
							</div>							
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Balance </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${currentAccount.balance}</a> VND
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Open Date </label>
								</div>
								<div class="col-12 col-md-8">
									<a>${currentAccount.openDate}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Interest Rate (%)</label>
								</div>
								<div class="col-12 col-md-8">
									<a>${currentAccount.interestRate.interestRate}</a>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label>Status</label>
								</div>
								<div class="col-12 col-md-8">
									<c:if test = "${currentAccount.status == 0}">
										<a style="color: red;">Disable</a>
									</c:if>
									<c:if test = "${currentAccount.status == 1}">
										<a style="color: green;">Enable</a>
									</c:if>
								</div>
							</div>								
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-4">
				<a href="<c:url value='/admin/current-account/detail/${currentAccount.id}/set-balance'/>">
					<button type="button" class="btn btn-success btn-lg btn-block"><i class="fa fa-money"></i> Set Initial Balance</button>
				</a>
			</div>
		</div>
	</div>
	<!-- .animated -->
</div>
<!-- .content -->