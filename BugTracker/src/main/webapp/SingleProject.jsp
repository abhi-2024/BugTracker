<%@page import="com.entitites.Alert"%>
<%@page import="com.entitites.Project"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Project Details</title>
</head>
<body>
	<%@include file="Links.jsp"%>
	<%@include file="Navbar.jsp"%>
	<%
	if(user==null)
		response.sendRedirect("Login.jsp");
	
	Project p = (Project) session.getAttribute("currentProj");
	%>
	<div class="d-flex align-items-center mt-5" style="height: 80vh">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-3">
					<div class="card">
						<div class="card-header">
							<h1 class="display-6 text-center">Project Details</h1>
							<form class="text-end" action="DeleteProjServ" method="post">
							   <input value="<%=p.getId()%>" name="id" style="display: none;">
								<button type="submit" style="display: none;" id="dbtn"
									class="btn btn-danger">
									<i class="fa-solid fa-trash"> Delete</i>
								</button>
							</form>
						</div>
						<%
						Alert alert = (Alert) session.getAttribute("singProjMSG");
						if (alert != null) {
						%>
						<div class="alert alert-<%=alert.getType()%>" role="alert"><%=alert.getContent()%></div>
						<%
						}
						session.removeAttribute("singProjMSG");
						%>
						<div class="card-body">
							<table class="table" id="projView">
								<tbody>
									<tr>
										<th scope="row">Project ID</th>
										<td><%=p.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Title</th>
										<td><%=p.getPname()%></td>
									</tr>
									<tr>
										<th scope="row">Description</th>
										<td><%=p.getPdesc()%></td>
									</tr>
									<tr>
										<th scope="row">Type</th>
										<td>@<%=p.getPtype()%></td>
									</tr>
									<tr>
										<th scope="row">Current State</th>
										<td><%=p.getPstate()%></td>
									</tr>
									<tr>
										<th scope="row">Created On</th>
										<td><%=p.getPdate()%></td>
									</tr>
								</tbody>
							</table>
							<form id="projEdit" action="UpdateProjServ" method="post"
								style="display: none;">
								<table class="table">
									<tbody>
										<tr>
											<th><label class="form-label">ID</label></th>
											<td><input class="form-control" disabled
												value="<%=p.getId()%>"> <input name="id"
												style="display: none;" class="form-control"
												value="<%=p.getId()%>"></td>
										</tr>
										<tr>
											<th><label class="form-label">Title</label></th>
											<td><input name="na" class="form-control"
												value="<%=p.getPname()%>"></td>
										</tr>
										<tr>
											<th><label class="form-label">Description</label></th>
											<td><textarea name="des" cols="3" rows="3"
													class="form-control"><%=p.getPdesc()%></textarea></td>
										</tr>
										<tr>
											<th><label class="form-label">Type</label></th>
											<td><select name="ty" class="form-select">
													<option selected style="display: none;"
														value="<%=p.getPtype()%>"><%=p.getPtype()%></option>
													<option value="Team">Team</option>
													<option value="Personal">Personal</option>
													<option value="Freelancing">Freelancing</option>
											</select></td>
										</tr>
										<tr>
											<th><label class="form-label">Current State</label></th>
											<td><select name="st" class="form-select">
													<option selected style="display: none;"
														value="<%=p.getPstate()%>"><%=p.getPstate()%></option>
													<option value="Prototype">Prototype</option>
													<option value="Beta">Beta</option>
													<option value="Launched">Launched</option>
											</select></td>
										</tr>
										<tr>
											<th><label class="form-label">Created On</label></th>
											<td><input name="dt" class="form-control" type="date"
												value="<%=p.getPdate()%>"></td>
										</tr>
									</tbody>

								</table>
								<div class="text-center">
									<button class="btn btn-primary">Submit</button>
								</div>
							</form>
							<div class="text-end">

								<button type="button" id="tgg" class="btn btn-warning">
									<i class="fa-solid fa-pen-to-square"></i>
								</button>
								<a href="Projects.jsp" id="vbtn" class="btn btn-primary"><i class="fa-solid fa-chevrons-left"></i> View
									All Projects</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
		$(document).ready(function() {
			let stat = false;
			$('#tgg').click(function() {
				if (stat == false) {
					$('#tgg').removeClass();
					$('#tgg').addClass("btn btn-primary");
					$('#projView').hide();
					$('#projEdit').show();
					$('#dbtn').show();
					$('#tgg').text('Back To View');
					$('#vbtn').hide();
					stat = true;
				} else {
					$('#tgg').removeClass();
					$('#tgg').addClass("btn btn-warning");
					$('#projView').show();
					$('#projEdit').hide();
					$('#dbtn').hide();
					$('#tgg').text('Edit');
					$('#vbtn').show();
					stat = false;
				}
			});
		});
	</script>
</body>
</html>