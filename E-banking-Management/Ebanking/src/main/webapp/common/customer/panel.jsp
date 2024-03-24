<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="<c:url value='/customer'/>"><i class="menu-icon fa fa-laptop"></i>Dashboard</a>
                    </li>
                                        
                    <li class="menu-title">Account</li><!-- /.menu-title -->

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
                        	<i class="menu-icon fa fa-credit-card"></i>Account
                        </a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-caret-right"></i><a href="<c:url value='/customer/current-account'/>">Primary Account</a></li>
                            <li><i class="fa fa-caret-right"></i><a href="<c:url value='/customer/saving-account'/>">Saving Account</a></li>
                            <li><i class="fa fa-caret-right"></i><a href="<c:url value='/customer/loan-account'/>">Loan Account</a></li>
                        </ul>
                    </li>
                    
                    <li class="menu-title">Transaction</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
                        	<i class="menu-icon fa fa-university"></i>Transaction
                        </a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-caret-right"></i><a href="<c:url value='/customer/transaction/deposit'/>">Deposit</a></li>
                            <li><i class="fa fa-caret-right"></i><a href="<c:url value='/customer/transaction/withdraw'/>">Withdraw</a></li>
                            <li><i class="fa fa-caret-right"></i><a href="<c:url value='/customer/transaction/transfer'/>">Transfer</a></li>
                        </ul>
                    </li>
                    
                    <li class="menu-title">Appointment</li><!-- /.menu-title -->
                    <li class="active">
                        <a href="<c:url value='/customer/appointment'/>"> <i class="menu-icon fa fa-calendar"></i> Appointment</a>
                    </li>
                    
					<li class="menu-title">Extra</li><!-- /.menu-title -->                    
                    <li class="active">
                        <a href="<c:url value='/customer/profile'/>"> <i class="menu-icon fa fa-user"></i> Profile</a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
    