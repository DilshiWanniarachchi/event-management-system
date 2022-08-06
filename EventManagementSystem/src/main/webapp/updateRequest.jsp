<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel = "stylesheet" href="css/updateRequest.css">

<title>The 7 | Event Details | Update</title>

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
		String eventid = request.getParameter("requestID");
		String username = request.getParameter("username");
		String packagename = request.getParameter("packagename");
		String eventtitle = request.getParameter("eventtitle");
		String eventtheme = request.getParameter("eventtheme");
		String guestcount = request.getParameter("guestcount");
		String eventdate = (String)request.getParameter("eventdate");
		String venuename = request.getParameter("venuename");
		String venueaddress = request.getParameter("venueaddress");
		String services = request.getParameter("service");
		String description = request.getParameter("description");
		String eventstatus = request.getParameter("eventstatus");
	%>
 
 <div class="container" id="cont">
	<form action="updateevent" method="post">
		
			<div class="text-center">
	            <h3>Update Event Details</h3>
			</div><hr>
			
			<div class="row g-3">
				<div class="col-md-2">
		    		<label class="form-label">EventID</label>
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
	  			<div class="col-6">
   					<label class="form-label">Event Title</label>
    				<input type="text" class="form-control" name="eventtitle" value="<%=eventtitle%>">
  				</div>
  				<div class="col-6">
   					<label class="form-label">Event Theme</label>
    				<input type="text" class="form-control"  name="eventtheme" value="<%=eventtheme%>">
  				</div>
  				<div class="col-6">
   					<label class="form-label">Guest Count</label>
    				<input type="text" class="form-control"  name="guestcount" value="<%=guestcount%>">
  				</div>
  				<div class="col-6">
   					<label class="form-label">Event Date</label>
    				<input type="text" class="form-control"  name="eventdate" value="<%=eventdate%>">
  				</div>
  				<div class="col-6">
   					<label class="form-label">Venue Name</label>
    				<input type="text" class="form-control"  name="venuename" value="<%=venuename%>">
  				</div>
  				<div class="col-6">
   					<label class="form-label">Venue Address</label>
    				<input type="text" class="form-control"  name="venueaddress" value="<%=venueaddress%>">
  				</div>
  			</div>
  				<div class="col-6">
   					<br><label class="form-label">Services Required</label>
    				<input type="text" class="form-control"  name="services" value="<%=services%>">
  				</div>
  				<div class="col-6">
   					<br><label class="form-label">Description</label>
    				<input type="text" class="form-control"  name="description" value="<%=description%>">
  				</div>
  				<br><br>
  				<div class="col-6">
   					<label class="form-label">Event Validation Status</label>
    				<input type="text" class="form-control"  name="eventstatus" value="<%=eventstatus%>" readonly>
  				</div>
  				
  				<br><input type="submit"  value="UPDATE My Event" class="btn btn-primary">
  	
	</form>
</div>

</body>
</html>