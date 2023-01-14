<%@page import="com.entities.User"%>
<%
User us = (User) session.getAttribute("currentUser");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"> <!-- <img class="rounded-circle" style="size:5px;" src="img/AvatarMaker.png">-->
			<i class="fa-solid fa-bug"></i> Bug-Tracker
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">


			<%
			if (us != null) {
			%>
			<!-- Navbar Left-Side -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<span class="fa fa-code" style="color: white;"></span> Actions
				</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="AddBugs.jsp">Add Bugs</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="viewBugs.jsp">View
								Bugs</a></li>
					</ul></li>

			</ul>
			<!-- Navbar Right Side -->

			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="LogoutServ"><i
						class="fa-solid fa-power-off text-white"></i> Logout</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-bs-toggle="modal" data-bs-target="#profileModal"><i
						class="fa-solid fa-circle-user text-white"></i> <%=us.getName()%></a>
					<!-- start of modal --> <!-- Modal -->
					<div class="modal fade" id="profileModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header bg-dark text-white">
									<h1 class="modal-title fs-5" id="exampleModalLabel">
										Profile View</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="container text-center">
										<h5><%=us.getName()%></h5>
										<br>

										<div id="profileDetails">
											<table class="table">

												<tbody>
													<tr>
														<th scope="row">ID</th>
														<td><%=us.getId()%></td>


													</tr>
													<tr>
														<th scope="row">Email</th>
														<td><%=us.getEmail()%></td>


													</tr>
													<tr>
														<th scope="row">Registered On</th>
														<td><%=us.getrDate()%></td>

													</tr>
												</tbody>
											</table>
										</div>

										<div style="display: none;" id="profileEdit">
											<form action="updateServlet" id="updateForm" method="post">
												<table class="table">

													<tbody>
														<tr>
															<th scope="row">Name</th>
															<td><input name="newName" type="text"
																class="form-control" value="<%=us.getName()%>"></td>
														</tr>

														<tr>
															<th scope="row">Email</th>
															<td><input name="newEmail" type="email"
																class="form-control" value="<%=us.getEmail()%>"></td>
														</tr>
														<tr>
															<th scope="row">Password</th>
															<td><input name="newPassword" type="password"
																class="form-control" value="<%=us.getPassword()%>"></td>
														</tr>
													</tbody>
												</table>
												<div class="container text-center">
													<button type="submit" class="btn btn-primary">Save</button>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
									<button type="button" id="edit" class="btn btn-primary">Edit</button>
								</div>
							</div>
						</div>
					</div> <!-- end of modal --></li>
			</ul>
			<%
			} else {
			%>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				

			</ul>
			
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="login.jsp"><span
						style="color: white;" class="fa fa-sign-in "></span> Login</a></li>
				<li class="nav-item"><a class="nav-link" href="register.jsp"><span
						style="color: white;" class="fa fa-user-plus "></span> Sign-up</a></li>
			</ul>
			<%
			}
			%>

		</div>
	</div>
</nav>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		let stat = false;
		$('#edit').click(function() {
			if (stat == false) {
				$('#profileDetails').hide();

				$('#profileEdit').show();

				$('#exampleModalLabel').text("Profile Edit");

				stat = true;

				$(this).text("Back");
			} else {
				$('#profileDetails').show();

				$('#profileEdit').hide();

				$('#exampleModalLabel').text("Profile View");

				stat = false;

				$(this).text("Edit");
			}
		});

		$('#updateForm').on('submit', function(event) {

			event.preventDefault();

			let form = new FormData(this);
			$.ajax({
				url : "updateServlet",
				type : 'post',
				data : form,
				success : function(data, textStatus, jqXHR) {
					console.log(data)

				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR)
				},
				processData : false,
				contentType : false
			});
		});
	});
</script>

