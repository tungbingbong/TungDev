<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="breadcrumbs">
	<div class="breadcrumbs-inner">
		<div class="row m-0">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>TRANSFER</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="<c:url value='/customer'/>">Dashboard</a></li>
							<li><a href="#">Transaction</a></li>
							<li class="active">Transfer</li>
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
								<i class="pe-7s-cash"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text">
										<span class="count">${totalAmount}</span> VND
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
								<a style="color: purple; opacity: .6;" href="<c:url value='/customer/transaction/withdraw/history'/>"><i class="pe-7s-news-paper"></i></a>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text">
										<span class="count">${transferTime}</span>
									</div>
									<div class="stat-heading">										
										<div class="stat-heading"><a href="<c:url value='/customer/transaction/transfer/history'/>">Transfer Record</a></div>
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
		                <h4><strong>Transfer</strong></h4>
		            </div>
		            <div class="card-body card-block">
		                <div class="custom-tab">	
		                    <nav>
		                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
		                            <a class="nav-item nav-link active" id="custom-nav-home-tab" data-toggle="tab" href="#custom-nav-home" role="tab" aria-controls="custom-nav-home" aria-selected="true">Same bank</a>
		                            <a class="nav-item nav-link" id="custom-nav-profile-tab" data-toggle="tab" href="#custom-nav-profile" role="tab" aria-controls="custom-nav-profile" aria-selected="false">Other bank</a>		                           
		                        </div>
		                    </nav>
		                    <div class="tab-content pl-3 pt-2" id="nav-tabContent">
		                        <div class="tab-pane fade show active" id="custom-nav-home" role="tabpanel" aria-labelledby="custom-nav-home-tab">
		                        	<c:url var="transfer" value='/customer/transaction/transfer'/>
		                            <br><form action="${transfer}" method="post" class="form-horizontal">
										<div class="row form-group">
											<div class="col col-md-4">
												<label class=" form-control-label">Receiver Account Number</label>
											</div>
											<div class="col-12 col-md-8">
												<input type="text" placeholder="Enter Receiver Account Number" name="accNo" value="" 
												class="form-control">
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-4">
												<label for="text-input" class=" form-control-label">Receiver Name</label>
											</div>
											<div class="col-12 col-md-8">
												<input type="text" id="text-input" placeholder="Enter Receiver Name" name="name" value=""
												class="form-control">
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-4">
												<label for="text-input" class=" form-control-label">Amount</label>
											</div>
											<div class="col-12 col-md-5">
												<input type="number" id="text-input" placeholder="Enter Amount" name="amount" value=""
												class="form-control">
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-4">
												<label for="text-input" class=" form-control-label">Description</label>
											</div>
											<div class="col-12 col-md-8">				
												<textarea id="w3review" name="description" rows="8" cols="30" class="form-control"></textarea>
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
									</form>
		                        </div>
		                        <div class="tab-pane fade" id="custom-nav-profile" role="tabpanel" aria-labelledby="custom-nav-profile-tab">
									<div class="row form-group">
										<div class="col col-md-12">
											<br><label for="text-input" class=" form-control-label">In progress</label>
											<p>This feature is developing...</p>
										</div>
									</div>										
		                        </div>		                        
		                    </div>		
		                </div>
		            </div>
		        </div>
		    </div>
	    </div>
	    <!-- /# column -->
	</div>
	<!-- .animated -->
</div>
<!-- .content -->