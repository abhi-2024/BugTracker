<%@page import="com.entities.msg"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>


<!-- CSS  -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<body style="background-image: url('img/backgroundIMG.jpg'); background-repeat: no-repeat; background-size: cover;">
	<%@include file="Navbar.jsp"%>




	<main class="d-flex align-items-center" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-4">
					<div class="card">

						<div class="card-header text-white text-center"
							style="background-color: #4F29C8;">
							
							<h2><span class="fa fa-sign-in"></span> LOGIN</h2>
						</div>
                        <%
                        
                        msg mm = (msg)session.getAttribute("MSG");
                        if(mm!=null){
                        %>
						<div class="alert <%=mm.getCssClass()%>" role="alert">
						 <%= mm.getContent() %>
						</div>

                        <%
                        session.removeAttribute("MSG");
                        } 
                        
                        %>
						<div class="card-body">

							<form method="post" action="LoginServlet">
								<div class="mb-3">
									<label for="userEmail" class="form-label">Email address</label>
									<input required="required" name="userEmail" type="email"
										class="form-control" id="userEmail"
										aria-describedby="emailHelp">
								</div>
								<div class="mb-3">
									<label for="userPassword" class="form-label">Password</label> <input
										required="required" name="userPassword" type="password"
										class="form-control" id="userPassword">
								</div>
								<div class="container text-center">
									<button type="submit" style="background-color: #4F29C8;"
										class="btn btn-primary">Login</button>
								</div>
							</form>

						</div>

					</div>
				</div>
			</div>
		</div>
	</main>























	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
</body>
</html>