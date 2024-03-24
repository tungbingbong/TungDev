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
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<strong class="card-title">Primary Account List</strong>
					</div>
					<div class="card-body">
						<table id="bootstrap-data-table"
							class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>Account Number</th>
									<th>Card Number</th>
									<th>Customer Name</th>
									<th>Open Date</th>
									<th>Status</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="currentAccount" items="${currentAccount}" varStatus="i">
									<tr>
										<td>${i.index +1 }</td>
										<td>${currentAccount.accNo}</td>
										<td>${currentAccount.cardNo}</td>
										<td>${currentAccount.user.firstName} ${currentAccount.user.lastName}</td>
										<td>${currentAccount.openDate}</td>
										<c:if test = "${currentAccount.status == 0}">
											<td><a style="color: red;"><i class="fa fa-times"></i> Disable</a></td>
										</c:if>
										<c:if test = "${currentAccount.status == 1}">
											<td><a style="color: green;"><i class="fa fa-check"></i> Enable</a></td>
										</c:if> 
										<c:if test = "${currentAccount.status == 0}">
											<td><a style="color: grey;" href="#activateModal" class="deleteBTN" data-toggle="modal" data-target="#activateModal">
													<i class="fa fa-check-square"></i>
												</a>
												<input type="hidden" id="id" value="${currentAccount.id}" /><input type="hidden" id="id" value="${currentAccount.id}" />
											</td>
										</c:if>
										<c:if test = "${currentAccount.status == 1}">
											<td><a style="color: grey;" href="#deactivateModal" class="deleteBTN" data-toggle="modal" data-target="#deactivateModal">
													<i class="fa fa-minus-square"></i>
												</a>
												<input type="hidden" id="id" value="${currentAccount.id}" /><input type="hidden" id="id" value="${currentAccount.id}" />
											</td>
										</c:if> 
										<td><a href="<c:url value='/admin/current-account/detail/${currentAccount.id}'/>"><i class="fa fa-list"></i></a></td>
									</tr>
								</c:forEach>								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="activateModal" tabindex="-1" role="dialog" aria-labelledby="mediumModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
	            <form method="post" action="<c:url value='/admin/current-account/activate'/>">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <h5 class="modal-title" id="mediumModalLabel">ENABLE ACCOUNT</h5>
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                            <span aria-hidden="true">&times;</span>
	                        </button>
	                    </div>
	                    <div class="modal-body">
	                        <p>This primary account will be enable. Customer can use this account normally. 
	                        <br> Do you want to continue?</p>
	                    </div>
	                    <div class="modal-footer">
	                        <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel">
	                        <input type="submit" class="btn btn-success" value="Enable" />
	                        <input type="hidden" name="id" id="id" />
	                    </div>
	                </div>
	            </form>
            </div>
        </div>
        
        <div class="modal fade" id="deactivateModal" tabindex="-1" role="dialog" aria-labelledby="mediumModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
	            <form method="post" action="<c:url value='/admin/current-account/deactivate'/>">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <h5 class="modal-title" id="mediumModalLabel">DISABLE ACCOUNT</h5>
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                            <span aria-hidden="true">&times;</span>
	                        </button>
	                    </div>
	                    <div class="modal-body">
	                        <p>This primary account will be disabled. Customer will not be allowed to use this account anymore. 
	                        <br> Do you want to continue?</p>
	                    </div>
	                    <div class="modal-footer">
	                        <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel">
	                        <input type="submit" class="btn btn-danger" value="Disable" />
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
			jQuery('#deactivateModal #id').val(id);	 
			jQuery('#activateModal #id').val(id);	
		});
	});
</script>