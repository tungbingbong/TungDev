<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %> 
<div class="sufee-login d-flex align-content-center flex-wrap">
    <div class="container">
        <div class="login-content">
            <div class="login-logo">
                <a href="<c:url value='/home'/>">
                    <img class="align-content" src="<c:url value='/template/admin/images/logo.png'/>" alt="">
                </a>
            </div>
            <br>
            <div class="login-form">            	
            	<c:if test="${param.incorrectAccount != null }">
					<div class ="alert alert-danger" align="center"> Username or password is incorrect</div>
				</c:if>     
				<c:if test="${param.accessDenied != null }">
					<div class ="alert alert-danger" align="center"> You are not authorized</div>
				</c:if>
	
                <form action="j_spring_security_check" method="post">
                    <div class="form-group">
                        <label>Username</label>
                        <input type="text" class="form-control" placeholder="Enter Username" name="j_username">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" placeholder="Enter Password" name="j_password">
                    </div>
                    <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Login</button>        
                    <div class="register-link m-t-15 text-center">
                        <p>Don't have account ? <a href="<c:url value='/register'/>">Click here to register</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>