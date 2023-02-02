<%@page import="com.entitites.Alert"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%@include file="Links.jsp"%>
	<%@include file="Navbar.jsp"%>
	<div class="d-flex align-items-center" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-3">
					<div class="card">
						<div class="card-header">
							<h1 class="display-6 text-center">Sign In</h1>
						</div>
						<%
						 Alert alert0 = (Alert)session.getAttribute("loginMSG");
						 if(alert0!=null){
						%>
						<div class="alert alert-<%=alert0.getType() %>" role="alert"><%=alert0.getContent() %></div>
						<% } session.removeAttribute("loginMSG"); %>
						<div class="card-body">
							<form action="LoginServ" method="post">
								<div class="form-floating mb-3">
									<input type="email" name="email" class="form-control"
										id="floatingInput" placeholder="name@example.com"> <label
										for="floatingInput">Email address</label>
								</div>
								<div class="form-floating">
									<input name="pass" type="password" class="form-control"
										id="floatingPassword" placeholder="Password"> <label
										for="floatingPassword">Password</label>
								</div>
								<div class="mt-2">
									<button class="btn btn-primary">Login</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>