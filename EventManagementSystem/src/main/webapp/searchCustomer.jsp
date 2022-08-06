<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

	<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<title>The 7 | Administration | Registered Customers|Search</title>

<%String username = (String)(session.getAttribute("user"));%>

<link rel="stylesheet" href="css/nav.css"/>

<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

  <div class="container-fluid">
    <div class="collapse navbar-collapse">
    
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Manage Event Packages</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Manage Venues</a>
        </li>
	  	<li class="nav-item">
          <a class="nav-link" href="eventReport.jsp">Manage Events</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contactReport.jsp">Manage Contact Us </a>
        </li>
		<li class="nav-item">
          <a class="nav-link" href="customerReport.jsp">Manage Customers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./LogoutServlet">Logout</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminProfile.jsp">Admin Profile</a>
        </li>
      </ul>
      
      <div>
      	<img src="images/logo.jpeg" id="logo">
      </div>
      
    </div>
  </div>
</nav>
<!-- Navbar end -->

</head>
<body>

<div class="container" style="margin:20px;">

	<div class="row g-3">
		<div class="col">
		<h3>Registered Customers' Report</h3>
		</div>
		<div class="col-auto">
		<a href="customerReport.jsp"><input type="button" name="allbtn" value="View All" class="btn btn-success"></a>
		</div>
	</div>
	
	<br>

	<table class="table table-striped table-hover">
		<tr class="table table-warning">
			<th>User ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>E-mail</th>
			<th>Mobile</th>
			<th>Address</th>
			<th>Username</th>
		</tr>
		
		<%
		try {
			Connection con = com.user.DBConnect.getConnection();
			Statement stmt = con.createStatement();
			String search = request.getParameter("search");
			String sql = "select * from user where userID='"+search+"' OR fName='"+search+"' OR lName='"+search+"' OR email='"+search+"' OR mobile='"+search+"' OR address='"+search+"' OR username='"+search+"' ";
			ResultSet rs = stmt.executeQuery(sql);
						       
			while(rs.next()) {
		%>
				
		<tr>
			<td><%=rs.getInt(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
		</tr>
		
		<%}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		%>
	</table>				

</div>

<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>