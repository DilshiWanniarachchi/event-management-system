<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/register.css"/>

<title>The 7 | Registration Form</title>

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
          <a class="nav-link active" href="login.jsp">Login</a>
        </li>
	<%}else {%>
		<li class="nav-item">
          <a class="nav-link" href="requestform.jsp">Submit Event</a>
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

	<div class="container" id="regcontainer">
        <form action="register" method="post">
	        <div class="text-center">
	            <h3>REGISTRATION FORM</h3>
			</div>
			
            Personal Details<hr>
            
            <div class="row g-3">
	  			<div class="col-md-6">
		    		<label class="form-label">First Name</label>
		    		<input type="text" name="fname" class="form-control"  required>
	  			</div>
	            
	            <div class="col-md-6">
		   			<label class="form-label">Last Name</label>
		   			<input type="text"  name="lname" class="form-control"  required>
	  			</div>
	  			
	  			<div class="col-12">
   					<label class="form-label">E-mail</label>
    				<input type="text" class="form-control"  name="email" required>
  				</div>
  				
  				<div class="col-12">
   					<label class="form-label">Mobile</label>
    				<input type="text" class="form-control"  name="mobile" required>
  				</div>
  				
  				<div class="col-12">
   					<label class="form-label">Address</label>
    				<input type="text" class="form-control"  name="address">
  				</div>
  				
  				<div class="col-12">
   					<label class="form-label">Joined Date</label>
	    				
    				<input type="text" class="form-control"  name="joineddate" id="currentDate" readonly>
  				</div>

			</div>
			
	            <br>Login Details<hr>
	            
				<div class="col-md-6">
   					<label class="form-label">Username</label>
    				<input type="text" class="form-control"  name="username">
  				</div>
  				
	            <div class="col-md-6">
   					<label class="form-label">Password</label>
    				<input type="password" class="form-control"  name="password">
  				</div><br>
				
				<input type="submit" name="signup" value="Sign-up" class="btn btn-primary">
				           
        		<button class="btn btn-primary" onClick="window.location.reload();">Reset Form</button>
        		
        </form>
        
        <br>
        Already have an Account?
        <a href="login.jsp">
            <input type="button" name="login" value="Login"  class="btn btn-secondary btn-sm">
        </a>
	</div>        

<!-- js -->					
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- js -->
<script>
	var today = new Date();
	var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
	document.getElementById("currentDate").value = date;
</script>
</body>
</html>