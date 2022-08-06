<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@ page language="java" import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<link rel = "stylesheet" href="css/deleteRequest.css">

<title></title>

<%String user = (String)(session.getAttribute("user"));%>
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
		String eventid = request.getParameter("requestID");
		String username = request.getParameter("username");
		String packagename = request.getParameter("packagename");
		String eventtitle = request.getParameter("eventtitle");
		String eventtheme = request.getParameter("eventtheme");
		String guestcount = request.getParameter("guestcount");
		String eventdate = request.getParameter("eventdate");
		String venuename = request.getParameter("venuename");
		String venueaddress = request.getParameter("venueaddress");
		String services = request.getParameter("service");
		String description = request.getParameter("description");
		String eventstatus = request.getParameter("eventstatus");
	%>
	
	<div class="container">
        <form action="deleteevent" method="post">
	        <div class="text-center">
	            <h3>Cancel Event</h3>
			</div>
			
			<br>
			Event Details
			<hr>
			
			<div class="row g-3">
			<div class="col-md-2">
		    		<label class="form-label">Event ID</label>
		    		<input type="text" class="form-control" name="eventid" value="<%=eventid%>" readonly>
	  			</div>
	  			<div class="col-md-4">
		    		<label class="form-label">Username</label>
		    		<input type="text" class="form-control" name="username" value="<%=username%>" readonly>
	  			</div>
	  			<div class="col-md-6">
		   			<label class="form-label">Package Name</label>
		   			<input type="text" class="form-control" name="packagename" value="<%=packagename%>" readonly>
	  			</div>
		   		
	  			<div class="col-md-6">
		    		<label class="form-label">Event Title</label>
		    		<input type="text" class="form-control" name="eventtitle" value="<%=eventtitle%>" readonly >
	  			</div>
	  			
	  			<div class="col-md-6">
		    		<label class="form-label">Event Theme</label>
		    		<input type="text" class="form-control" name="eventtheme" value="<%=eventtheme%>" readonly >
	  			</div>
	  			
	  			<div class="col-md-6">
		    		<label class="form-label">Guest Count</label>
		    		<input type="text" class="form-control" name="guestcount" value="<%=guestcount%>" readonly>
	  			</div>
	  			
	  			<div class="col-md-6">
		    		<label class="form-label">Event Date</label>
		    		<input type="text" class="form-control" name="eventdate" value="<%=eventdate%>" readonly>
	  			</div>
	  			
	  			<div class="col-md-6">
		    		<label class="form-label">Venue Name</label>
		    		<input type="text" class="form-control" name="venuename" value="<%=venuename%>" readonly>
	  			</div>
	  			
	  			<div class="col-md-6">
		    		<label class="form-label">Venue Address</label>
		    		<input type="text" class="form-control" name="venueaddress" value="<%=venueaddress%>" readonly>
	  			</div>
	  			
	  			<div class="col-md-6">
		    		<label class="form-label">Services</label>
		    		<input type="text" class="form-control" name="services" value="<%=services%>" readonly>
	  			</div>
	  			
	  			<div class="col-md-6">
		    		<label class="form-label">Description</label>
		    		<input type="text" class="form-control" name="description" value="<%=description%>" readonly>
	  			</div>
	  			
	  			<div class="col-md-6">
		    		<label class="form-label">Event Status</label>
		    		<input type="text" class="form-control" name="eventstatus" value="<%=eventstatus%>" readonly>
	  			</div>
	  			<br>
	  			<input type="submit" name="submit" value="Delete my event" class="btn btn-danger">
	  			
	  		</div>
	  	</form>
	  </div>
	
	

	
 <!--  
	<form action="deleteevent" method="post">
		Event ID<input type="text" name="eventid" value="<%=eventid%>" readonly>
		Username<input type="text" name="username" value="<%=username%>" readonly>
		Package Name<input type="text" name="packagename" value="<%=packagename%>" readonly>
		Event Title<input type="text" name="eventtitle" value="<%=eventtitle%>" readonly>
		Event Theme<input type="text" name="eventtheme" value="<%=eventtheme%>" readonly>
		Guest Count<input type="text" name="guestcount" value="<%=guestcount%>" readonly>
		Event Date<input type="text" name="eventdate" value="<%=eventdate%>" readonly>
		Venue Name<input type="text" name="venuename" value="<%=venuename%>" readonly>
		Venue Address<input type="text" name="venueaddress" value="<%=venueaddress%>" readonly>
		Services<input type="text" name="services" value="<%=services%>" readonly>
		Descriptio<input type="text" name="description" value="<%=description%>" readonly>
		Event Validation Status<input type="text" name="eventstatus" value="<%=eventstatus%>" readonly>

		<input type ="submit" name = "submit" value = "Delete event request">
	</form>
 -->

</body>
</html>