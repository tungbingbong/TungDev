<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>PRIMARY ACCOUNT</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="<c:url value='/admin'/>">Dashboard</a></li>
							<li>Account</li>
							<li class="active">Primary Account</li>
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
			<div class="col-md-10">
				<div class="card">
					<div class="card-header">
						<strong class="card-title pl-2">Primary Account</strong>
					</div>
					<div class="card-body">
						<div class="row justify-content-center">
							<div class="col-lg-5">
								<div class="mx-auto d-block">
									<img src="<c:url value='/template/admin/images/card1.png'/>" alt="">							
								</div>
							</div>
						<hr>
						<div class="col-lg-6">
							<div class="card-text text-sm mx-auto justify-content-center">
								<div class="row form-group">
									<div class="col col-md-4">
										<label>Account Number</label>
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
										<label>Balance</label>
									</div>
									<div class="col-12 col-md-8">
										<a>${currentAccount.balance} VND</a>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-4">
										<label>Valid from</label>
									</div>
									<div class="col-12 col-md-8">
										<a>${currentAccount.openDate}</a>
									</div>
								</div>							
							</div>						
							<hr>						 
							<a href="<c:url value='/customer/current-account/change-pincode'/>"><i class="fa fa-key"></i> Change PINCODE</a>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
		<!-- .row -->
	</div>
	<!-- .animated -->
</div>
<!-- .content -->