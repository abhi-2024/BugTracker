<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
	<%@include file="Links.jsp"%>
	<%@include file="Navbar.jsp"%>

	<div class="d-flex align-items-center" style="height: 80vh">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-3">
					<div class="card">
						<div class="card-header">
							<h1 class="display-6 text-center">Sign Up</h1>
						</div>
						<div class="card-body">
							<form class="row g-3" action="SignUpServ" method="post">
							<div class="col-md-6">
									<input type="text" class="form-control"
										placeholder="First name" name="fName" aria-label="First name">
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" name="lName" placeholder="Last name"
										aria-label="Last name">
								</div>
								<div class="col-md-12">
								<label class="form-label">Profession</label>
								<select class="form-select" name="profession">
								 <option disabled selected>Please Select an option</option>
								 <option value="Developer">Developer</option>
								 <option value="Student">Student</option>
								 <option value="Professor/Tutor">Professor/Tutor</option>
								</select>
								</div>
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Email</label> <input
										type="email" class="form-control" name="email" id="inputEmail4">
								</div>
								<div class="col-md-6">
									<label for="inputPassword4" class="form-label">Password</label>
									<input type="password" class="form-control" name="password" id="inputPassword4">
								</div>
								<div class="col-12">
									<label for="inputAddress" class="form-label">Address</label> <input
										type="text" class="form-control" name="add" id="inputAddress"
										placeholder="1234 Main St">
								</div>
								<div class="col-12">
									<div class="form-check">
										<input required="required" class="form-check-input" type="checkbox" id="gridCheck">
										<label class="form-check-label" for="gridCheck"> Check
											me out </label>
									</div>
								</div>
								<div class="col-12">
									<button type="submit" class="btn btn-primary">Sign in</button>
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