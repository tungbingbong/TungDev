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
				<c:url var="register" value='/register'/>
				<form:form action="${register}" method="post" commandName="user" class="form-horizontal">
					<div class="form-group">
						<label>Username</label> 
						<form:input type="text" class="form-control" path="username" placeholder="Username"/>
						<small class="form-text text-muted"><form:errors path="username" style="color:red;" cssClass="error"/></small>
					</div>
					<div class="form-group">
						<label>Email address</label> 
						<form:input type="email" class="form-control" path="email" placeholder="Email"/>
						<small class="form-text text-muted"><form:errors path="email" style="color:red;" cssClass="error"/></small>
					</div>
					<div class="form-group">
						<label>Password</label> 
						<form:input type="password" class="form-control" path="password" placeholder="Password"/>
						<small class="form-text text-muted"><form:errors path="password" style="color:red;" cssClass="error"/></small>
					</div>
					<hr>
					<div class="form-group">
						<label>First Name</label> 
						<form:input type="text" class="form-control" path="firstName" placeholder="First Name"/>
						<small class="form-text text-muted"><form:errors path="firstName" style="color:red;" cssClass="error"/></small>
					</div>
					<div class="form-group">
						<label>Last Name</label> 
						<form:input type="text" class="form-control" path="lastName" placeholder="Last Name"/>
						<small class="form-text text-muted"><form:errors path="lastName" style="color:red;" cssClass="error"/></small>
					</div>
					<div class="form-group">
						<label>Gender</label> 
						<form:input type="text" class="form-control" path="gender" placeholder="Gender"/>
						<small class="form-text text-muted"><form:errors path="gender" style="color:red;" cssClass="error"/></small>
					</div>
					<div class="form-group">
						<label>Date of Birth</label> 
						<form:input type="date" class="form-control" path="dob" placeholder="DoB"/>
						<small class="form-text text-muted"><form:errors path="dob" style="color:red;" cssClass="error"/></small>
					</div>
					<div class="form-group">
						<label>Phone</label> 
						<form:input type="text" class="form-control" path="phone" placeholder="Phone"/>
						<small class="form-text text-muted"><form:errors path="phone" style="color:red;" cssClass="error"/></small>
					</div>
					<hr>
					<div class="form-group">
						<label>Nationality</label> 
						<form:input type="text" class="form-control" path="nationality" placeholder="Nationality"/>
						<small class="form-text text-muted"><form:errors path="nationality" style="color:red;" cssClass="error"/></small>
					</div>
					<div class="form-group">
						<label>City</label> 
						<form:input type="text" class="form-control" path="city" placeholder="City"/>
						<small class="form-text text-muted"><form:errors path="city" style="color:red;" cssClass="error"/></small>
					</div>
					<div class="form-group">
						<label>Address</label> 
						<form:input type="text" class="form-control" path="address" placeholder="Address"/>
						<small class="form-text text-muted"><form:errors path="address" style="color:red;" cssClass="error"/></small>
					</div>
					<hr>
					<div class="form-group">
						<label>Salary</label> 
						<form:input type="text" class="form-control" path="salary" placeholder="Salary"/>
						<small class="form-text text-muted"><form:errors path="salary" style="color:red;" cssClass="error"/></small>
					</div>					
					<hr>
					<button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Register</button>
					<hr>					
					<div class="register-link m-t-15 text-center">
						<p>Already have account ? <a href="<c:url value='/login'/>">Click here to login</a></p>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>