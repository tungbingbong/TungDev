<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
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
							<li class="active">Saving Account</li>
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
						<strong class="card-title">Saving Account List</strong>
					</div>
					<div class="card-body">
						<table id="bootstrap-data-table"
							class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>Account Number</th>
									<th>Customer</th>
									<th>Tenor</th>
									<th>Initial Amount</th>									
									<th>Status</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="savingAccount" items="${savingAccount}" varStatus="i">
									<tr>
										<td>${i.index +1 }</td>
										<td>${savingAccount.accNo}</td>
										<td>${savingAccount.user.firstName} ${savingAccount.user.lastName}</td>
										<td>${savingAccount.tenor}</td>
										<td>${savingAccount.initialAmount}</td>										
										<c:if test = "${savingAccount.status == 0}">
											<td><a style="color: red;">Cancel</a></td>
										</c:if>
										<c:if test = "${savingAccount.status == 1}">
											<td><a style="color: green;">Enable</a></td>
										</c:if> 
										<td><a href="<c:url value='/admin/saving-account/detail/${savingAccount.id}'/>"><i class="fa fa-list"></i></a></td>
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