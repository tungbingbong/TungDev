<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
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
							<li class="active">Primary Account Set Initial Balance</li>
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
						<strong>Set</strong> Initial Balance 
					</div>
					<div class="card-body card-block">
						<c:url var="currentAccountSetBalance" value='/admin/current-account/detail/${currentAccount.id}/set-balance'/>
						<form:form action="${currentAccountSetBalance}" method="post" commandName="currentAccount" class="form-horizontal">
							<div class="row form-group">
								<div class="col col-md-3">
									<label class=" form-control-label">New Balance</label>
								</div>
								<div class="col-12 col-md-9">
									<form:input type="text" placeholder="Enter New Balance" path="balance" value="${currentAccount.balance}" 
									class="form-control"/>
									<small class="form-text text-muted"><form:errors path="balance" style="color:red;" cssClass="error"/></small>
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