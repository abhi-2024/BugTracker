<%@page import="com.entitites.Alert"%>
<%@page import="com.entitites.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.ProjectDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Bugs</title>
</head>
<body style="overflow: hidden;">
	<%@include file="Links.jsp"%>
	<%@include file="Navbar.jsp"%>

	<div class="d-flex align-items-center" style="height: 93vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-3">
					<div class="card">
						<div class="card-header">
							<h1 class="display-6 text-center">New Bug</h1>
						</div>
						<%
						 Alert alert = (Alert)session.getAttribute("AddBugMSG");
						 if(alert!=null){
						%>
						<div class="alert alert-<%=alert.getType() %>" role="alert"><%=alert.getContent()%></div>
						<% } session.removeAttribute("AddBugMSG"); %>
						<div class="card-body">
							<form action="AddBugServ" enctype="multipart/form-data" method="post">
								<div class="mb-3">
									<label for="formGroupExampleInput" class="form-label">Issue
										Name</label> <input name="iname" type="text" class="form-control"
										id="formGroupExampleInput">
								</div>
								<div class="mb-3">
									<label class="form-label">Description</label>
									<textarea name="des" rows="3" cols="3" class="form-control"
										placeholder="A small description for other users to understand your issue..."></textarea>
								</div>

								<div class="row">
									<div class="col">

										<label class="form-label">Project</label> <select
											class="form-select" name="proj">
											<option disabled selected>Select an option</option>
											<%
											ProjectDao dao = new ProjectDao(ConnectionProvider.getConnection());
											ArrayList<Project> list = dao.fetchAllProject(user.getEmail());
											for (Project pp : list) {
											%>
											<option value="<%=pp.getPname()%>"><%=pp.getPname()%></option>
											<%
											}
											%>
										</select>

									</div>
									<div class="col">
										<label class="form-label">Status</label> <select name="stat"
											class="form-select">
											<option disabled="disabled" selected="selected">Please
												select option</option>
											<option value="1">Closed</option>
											<option value="2">Open</option>
											<option value="3">In Progress</option>
											<option value="4">Resolved</option>
										</select>
									</div>
								</div>

								<div class="mb-3">
									<label for="formGroupExampleInput2" class="form-label">Discovered
										on</label> <input name="date" type="date" class="form-control">
								</div>

								<div class="mb-3">
									<label class="form-label">Media Regarding the issue</label> <input
										type="file" name="media" class="form-control">
								</div>
								<div class="text-center">
								     <input value="<%=user.getEmail()%>" style="display: none;" name="email">
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