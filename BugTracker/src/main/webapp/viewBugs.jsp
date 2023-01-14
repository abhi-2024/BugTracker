<%@page import="com.entities.User"%>
<%@page import="com.entities.bugs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.bugDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Bugs</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<body style="background-image: url('img/backgroundIMG.jpg'); background-repeat: no-repeat; background-size: cover;">
<%@include file="Navbar.jsp" %>


<% 
 User user =(User)session.getAttribute("currentUser");
 if(user!=null){
%>
<div class="d-flex align-items-center mt-5" style="height: 80vh;">


<div class="container">

<table class="table" style="background-color: white;">
  <thead style="background-color: teal;">
    <tr>
      <th scope="col">Bug Title</th>
      <th scope="col">Project Name</th>
      <th scope="col">Date</th>
      <th scope="col">Bug Description</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
  <tbody>
  <%
    bugDao d = new bugDao(ConnectionProvider.getConnection());
    ArrayList<bugs> list1 = d.getAllBugDetails(user.getEmail());
    for(bugs bb : list1){
  %>
    <tr>
      <td><%= bb.getbTitle() %></td>
      <td><%= bb.getpTitle() %></td>
      <td><%= bb.getbDate() %></td>
      <td><%= bb.getbDesc() %></td>
      <td>
      <form action="delBug" method="post">
      <input name="b_id" style="display: none;" type="text" value="<%= bb.getBid() %>">
      <button class="btn text-white text-center" style="background-color: red;"><i class="fa-solid fa-trash"></i></button>
      </form>
      </td>
    </tr>
    <% } %>
  </tbody>
</table>
 <% 
  } else{
 %>
 <h1 class="text-center">Login to view your bugs</h1>
 <div class="text-center"><a href="login.jsp" style="background-color: #4F29C8;" class="btn text-white">LOGIN</a></div>

</div>
</div>
 <%
    }
 %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>