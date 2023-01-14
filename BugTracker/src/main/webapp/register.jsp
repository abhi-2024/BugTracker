<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sign-up</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<body style="background-image: url('img/backgroundIMG.jpg'); background-repeat: no-repeat; background-size: cover;">
	<%@include file="Navbar.jsp"%>

 
			<div class="container mt-5">

			<div class="col-md-4 offset-md-4">

				<div class="card">

					<div style="background-color:#4F29C8;" class="card-header text-white text-center">
					  <h1><span class="fa fa-user-plus"></span> Register Here  </h1>	
					</div>



					<div class="card-body">
						<form id="regForm" action="RegServlet" method="post">


							<div class="mb-3">
								<label for="user_name" class="form-label">Name</label> <input
									type="text" class="form-control" id="user_name"
									name="user_name">
							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input name="user_email" type="email"
									class="form-control" id="exampleInputEmail1">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>


							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input name="user_password" type="password" class="form-control"
									id="exampleInputPassword1">
							</div>

							<div class="mb-3 form-check">
								<input type="checkbox" required name="user_check"
									class="form-check-input" id="exampleCheck1"> <label
									class="form-check-label" for="exampleCheck1"><a href="Terms.html" target="_blank">Agree to
									terms & conditions</a></label>
							</div>

							<br>
							<div class="container text-center" id="loader" style="display: none;">
							 <span class="fa fa-spinner fa-spin fa-4x"></span>
							 <h4>Please Wait.....</h4>
							</div>
							<div class="container text-center" id="spinner" style="display: none;">
							 <i class="fa-solid fa-spinner fa-4x fa-spin"></i>
							</div>
							<div class="container text-center"><button id="submit-btn" type="submit" class="btn btn-primary">Submit</button></div>


						</form>
					</div>



				



				</div>

			</div>

		</div>
	<!-- Script -->
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
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	
	
		<script>
		  $(document).ready(function(){
			 console.log("Loaded!!"); 
			 $('#regForm').on('submit',function(event){
				 
				 event.preventDefault();
				 
				 let form = new FormData(this);
				 $('#submit-btn').hide();
				 $('#loader').show();
				 $.ajax({
						url: "RegServlet",
						type: 'post',
						data: form,
						success: function(data, textStatus, jqXHR){
							console.log(data)
							
							 $('#submit-btn').show();
							 $('#loader').hide();
							 
							 if(data.trim()==='Done!'){
							 swal("Sign-up success !!")
							 .then((value) => {
							   swal("Redirecting to login page...")
							   window.location = "login.jsp"
							 });
						   }
							 else swal(data);
						},
						error: function(jqXHR, textStatus, errorThrown){
							console.log(jqXHR)
							 $('#submit-btn').show();
							 $('#loader').hide();
							 swal(jqXHR);
						},
						processData: false,
						contentType: false
				 });
			 });
		  });
		</script>
		
		
		
	<!-- End of Script -->
</body>
</html>