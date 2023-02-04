<%@page import="com.entitites.User"%>
<%
User user = (User) session.getAttribute("currentUser");
%>


<nav class="navbar navbar-expand-lg bg-body-tertiary bg-dark"
	data-bs-theme="dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fa-solid fa-bug"></i>
			Bug-Tracker</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- NAVBAR LEFT SIDE User Side -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<%
				if (user != null) {
				%>
				<li class="nav-item"><a class="nav-link active" href="Projects.jsp">Projects</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link active dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> Bugs </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="AddBug.jsp">New Bug</a></li>
						<li><a class="dropdown-item" href="ViewBugs.jsp">Bug
								Records</a></li>
					</ul></li>
				<%
				}
				%>
			</ul>
			<!-- End of left side User Side -->

			<!-- NAVBAR RIGHT SIDE -->

			<ul class="navbar-nav mr-right">
				<%
				if (user == null) {
				%>
				<li class="nav-item"><a class="nav-link active" href="Login.jsp"><i
						class="fa-solid fa-person-booth"></i> Login</a></li>
				<li class="nav-item"><a class="nav-link active" href="Signup.jsp"><i
						class="fa-solid fa-user-plus"></i> Sign-Up</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link active" href="Profile.jsp"><i class="fa-solid fa-user"></i> <%=user.getFname()%></a></li>
				<li class="nav-item"><a class="nav-link active" href="LogoutServ"><i class="fa-solid fa-power-off"></i> Logout</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</nav>