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
	<h1>Transfer Other Bank</h1>
	<form action="<c:url value='/customer/transaction/transfer/other-bank'/>" method="post">
		  <div>    
		    <label for="type"><b>Type</b></label><br>
		    <input type="text" placeholder="Enter Type" name="type" required><br>
		    
		    <label for="amount"><b>Amount</b></label><br>
		    <input type="text" placeholder="Enter Amount" name="amount" required><br>
		    
		    <label for="receiver"><b>Receiver</b></label><br>
		    <input type="text" placeholder="Enter Receiver" name="receiver" required><br>
		    
		    <label for="bank"><b>Bank</b></label><br>
		    <input type="text" placeholder="Enter Bank" name="bank" required><br>
		    
		    <label for="date"><b>Date</b></label><br>
		    <input type="date" placeholder="Enter DOB" name="date" required><br>
		    
		    <label for="description"><b>Description</b></label><br>
		    <input type="text" placeholder="Enter Description" name="description"><br>
		    
		    <span>*Service fee for transfers to other banks will be applied. </span> <br>
		    
		    <button type="submit">Transfer</button><br> 
		  </div>
	</form>
	<a href="<c:url value='/customer/transaction/transfer'/>">Show Transfer History</a>
</body>
</html>