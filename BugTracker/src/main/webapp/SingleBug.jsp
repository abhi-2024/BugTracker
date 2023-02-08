<%@page import="com.entitites.Bug"%>
<%@page import="com.entitites.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="Links.jsp"%>
	<%@include file="Navbar.jsp"%>
	<%
	if (user == null)
		response.sendRedirect("Login.jsp");

	Bug bug = (Bug) session.getAttribute("currentBug");
	%>


	<div class="container mt-3">
		<div class="card">
			<div class="card-header">
				<h3 class="text-center"><%=bug.getName()%></h3>
				<%
				if (bug.getStatus() == 1) {
				%>
				<div>
					Status: <i class="fa-solid fa-door-closed" style="color: brown;"></i>
					Closed
				</div>
				<%
				} else if (bug.getStatus() == 2) {
				%>
				<div>
					Status: <i class="fa-solid fa-rocket" style="color: red;"></i> Open
				</div>
				<%
				} else if (bug.getStatus() == 3) {
				%>
				<div>
					Status: <i class="fa-solid fa-spin fa-spinner" style="color: blue;"></i>
					In Progress
				</div>
				<%
				} else {
				%>
				<div>
					Status: <i class="fa-solid fa-circle-check" style="color: green;"></i>
					Resolved
				</div>
				<%
				}
				%>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-4">
						<h6 class="text-center" style="text-decoration: underline;">Description</h6>
						<div class="lead text-start"><%=bug.getDes()%></div>
					</div>
					<div class="col-md-4">
						<h6 class="text-center" style="text-decoration: underline;">Code/Links</h6>
						<code>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry. Lorem Ipsum has been the industry's
							standard dummy text ever since the 1500s, when an unknown printer
							took a galley of type and scrambled it to make a type specimen
							book. It has survived not only five centuries, but also the leap
							into electronic typesetting, remaining essentially unchanged. It
							was popularised in the 1960s with the release of Letraset sheets
							containing Lorem Ipsum passages, and more recently with desktop
							publishing software like Aldus PageMaker including versions of
							Lorem Ipsum</code>
					</div>
					<div class="col-md-4 text-end">
						<img alt="" class="img-fluid text-end" src="img/new.jpg">
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-12">
						<h5 class="text-center">Discussion</h5>
						<div class="container mt-5">
							<div class="d-flex  row">
								<div class="col-md-8">
									<%
									CommentDao dao = new CommentDao(ConnectionProvider.getConnection());
									ArrayList<Comment> list = dao.fetchCommentByBug(bug.getId());
									for (Comment cc : list) {
									%>
									<div class="d-flex flex-column comment-section">
										<div class="bg-white p-2">
											<div class="d-flex flex-row user-info">

												<div class="d-flex flex-column justify-content-start ml-2">
													<span class="d-block font-weight-bold name"><%=cc.getUname()%></span><span
														class="date text-black-50">Shared publicly - <%=cc.getCdate()%></span>
												</div>
											</div>
											<div class="mt-2">
												<p class="comment-text"><%=cc.getContent()%></p>
											</div>
										</div>
										<div class="bg-white">
											<div class="d-flex flex-row fs-12">
												<div class="like p-2 cursor">
													<%=cc.getClike()%>
													<i class="fa fa-thumbs-o-up"></i><span class="ml-1">Like</span>
												</div>
											</div>
										</div>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>