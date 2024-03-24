<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Banking</title>
</head>
<body>
	<h1>Create New Customer</h1>
	<form action="<c:url value='/admin/customer/create'/>" method="post">
	  <div>    
	    <label for="firstname"><b>First Name</b></label><br>
	    <input type="text" placeholder="Enter First Name" name="firstName" required><br>
	    
	    <label for="lastname"><b>Last Name</b></label><br>
	    <input type="text" placeholder="Enter Last Name" name="lastName" required><br>
	    
	    <label for="gender"><b>Gender</b></label><br>
	    <input type="text" placeholder="Enter Gender" name="gender" required><br>
	    
	    <label for="dob"><b>DOB</b></label><br>
	    <input type="date" placeholder="Enter DOB" name="dob" required><br>
	    
	    <label for="email"><b>Email</b></label><br>
	    <input type="email" placeholder="Enter Email" name="email" required><br>
	    
	    <label for="phone"><b>Phone</b></label><br>
	    <input type="text" placeholder="Enter Phone" name="phone" required><br>
	    
	    <label for="nationality"><b>Nationality</b></label><br>
	    <input type="text" placeholder="Enter Nationality" name="nationality" required><br>
	    
	    <label for="city"><b>City</b></label><br>
	    <input type="text" placeholder="Enter City" name="city" required><br>
	    
	    <label for="address"><b>Address</b></label><br>
	    <input type="text" placeholder="Enter Address" name="address" required><br>
	    
	    <label for="salary"><b>Salary</b></label><br>
	    <input type="text" placeholder="Enter Salary" name="salary" required><br>
	    
	    <label for="username"><b>Username</b></label><br>
	    <input type="text" placeholder="Enter Username" name="username" required><br>
	
	    <label for="password"><b>Password</b></label><br>
	    <input type="password" placeholder="Enter Password" name="password" required><br>
	
	    <button type="submit">Create</button><br> 
	  </div>
	</form>
</body>
</html>