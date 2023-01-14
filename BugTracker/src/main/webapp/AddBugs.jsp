<%@page import="com.entities.msg"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Bugs</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<body
	style="background-image: url('img/backgroundIMG.jpg'); background-repeat: no-repeat; background-size: cover;">
	<%@include file="Navbar.jsp"%>
	<div class="container mt-5">

		<%
		User um = (User) session.getAttribute("currentUser");

		if (um != null) {
		%>

		<div class="col-md-4 offset-md-4">

			<div class="card">

				<h1 style="background-color: #4F29C8;"
					class="card-header text-white text-center">
					<i class="fa-solid fa-bug"></i> Add Bugs
				</h1>



				<div class="card-body">
					<form id="bug-form" action="bugServlet" method="post">

						<%
						msg r = (msg) session.getAttribute("mmm");
						if (r != null) {
						%>
						<div class="alert <%=r.getCssClass()%>" role="alert"><%=r.getContent()%></div>
						<%
						}
						session.removeAttribute("mmm");
						%>
						<div class="mb-3">
							<label for="bug_title" class="form-label">Bug Title</label> <input
								type="text" class="form-control" id="bug_title" name="bug_title"
								aria-describedby="bugTitleHelp">
						</div>

						<div class="mb-3">
							<label for="project_name" class="form-label">Project Name</label>
							<input name="project_name" type="text" class="form-control"
								id="project_name" aria-describedby="projectNameHelp">

						</div>


						<div class="mb-3">
							<label for="bug_date" class="form-label">Date: </label> <input
								type="date" class="form-control" id="bug_date" name="bug_date">
						</div>

						<div class="mb-3">

							<textarea name="bug_about" class="form-control" rows="5"
								placeholder="Bug Description...."></textarea>

						</div>

						<br>
						<div class="container text-center" id="loader"
							style="display: none;">
							<span class="fa fa-spinner fa-spin fa-4x"></span>
							<h4>Please Wait.....</h4>
						</div>
						<div class="text-center">
							<button id="submit-btn" type="submit"
								style="background-color: #4F29C8;" class="btn text-white">Submit</button>
						</div>


					</form>
				</div>
			</div>

		</div>
		<%
		} else {
		%>

		<h1 class="text-center">Login to add bugs</h1>
		<div class="text-center">
			<a href="login.jsp" style="background-color: #4F29C8;"
				class="btn text-white">LOGIN</a>
		</div>

		<%
		}
		%>
	</div>
	<!-- Script -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"
		integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<!-- End of Script -->
</body>
</html>