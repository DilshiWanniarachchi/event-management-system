<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/login.css"/>

<title>The 7 | Login</title>

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

	<div class="container" id="container">
		<form action="login" method="post">
			<div class="text-center">
				<h3>LOGIN</h3>
  				<img src="images/avatar.png" id="avatar"><hr>
			</div>
			
			<div class="mb-3">
	 			<label class="form-label">Username</label>
				<input type="text" name="username" class="form-control" required>
			</div>
			<div class="mb-3">
	 			<label class="form-label">Password</label>
				<input type="password" name="password"  class="form-control" required>
			</div>
			
			<input type="submit" name="login" value="Login" class="btn btn-primary">
		</form>
		
		<br>	
		Do not have an account?
		<a href="register.jsp">
			<input type="button" name="signup" value="Sign-up"  class="btn btn-secondary btn-sm">			
		</a>
	</div>	
	
<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>