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

<title>The 7 | Administration | Events Report</title>

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
	<h3>Event Requests' Report</h3><br>
	
	<table class="table table-striped table-hover">
		<tr class="table table-warning">
			<th>RequestID</th>
			<th>Username</th>
			<th>Package name</th>
			<th>Event title</th>
			<th>Event Theme</th>
			<th>Guest Count</th>
			<th>Event Date</th>
			<th>Venue Name</th>
			<th>Venue Address</th>
			<th>Services</th>
			<th>Description</th>
			<th>Event Status</th>
			<th>Action</th>
		</tr>
		
		<%
				try {
					Connection con = com.user.DBConnect.getConnection();
					Statement stmt = con.createStatement();
					String sql = "select * from request ";
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
			<td><%=rs.getString(8) %></td>
			<td><%=rs.getString(9) %></td>
			<td><%=rs.getString(10) %></td>
			<td><%=rs.getString(11) %></td>
			<td><%=rs.getString(12) %></td>
			<td>
				<a href="#">
				<input type="button" value="Validate" class="btn btn-info">
				</a>
      	 	</td>	
		</tr>
		
		<%}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		%>
	</table>
</div>

</body>
</html>