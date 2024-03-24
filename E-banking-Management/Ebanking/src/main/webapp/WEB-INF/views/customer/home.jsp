<%@ page import="com.ebanking.util.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-12">
				<div class="page-header float-left">
					<div class="page-title">
						<h1><strong>Welcome Customer,</strong> <%=SecurityUtils.getPrincipal().getFirstName()%> <%=SecurityUtils.getPrincipal().getLastName() %>! </h1>
					</div>					
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Content -->
<div class="content">
	<!-- Animated -->
	<div class="animated fadeIn">
		<!-- Widgets  -->
		<div class="row">
			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-1">
								<i class="pe-7s-cash"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text">										
										<span class="count">${totalAmount}</span>VND										
									</div>
									<div class="stat-heading">										
										<div class="stat-heading">Total Balance</div>
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
								<i class="pe-7s-piggy"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text">
										<span class="count">${totalSavingBalance}</span>VND
									</div>
									<div class="stat-heading">Saving</div>
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
							<div class="stat-icon dib flat-color-4">
								<i class="pe-7s-note2"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text">
										<span class="count">${totalLoanBalance}</span>VND
									</div>
									<div class="stat-heading">Loan</div>
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
							<div class="stat-icon dib flat-color-3">
								<i class="pe-7s-culture"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text">
										<span class="count">${totalTransactionTime}</span>
									</div>
									<div class="stat-heading">Transactions</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="clearfix"></div>

		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="card">
					<div class="card-body">
						<a href="<c:url value='/customer/transaction/deposit'/>">
							<button type="button" class="btn btn-primary btn-lg btn-block">Deposit</button>
						</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="card">
					<div class="card-body">
						<a href="<c:url value='/customer/transaction/withdraw'/>">
							<button type="button" class="btn btn-success btn-lg btn-block">Withdraw</button>
						</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="card">
					<div class="card-body">
						<a href="<c:url value='/customer/transaction/transfer'/>">
							<button type="button" class="btn btn-secondary btn-lg btn-block">Transfer</button>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="clearfix"></div>
		
		<!-- Chart, Analysis -->
		<div class="orders">
			<div class="row">				
				<div class="col-xl-8">
				<div class="card">
					<div class="card-body">
						<h4 class="box-title">Account Manager</h4>
					</div>
					<div class="card-body--">
						<div class="table-stats order-table ov-h">
							<table class="table ">
								<thead>
									<tr>
										<th class="serial">#</th>
										<th>Type</th>
										<th>Account Number</th>
										<th>Amount</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Primary Account</td>
										<td>${currentAccount.accNo}</td>
										<td><span class="count">${currentAccount.balance}</span></td>	
										<c:if test = "${currentAccount.status == 0}">
											<td><span class="badge badge-pending">Pending</span></td>
										</c:if>
										<c:if test = "${currentAccount.status == 1}">
											<td><span class="badge badge-complete">Enable</span></td>
										</c:if>									
									</tr>																								
								</tbody>
							</table>
						</div>
						<!-- /.table-stats -->
					</div>
				</div>
				<!-- /.card -->
			</div>
			<!-- /.col-lg-8 -->
			
			<div class="col-md-12 col-lg-4">
				<div class="card">
					<div class="card-body">
						<!-- <h4 class="box-title">Chandler</h4> -->
						<div class="calender-cont widget-calender">
							<div id="calendar"></div>
						</div>
					</div>
				</div>
				<!-- /.card -->
			</div> <!-- /.calendar -->
				
			</div>
		</div>
		<!-- /.orders -->

		<!-- /Account Table -->
		<!-- Modal - Calendar - Add New Event -->
		<div class="modal fade none-border" id="event-modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">
							<strong>Add New Event</strong>
						</h4>
					</div>
					<div class="modal-body"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default waves-effect"
							data-dismiss="modal">Close</button>
						<button type="button"
							class="btn btn-success save-event waves-effect waves-light">Create
							event</button>
						<button type="button"
							class="btn btn-danger delete-event waves-effect waves-light"
							data-dismiss="modal">Delete</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /#event-modal -->
		<!-- Modal - Calendar - Add Category -->
		<div class="modal fade none-border" id="add-category">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">
							<strong>Add a category </strong>
						</h4>
					</div>
					<div class="modal-body">
						<form>
							<div class="row">
								<div class="col-md-6">
									<label class="control-label">Category Name</label> <input
										class="form-control form-white" placeholder="Enter name"
										type="text" name="category-name" />
								</div>
								<div class="col-md-6">
									<label class="control-label">Choose Category Color</label> <select
										class="form-control form-white"
										data-placeholder="Choose a color..." name="category-color">
										<option value="success">Success</option>
										<option value="danger">Danger</option>
										<option value="info">Info</option>
										<option value="pink">Pink</option>
										<option value="primary">Primary</option>
										<option value="warning">Warning</option>
									</select>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default waves-effect"
							data-dismiss="modal">Close</button>
						<button type="button"
							class="btn btn-danger waves-effect waves-light save-category"
							data-dismiss="modal">Save</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /#add-category -->
	</div>
	<!-- .animated -->
</div>
<!-- /.content -->
