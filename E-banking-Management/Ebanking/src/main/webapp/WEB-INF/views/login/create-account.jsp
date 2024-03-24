<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="sufee-login d-flex align-content-center flex-wrap">
	<div class="container">
		<div class="login-content">
			<div class="login-logo">
				<a href="<c:url value='/home'/>"> <img class="align-content"
					src="<c:url value='/template/admin/images/logo.png'/>" alt="">
				</a>
			</div>
			<br>
			<div class="login-form">
				<c:url var="createAccount" value='/create-account'/>
				<form:form action="${createAccount}" method="post" commandName="currentAccount" class="form-horizontal">
					<div class="form-group">
						<label>PINCODE</label> 
						<form:password class="form-control" maxlength="4" path="pinCode" placeholder="Pincode 4-digits"/>
						<small class="form-text text-muted"><form:errors path="pinCode" style="color:red;" cssClass="error"/></small>
					</div>									
					<hr>
					<button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Create</button>					
				</form:form>
			</div>
		</div>
	</div>
</div>