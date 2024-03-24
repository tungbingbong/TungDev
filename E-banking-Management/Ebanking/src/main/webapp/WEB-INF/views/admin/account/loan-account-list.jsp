<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
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
									<th>Customer</th>
									<th>Tenor</th>
									<th>Total Amount</th>
									<th>Interest Rate(%)</th>
									<th>Status</th>
									<th></th>
									<th></th>									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="loanAccount" items="${loanAccount}" varStatus="i">
									<tr>
										<td>${i.index +1 }</td>
										<td>${loanAccount.accNo}</td>
										<td>${loanAccount.user.firstName} ${loanAccount.user.lastName}</td>
										<td>${loanAccount.tenor}</td>
										<td>${loanAccount.totalAmount}</td>	
										<td>${loanAccount.interestRate.interestRate}</td>										
										<c:if test = "${loanAccount.status == 0}">
											<td><a style="color: gray;"><i class="fa fa-spinner"></i> Pending</a></td>
										</c:if>
										<c:if test = "${loanAccount.status == 1}">
											<td><a style="color: green;"><i class="fa fa-check"></i> Enable</a></td>
										</c:if> 
										<c:if test = "${loanAccount.status == 2}">
											<td><a style="color: blue;"><i class="fa fa-check-square-o"></i> Finished</a></td>
										</c:if> 
										<c:if test = "${loanAccount.status == 0}">
											<td><a style="color: grey;" href="#mediumModal" class="deleteBTN" data-toggle="modal" data-target="#mediumModal">
													<i class="fa fa-square-o"></i>
												</a>
												<input type="hidden" id="id" value="${loanAccount.id}" /><input type="hidden" id="id" value="${loanAccount.id}" />
											</td>
										</c:if>
										<c:if test = "${loanAccount.status == 1 || loanAccount.status == 2}">
											<td><a style="color: green;"><i class="fa fa-check-square"></i></a></td>
										</c:if> 										
										<td><a href="<c:url value='/admin/loan-account/detail/${loanAccount.id}'/>"><i class="fa fa-list"></i></a></td>
									</tr>
								</c:forEach>								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="mediumModal" tabindex="-1" role="dialog" aria-labelledby="mediumModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
	            <form method="post" action="<c:url value='/admin/loan-account/verify'/>">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <h5 class="modal-title" id="mediumModalLabel">Accept Appointment Record</h5>
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                            <span aria-hidden="true">&times;</span>
	                        </button>
	                    </div>
	                    <div class="modal-body">
	                        <p>This loan account will be verified as an valid account. Do you want to continue?</p>
	                    </div>
	                    <div class="modal-footer">
	                        <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel">
	                        <input type="submit" class="btn btn-success" value="Accept" />
	                        <input type="hidden" name="id" id="id" />
	                    </div>
	                </div>
	            </form>
            </div>
        </div> 
	</div>
	<!-- .animated -->
</div>
<!-- .content -->

<script type="text/javascript">
	jQuery(document).ready(function($) {
		jQuery('table .deleteBTN').on('click', function($){
			var id = jQuery(this).parent().find('#id').val();
			jQuery('#mediumModal #id').val(id);	 
		});
	});
</script>