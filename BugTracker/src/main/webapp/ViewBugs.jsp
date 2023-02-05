<%@page import="com.entitites.Bug"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.BugDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bug Records</title>
</head>
<body>
	<%@include file="Links.jsp"%>
	<%@include file="Navbar.jsp"%>
	<%if(user==null)
		response.sendRedirect("Login.jsp");
		%>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h1 class="display-6 text-center">Bugs</h1>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Issue ID</th>
									<th scope="col">Name</th>
									<th scope="col">State</th>
									<th scope="col">Project</th>
									<th scope="row"></th>
								</tr>
							</thead>
							<tbody>
							 <%
							  BugDao dao = new BugDao(ConnectionProvider.getConnection());
							  ArrayList<Bug> list = dao.fetchAllBugs(user.getEmail());
							  for(Bug bb : list){
							 %>
								<tr>
									<th scope="row"><%=bb.getId() %></th>
									<td><%=bb.getName() %></td>
									
									<% if(bb.getStatus()==1){ %>
									   <td><i class="fa-solid fa-door-closed" style="color: brown;"></i> Closed</td>
									<%} else if(bb.getStatus()==2){ %>
									    <td><i class="fa-solid fa-rocket" style="color: red;"></i> Open</td>
									<% }else if(bb.getStatus()==3){ %>
									    <td><i class="fa-solid fa-spin fa-spinner" style="color: blue;"></i> In Progress</td>
									<%} else{%>
									    <td><i class="fa-solid fa-circle-check" style="color: green;"></i> Resolved</td>
									<%} %>
									 
									<td><%=bb.getProj() %></td>
									<td><i class="fa-solid fa-chart-simple"></i></td>
									<td><form action="ViewBugServ" method="post"><input style="display: none;" value="<%=bb.getId()%>"><button class="btn"><i style="color: red;" class="fa-solid fa-pen-to-square"></i></button></form></td>
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-header"></div>
					<div class="card-body"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>