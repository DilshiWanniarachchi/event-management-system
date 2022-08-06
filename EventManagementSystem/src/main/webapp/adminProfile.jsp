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
<link rel="stylesheet" href="css/adminProfile.css"/>

<title>The 7 | Administration | Admin Profile</title>

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

<div class="row">
	
	<table class="table table-sm" id="adminprofile">
	
		<%
			try {
			Connection con = com.user.DBConnect.getConnection();
			Statement stmt = con.createStatement();
			String sql = "select * from user where username='"+username+"' ";
			ResultSet rs = stmt.executeQuery(sql);
				       
			while(rs.next()) {
		%>
        
        <tr id="heading">
			<td colspan="2" ><h3>ADMIN PROFILE</h3></td>
		</tr>
		<tr id="heading">
			<td colspan="2"><img src="images/avatar.png"></td>
		</tr>
		<tr>
			<td colspan="2" class="table table-dark">Personal Details</td>
		</tr>
		<tr class="table bg-light">
			<td>Administrator ID</td>
			<td ><%=rs.getInt(1) %></td>
		</tr>
		<tr class="table bg-light">
			<td>First Name</td>
			<td><%=rs.getString(2) %></td>
		</tr>
		<tr class="table bg-light">
			<td>Last Name</td>
			<td><%=rs.getString(3) %></td>
		</tr>
		<tr class="table bg-light">
			<td>E-mail</td>
			<td><%=rs.getString(4) %></td>
		</tr>
		<tr class="table bg-light">
			<td>Mobile</td>
			<td><%=rs.getString(5) %></td>
		</tr>
		<tr class="table bg-light">
			<td>Address</td>
			<td><%=rs.getString(6) %></td>
		</tr>
		<tr>
			<td colspan="2" class="table table-dark">Login Details</td>
		</tr>
		<tr class="table bg-light">
			<td>Username</td>
			<td><%=rs.getString(7) %></td>
		</tr>
		<tr class="table bg-light">
			<td>Password</td>
			<td><%=rs.getString(8) %></td>
		</tr>
	
	</table><br><br>
		
	<div class="container text-center">
		<!-- update -->
		<a href="updateAdmin.jsp?userID=<%=rs.getInt(1)%>&&fName=<%=rs.getString(2)%>&&lName=<%=rs.getString(3)%>&&email=<%=rs.getString(4)%>&&mobile=<%=rs.getString(5)%>&&address=<%=rs.getString(6)%>&&username=<%=rs.getString(7)%>&&password=<%=rs.getString(8)%>">
			<input type="button" name="update" value="Update Profile Details" class="btn btn-success">
		</a>
		<!-- logout -->
		<a href="./LogoutServlet">
			<input type="button" name="logout" value="Logout" class="btn btn-warning">
		</a>
	</div>
	
	 <%}
        
	}catch (Exception e) {
				e.printStackTrace();
	}%>
		
</div>
				
	       	
			
		

				

<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>