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
							<li class="active">Create Loan Account</li>
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
			<div class="col-lg-6">
				<div class="card">
					<div class="card-header">
						<strong>Create</strong> New Loan Account
					</div>
					<div class="card-body card-block">
						<c:url var="createLoanAccount" value='/customer/loan-account/create'/>
						<form:form action="${createLoanAccount}" method="post" modelAttribute="loanAccount" class="form-horizontal">
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">Tenor</label>
								</div>
								<div class="col-12 col-md-6">
									<form:input type="text" id="text-input" placeholder="Enter Tenor" path="tenor" 
									class="form-control"/>		
									<small class="form-text text-muted"><form:errors path="tenor" style="color:red;" cssClass="error"/></small>							
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label class=" form-control-label">Total Amount</label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" placeholder="Enter Total Amount" path="totalAmount" 
									class="form-control"/>
									<small class="form-text text-muted"><form:errors path="totalAmount" style="color:red;" cssClass="error"/></small>
								</div>
							</div>							
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">Description</label>
								</div>
								<div class="col-12 col-md-9">
									<form:textarea id="w3review" path="description" rows="8" cols="30" class="form-control"/>
								</div>
							</div>	
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">PINCODE</label>
								</div>
								<div class="col-12 col-md-6">
									<form:password id="w3review" path="pinCode" maxlength="4" class="form-control"/>
									<small class="form-text text-muted"><form:errors path="pinCode" style="color:red;" cssClass="error"/></small>
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