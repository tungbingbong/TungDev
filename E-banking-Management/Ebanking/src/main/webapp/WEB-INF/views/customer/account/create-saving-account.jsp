<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Banking</title>
</head>
<body>
	<h1>Create Saving Account</h1>
	<form action="<c:url value='/customer/saving-account/create'/>" method="post">
		  <div>    
		    <label for="initAmount"><b>Initial Amount</b></label><br>
		    <input type="text" placeholder="Enter Initial Amount" name="initAmount" required><br>
		    
		    <label for="tenor"><b>Tenor</b></label><br>
		    <input type="text" placeholder="Choose Tenor" name="tenor" required><br>
		    
		    <label for="openDate"><b>Open Date</b></label><br>
		    <input type="date" placeholder="Enter Open Date" name="openDate" required><br>
		    
		    <label for="closeDate"><b>Close Date</b></label><br>
		    <input type="date" placeholder="Enter Close Date" name="closeDate" required><br>
		    
		    <label for="description"><b>Description</b></label><br>
		    <input type="text" placeholder="Enter Description" name="description"><br>
		    
		    <label for="pinCode"><b>Pin Code</b></label><br>
		    <input type="password" placeholder="Enter PINCODE" name="pinCode" required><br>
		
		    <button type="submit">Create</button><br> 
		  </div>
	</form>
</body>
</html> -->
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>SAVING ACCOUNT</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="<c:url value='/admin'/>">Dashboard</a></li>
							<li><a href="#">Account</a></li>
							<li class="active">Create Saving Account</li>
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
						<strong>Create</strong> New Saving Account
					</div>
					<div class="card-body card-block">
						<c:url var="createSavingAccount" value='/customer/saving-account/create'/>
						<form:form action="${createSavingAccount}" method="post" modelAttribute="savingAccount" class="form-horizontal">
							<div class="row form-group">
								<div class="col col-md-3">
									<label class=" form-control-label">Initial Amount</label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" placeholder="Enter Initial Amount" path="initialAmount" 
									class="form-control"/>
									<small class="form-text text-muted"><form:errors path="initialAmount" style="color:red;" cssClass="error"/></small>
								</div>
							</div>
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
									<form:password id="w3review" path="pinCode" maxlength="4" placeholder="Enter 4-digits PINCODE" class="form-control"/>
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