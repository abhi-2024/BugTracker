<%@page import="com.entitites.Alert"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
</head>
<body>
	<%@include file="Links.jsp"%>
	<%@include file="Navbar.jsp"%>
	<%
	if (user == null)
		response.sendRedirect("LogoutServ");
	%>
	<div class="d-flex align-items-center" style="height: 90vh">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-3">
					<div class="card">
						<div class="card-header">
							<h1 class="display-6 text-center">User Profile</h1>
						</div>
						<%
						Alert alert = (Alert) session.getAttribute("profileMSG");
						if (alert != null) {
						%>
						<div class="alert alert-<%=alert.getType()%>" role="alert"><%=alert.getContent()%></div>
						<%
						}
						session.removeAttribute("profileMSG");
						%>
						<div class="card-body" id="profileView">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">User ID</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Name</th>
										<td><%=user.getFname()%> <%=user.getLname()%></td>
									</tr>
									<tr>
										<th scope="row">Profession</th>
										<td><%=user.getProfession()%></td>
									</tr>

									<tr>
										<th scope="row">Email</th>
										<td><%=user.getEmail()%></td>
									</tr>

									<tr>
										<th scope="row">Address</th>
										<td><%=user.getAdd()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="card-body" style="display: none;" id="profileEdit">
							<form action="ProfileEditServ" method="post">
								<table class="table">
									<tbody>
										<tr>
											<th scope="row">User ID</th>
											<td><input class="form-control" disabled
												value="<%=user.getId()%>"><input name="id"
												style="display: none;" class="form-control"
												value="<%=user.getId()%>"></td>
										</tr>
										<tr>
											<th scope="row" class="form-label">First Name</th>
											<td><input name="fn" class="form-control"
												value="<%=user.getFname()%>">
										</tr>
										<tr>
											<th scope="row">Last Name</th>
											<td><input name="ln" class="form-control"
												value="<%=user.getLname()%>"></td>
										</tr>

										<tr>
											<th scope="row">Profession</th>
											<td><select name="prof" class="form-select">
													<option value="<%=user.getProfession()%>" selected
														style="display: none;"><%=user.getProfession()%></option>
													<option value="Developer">Developer</option>
													<option value="Student">Student</option>
													<option value="Professor/Tutor">Professor/Tutor</option>
											</select></td>
										</tr>

										<tr>
											<th scope="row">Email</th>
											<td><input disabled class="form-control"
												value="<%=user.getEmail()%>"> <input
												class="form-control" name="em" style="display: none;"
												value="<%=user.getEmail()%>"></td>
										</tr>

										<tr>
											<th>Password</th>
											<td><input type="password" name="pass" id="passw"
												class="form-control" value="<%=user.getPass()%>"> <input
												class="form-check-input" id="pas" onclick="myFunction()"
												type="checkbox"> Show Password</td>
										</tr>

										<tr>
											<th scope="row">Address</th>
											<td><input name="add" class="form-control"
												value="<%=user.getAdd()%>"></td>
										</tr>

									</tbody>
								</table>
								<div class="text-end">
									<button class="btn btn-success">Submit</button>
								</div>

							</form>
						</div>
						<button type="button" id="editBtn" class="btn btn-warning">Edit</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		let stat = false;
		$('#editBtn').click(function() {
			if (stat == false) {
				$('#profileEdit').show();
				$('#profileView').hide();
				$('#editBtn').text("Back to View");
				$('#editBtn').removeClass();
				$('#editBtn').addClass("btn btn-primary");
				stat = true;
			} else {
				$('#profileEdit').hide();
				$('#profileView').show();
				$('#editBtn').text('Edit');
				$('#editBtn').removeClass();
				$('#editBtn').addClass("btn btn-warning");
				stat = false;
			}
		});
	});
	function myFunction() {
		var x = document.getElementById('passw');
		if (x.type === 'password') {
			x.type = 'text';
		} else {
			x.type = 'password';
		}
	}
</script>
</html>