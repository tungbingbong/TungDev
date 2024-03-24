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
							<li><a href="#">Extras</a></li>
							<li class="active">Profile</li>
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
			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-1">
								<a style="color: green; opacity: .6;" href="<c:url value='/customer/current-account'/>"><i class="pe-7s-cash"></i></a>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text">
										<span class="count">${totalAmount}</span> VND
									</div>
									<div class="stat-heading">										
										<div class="stat-heading"><a href="<c:url value='/customer/current-account'/>">Total Balance</a></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-2">
								<a style="color: purple; opacity: .6;" href="<c:url value='/customer/transaction/deposit/history'/>"><i class="pe-7s-news-paper"></i></a>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text">
										<span class="count">${depositTime}</span>
									</div>
									<div class="stat-heading">										
										<div class="stat-heading"><a href="<c:url value='/customer/transaction/deposit/history'/>">Deposit Record</a></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-header">
						<strong>Make</strong> A Deposit
					</div>
					<div class="card-body card-block">
						<c:url var="deposit" value='/customer/transaction/deposit'/>
						<form:form action="${deposit}" method="post" modelAttribute="transaction" class="form-horizontal">
							<div class="row form-group">
								<div class="col col-md-4">
									<label for="text-input" class=" form-control-label">Amount</label>
								</div>
								<div class="col-12 col-md-5">
									<form:input type="number" id="text-input" placeholder="Enter Amount" path="amount" 
									class="form-control"/>
									<small class="form-text text-muted"><form:errors path="amount" style="color:red;" cssClass="error"/></small>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-4">
									<label for="text-input" class=" form-control-label">Description</label>
								</div>
								<div class="col-12 col-md-8">				
									<form:textarea id="w3review" path="description" rows="8" cols="30" class="form-control"/>
								</div>
							</div>										
							<hr>
							<div class="">							
								<button type="submit" class="btn btn-primary btn-sm">
									<i class="fa fa-dot-circle-o"></i> Submit
								</button>
								<button type="reset" class="btn btn-danger btn-sm">
									<i class="fa fa-ban"></i> Reset
								</button>
								<%-- <a href="<c:url value='/customer/transaction/deposit/history'/>">
									<button type="button" class="btn btn-secondary btn-sm"><i class="fa fa-list"></i> Deposit History</button>
								</a> --%>
							</div>
						</form:form>
					</div>					
				</div>
			</div>
		</div>
	</div>
	<!-- .animated -->
</div>
<!-- .content -->