<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Banking</title>
</head>
<body>
	<header>
		<div>
			<h1><a href="<c:url value='/home'/>"><span>E-Banking</span></a></h1>
		</div>
		<nav>
			<ul>
				<li><a href="<c:url value='/home'/>"><strong>Home</strong></a></li>
				<li><a href="#about">About Us</a></li>
				<li><a href="<c:url value='/login'/>">Login</a></li>
			</ul>
		</nav>
	</header>
	<section>
		<div>
			<h1>Welcome to ABC E-Banking App!</h1>
			<h2>-Slogan-</h2>
			<a href="<c:url value='/login'/>">Login</a>
		</div>
	</section>
</body>
</html>