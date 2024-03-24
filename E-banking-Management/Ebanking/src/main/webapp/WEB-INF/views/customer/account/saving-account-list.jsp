<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
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
							<li><a href="<c:url value='/customer'/>">Dashboard</a></li>
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
		<div class="row justify-content-center">
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
									<th>Tenor</th>
									<th>Initial Amount</th>	
									<th>Open Date</th>
									<th>Close Date</th>
									<th>Status</th>
									<th></th>
								</tr>
							</thead>
							<tbody>								
								<c:forEach var="savingAccounts" items="${savingAccounts}" varStatus="i">
									<tr>
										<td>${i.index +1}</td>
										<td>${savingAccounts.accNo}</td>
										<td>${savingAccounts.tenor}</td>
										<td>${savingAccounts.initialAmount}</td>
										<td>${savingAccounts.openDate}</td>
										<td>${savingAccounts.closeDate}</td>
										<c:if test = "${savingAccounts.status == 0}">
											<td><span class="badge badge-pending">Deleted</span></td>
										</c:if>
										<c:if test = "${savingAccounts.status == 1}">
											<td><span class="badge badge-pending">Active</span></td>
										</c:if>								
										<td>
											<a href="#mediumModal" class="deleteBTN" data-toggle="modal" data-target="#mediumModal"><i class="fa fa-trash"></i></a>
											<input type="hidden" id="id" value="${savingAccounts.id}" />
										</td>									
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
        
		<div class="row justify-content-center">
			<div class="col-lg-4">
				<a href="<c:url value='/customer/saving-account/create'/>">
					<button type="button" class="btn btn-success btn-lg btn-block"><i class="fa fa-plus-circle"></i> Make New Saving Account</button>
				</a>
			</div>
		</div>
        
        <div class="modal fade" id="mediumModal" tabindex="-1" role="dialog" aria-labelledby="mediumModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
	            <form method="post" action="<c:url value='/customer/saving-account/delete'/>">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <h5 class="modal-title" id="mediumModalLabel">Delete Saving Account</h5>
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                            <span aria-hidden="true">&times;</span>
	                        </button>
	                    </div>
	                    <div class="modal-body">
	                        <p>You will remove this saving account completely. Do you want to continue?</p>
	                    </div>
	                    <div class="modal-footer">
	                        <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel">
	                        <input type="submit" class="btn btn-danger" value="Delete" />
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