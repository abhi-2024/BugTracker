<%@page import="com.entitites.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.ProjectDao"%>
<%@page import="com.entitites.Alert"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Projects</title>
</head>
<body>
	<%@include file="Links.jsp"%>
	<%@include file="Navbar.jsp"%>
	<%
	if(user==null)
		response.sendRedirect("Login.jsp");
	%>

	<div class="container align-items-center mt-5">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h1 class="display-6 text-center">Projects</h1>
					</div>
					<%
					Alert alert1 = (Alert) session.getAttribute("viewProjMSG");
					if (alert1 != null) {
					%>
					<div class="alert alert-<%=alert1.getType()%>" role="alert"><%=alert1.getContent()%></div>
					<%
					}
					session.removeAttribute("viewProjMSG");
					%>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Title</th>
									<th scope="col">State</th>
									<th scope="col">Type</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<%
								ProjectDao dao = new ProjectDao(ConnectionProvider.getConnection());
								ArrayList<Project> list = dao.fetchAllProject(user.getEmail());
								int c=1;
								for(Project pp : list){
								%>
								<tr>
									<th scope="row"><%=c++ %></th>
									<td><%=pp.getPname() %></td>
									<td><%=pp.getPstate() %></td>
									<td>@<%=pp.getPtype() %></td>
									<td>
									 <form action="SingleProjServ" method="post">
									     <input style="display: none;" name="pid" value="<%=pp.getId()%>">
									     <button class="btn"><i class="fa-solid fa-eye"></i></button>
									 </form>
									</td>
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h1 class="display-6 text-center">Add Projects</h1>
					</div>
					<%
					Alert alert = (Alert) session.getAttribute("addProjMSG");
					if (alert != null) {
					%>
					<div class="alert alert-<%=alert.getType()%>" role="alert"><%=alert.getContent()%></div>
					<%
					}
					session.removeAttribute("addProjMSG");
					%>
					<div class="card-body">
						<form action="AddProjServ" method="post">
							<label class="form-label">Project Title</label> <input
								class="form-control" name="title"> <label
								class="form-label">Description</label>
							<textarea class="form-control" name="desc" rows="3" cols="3"></textarea>

							<label class="form-label">Current State</label> <select
								class="form-select" name="state">
								<option disabled selected>Please Select an Option</option>
								<option value="Prototype">Prototype</option>
								<option value="Beta">Beta</option>
								<option value="Launched">Launched</option>
							</select> <label class="form-label">Type</label> <select
								class="form-select" name="type">
								<option disabled selected>Please Select an Option</option>
								<option value="Team">Team</option>
								<option value="Personal">Personal</option>
								<option value="Freelancing">Freelancing</option>
							</select> <label>Created on</label> <input class="form-select" name="date"
								type="date">
								
								<input name="user" style="display: none;" value="<%=user.getEmail()%>" class="form-control">
							<div class="text-end mt-2">
								<button class="btn btn-primary">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>