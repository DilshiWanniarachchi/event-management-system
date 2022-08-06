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
<link rel="stylesheet" href="css/eventdetails.css"/>

<title>The 7 | User Profile | Event Details</title>

<%String user = (String)(session.getAttribute("user"));%>
<link rel="stylesheet" href="css/nav.css"/>
<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

  <div class="container-fluid" id="qcontainer">
    <div class="collapse navbar-collapse">
    
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Photo Gallery</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Event Packages</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Venues</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contact.jsp">Contact Us</a>
        </li>
        
    <%if (user == null) {%>
	  	<li class="nav-item">
          <a class="nav-link" href="login.jsp">Login</a>
        </li>
	<%}else {%>
		<li class="nav-item">
          <a class="nav-link" href="requestform.jsp">Submit Event</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="userProfile.jsp">My Profile</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./LogoutServlet">Logout</a>
        </li>
	<%} %>
        
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

		<%
			try {
			Connection con = com.user.DBConnect.getConnection();
			Statement stmt = con.createStatement();
			String sql = "select * from request where username='"+user+"' ";
			ResultSet rs = stmt.executeQuery(sql);
				       
			while(rs.next()) {
		%>
		
<div class="container" id="event">
	<table class="table table-success table-striped table-bordered" >
		<tr  class="table-primary">
			<th colspan="2">EVENT DETAILS</th>
		</tr>
		<tr>
			<th>Request ID</th>
			<td><%=rs.getInt(1) %></td>
		</tr>
		<tr>
			<th>username</th>
			<td><%=rs.getString(2) %></td>
		</tr>
		<tr>
			<th>Package Name</th>
			<td><%=rs.getString(3) %></td>
		</tr>
		<tr>
			<th>Event Title</th>
			<td><%=rs.getString(4) %></td>
		</tr>
		<tr>
			<th>Event Theme</th>
			<td><%=rs.getString(5) %></td>
		</tr>
		<tr>
			<th>Guest Count</th>
			<td><%=rs.getString(6) %></td>
		</tr>
		<tr>
			<th>Event Date</th>
			<td><%=rs.getString(7) %></td>
		</tr>
		<tr>
			<th>Venue Name</th>
			<td><%=rs.getString(8) %></td>
		</tr>
		<tr>
			<th>Venue Address</th>
			<td><%=rs.getString(9) %></td>
		</tr>
		<tr>
			<th>Services</th>
			<td><%=rs.getString(10) %></td>
		</tr>
		<tr>
			<th>Description</th>
			<td><%=rs.getString(11) %></td>
		</tr>
		<tr>
			<th>Event Validation Status</th>
			<td><%=rs.getString(12) %></td>
		</tr>
	
	</table>
	
	<!-- Update details -->
	<br>
	<a href="updateRequest.jsp?requestID=<%=rs.getInt(1)%>&&username=<%=rs.getString(2)%>&&packagename=<%=rs.getString(3)%>&&eventtitle=<%=rs.getString(4)%>&&eventtheme=<%=rs.getString(5)%>&&guestcount=<%=rs.getString(6)%>&&eventdate<%=rs.getString(7)%>&&venuename=<%=rs.getString(8)%>&&venueaddress=<%=rs.getString(9)%>&&service=<%=rs.getString(10)%>&&description=<%=rs.getString(11)%>&&eventstatus=<%=rs.getString(12)%>">
	<input type = "button" name = "update" value = "udate event details" class="btn btn-primary">
	</a>	
		
	<!-- Delete details -->
	<a href="deleteRequest.jsp?requestID=<%=rs.getInt(1)%>&&username=<%=rs.getString(2)%>&&packagename=<%=rs.getString(3)%>&&eventtitle=<%=rs.getString(4)%>&&eventtheme=<%=rs.getString(5)%>&&guestcount=<%=rs.getString(6)%>&&eventdate<%=rs.getString(7)%>&&venuename=<%=rs.getString(8)%>&&venueaddress=<%=rs.getString(9)%>&&service=<%=rs.getString(10)%>&&description=<%=rs.getString(11)%>&&eventstatus=<%=rs.getString(12)%>">
	<input type = "button" name = "delete" value = "delete event" class="btn btn-danger" id="delete">
	</a>	
</div>		
		<%}
	        
		}catch (Exception e) {
				e.printStackTrace();
		}%>	

</body>
</html>