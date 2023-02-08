<%@page import="com.entitites.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.ProjectDao"%>
<%@page import="com.entitites.Bug"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editing</title>
</head>
<body>
	<%@include file="Links.jsp"%>
	<%@include file="Navbar.jsp"%>
	<%
	Bug bug = (Bug) session.getAttribute("currentBug");
	%>

	<div class="d-flex align-items-center" style="height: 88vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-3">
					<div class="card">
						<div class="card-header">
							<h1 class="display-5 text-center">Issue Edit</h1>
							<form action="DelBugServ" method="post">
								<div class="text-end">
								    <input name="id" style="display: none;" value="<%=bug.getId()%>">
									<button class="btn btn-danger">Delete</button>
								</div>
							</form>
						</div>
						<div class="card-body">
							<form action="BugEditServ" method="post">
								<table class="table">
									<tbody>
										<tr>
											<th>Bug ID</th>
											<td><input disabled="disabled" class="form-control"
												value="<%=bug.getId()%>"> <input name="id"
												style="display: none" class="form-control"
												value="<%=bug.getId()%>"></td>
										</tr>
										<tr>
											<th>Title</th>
											<td><input name="t" class="form-control"
												value="<%=bug.getName()%>"></td>
										</tr>
										<tr>
											<th>Description</th>
											<td><textarea rows="3" name="d" cols="3"
													class="form-control"><%=bug.getDes()%></textarea></td>
										</tr>
										<tr>
											<th>Project</th>
											<td><select class="form-select" name="proj">
													<option style="display: none;" value="<%=bug.getProj()%>"
														selected><%=bug.getProj()%></option>
													<%
													ProjectDao dao = new ProjectDao(ConnectionProvider.getConnection());
													ArrayList<Project> list = dao.fetchAllProject(user.getEmail());
													for (Project pp : list) {
													%>
													<option value="<%=pp.getPname()%>"><%=pp.getPname()%></option>
													<%
													}
													%>
											</select></td>
										</tr>
										<tr>
											<th>Status</th>
											<td><select name="stat" class="form-select">
													<%
													if (bug.getStatus() == 1) {
													%>
													<option style="display: none;" selected="selected"
														value="<%=bug.getStatus()%>">Closed</option>
													<%
													} else if (bug.getStatus() == 2) {
													%>
													<option style="display: none;" selected="selected"
														value="<%=bug.getStatus()%>">Open</option>
													<%
													} else if (bug.getStatus() == 3) {
													%>
													<option style="display: none;" selected="selected"
														value="<%=bug.getStatus()%>">In Progress</option>
													<%
													} else {
													%>
													<option style="display: none;" selected="selected"
														value="<%=bug.getStatus()%>">Resolved</option>
													<%
													}
													%>
													<option value="1">Closed</option>
													<option value="2">Open</option>
													<option value="3">In Progress</option>
													<option value="4">Resolved</option>
											</select></td>
										</tr>
										<tr>
											<th>Date</th>
											<td><input type="date" name="date" class="form-control"
												value="<%=bug.getDate()%>"></td>
										</tr>
									</tbody>
								</table>
								<div class="text-center">
									<button class="btn btn-primary">Submit</button>
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