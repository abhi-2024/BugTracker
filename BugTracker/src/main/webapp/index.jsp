<%@page import="com.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.userDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="Error_Page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<body>
	<%@include file="Navbar.jsp"%>


	<div class="container">
		<img class="rounded float-start mt-5" height="300" src="img/bug.jpg">
		<h1 class="display-4 text-center mt-3 font-monospace">
			<i class="fa-solid fa-bug" style="color: #4F29C8"></i> BUG TRACKER
		</h1>

		<div class="lead mt-5">
			A bug tracker is a software application that is used to track and
			manage issues, defects, or bugs in software development. It is a tool
			that helps developers and project managers to identify, prioritize,
			and fix issues in a software project. Following are the
			functionalities that this the website provides to it's user.
			<ol class="list-group list-group-flush list-group-numbered">
				<li class="list-group-item"><a href="AddBugs.jsp"
					class="link-success lead" style="text-decoration: none;"> Adding
						New Bugs</a></li>

				<li class="list-group-item"><a href="viewBugs.jsp"
					class="link-success lead" style="text-decoration: none;">Viewing
						Bugs</a></li>

			</ol>
		</div>
		
		<%
		User user = (User) session.getAttribute("currentUser");
		if (user == null) {
		%> 
		<div class="text-center"> <a class="btn btn-success" href="login.jsp">Login</a> Kindly login to get access to this website</div>
		
		<% } %>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
</body>
</html>