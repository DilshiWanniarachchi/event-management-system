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
<link rel = "stylesheet" href="css/form.css">

<title>The 7 | New Event Request</title>

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
        
    <%if (username == null) {%>
	  	<li class="nav-item">
          <a class="nav-link" href="login.jsp">Login</a>
        </li>
	<%}else {%>
		<li class="nav-item">
          <a class="nav-link active" href="requestform.jsp">Submit Event</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="userProfile.jsp">My Profile</a>
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

	<div class="container">
        <form action="insertrequest" method="post">
	        <div class="text-center">
	            <h3>Event Request</h3>
			</div><hr>
			
			<div class="row g-3">
	  			<div class="col-md-6">
		    		<label class="form-label">Username</label>
		    		<input type="text" class="form-control" name="username" value="<%=username%>" readonly>
	  			</div>
	            <div class="col-md-6">
		   			<label class="form-label">Package Name</label>
		   			<select class="form-control" name="pname" required>
		   				<option value="" disabled selected hidden>Select Package</option>
			   			<%
							try {
							Connection con = com.user.DBConnect.getConnection();
							Statement stmt = con.createStatement();
							String sql = "select * from packages";
							ResultSet rs = stmt.executeQuery(sql);
								       
							while(rs.next()) {
						%>
						<option><%=rs.getString("name") %></option>
						<%}
        
						}catch (Exception e) {
								e.printStackTrace();
						}%>
		   			</select>
		   		</div>
	  			<div class="col-6">
   					<label class="form-label">Event Title</label>
    				<input type="text" class="form-control" name="etitle" required>
  				</div>
  				<div class="col-6">
   					<label class="form-label">Event Theme</label>
    				<input type="text" class="form-control"  name="etheme" required>
  				</div>
  				<div class="col-6">
   					<label class="form-label">Guest Count</label>
    				<input type="text" class="form-control"  name="gcount" required>
  				</div>
  				<div class="col-6">
   					<label class="form-label">Event Date</label>
    				<input type="date" class="form-control"  name="edate" value="2022-01-01" min="2022-01-01" max="2025-12-31" required>
  				</div>
  				<div class="col-6">
   					<label class="form-label">Venue Name</label>
    				<input type="text" class="form-control"  name="vname" required>
  				</div>
  				<div class="col-6">
   					<label class="form-label">Venue Address</label>
    				<input type="text" class="form-control"  name="vaddress" required>
  				</div>
  			</div>
  				<div class="col-6">
   					<br><label class="form-label">Services Required</label>
    				<textarea class="form-control"  name="serv" placeholder = "Photography, Decorations, Caterers, DJ & Lights, Buffet, Beverages, Transport, etc."></textarea>
  				</div>
  				<div class="col-6">
   					<br><label class="form-label">Description</label>
    				<textarea class="form-control"  name="des"></textarea>
  				</div>
  				
				<br><input type="submit" value="Submit Event Request" class="btn btn-primary">
				
				<a href="requestform.jsp">
            	<input type="reset" name="reset" value="Reset Form" class="btn btn-primary" id="resetbtn">
        		</a>
	  
	
	 </form>
</div>


<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>