<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/deleteCustomer.css"/>

<title>The 7 | User Profile | Delete Account</title>

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

	<%                                                        /*to insert java code in jsp file*/
		String idD = request.getParameter("userID"); 
		String userD = request.getParameter("username");		  /*value in --> userProfile.jsp <c:param name=""> */
		String passD = request.getParameter("password");
	%>
	
<div class="container-fluid" id="delete">	
	
	<form action="deletecus" method="post">
		<div class="text-center">
	            <h3>DELETE ACCOUNT</h3>
		</div><hr>
		
		<div class="row mb-3">
		    <label class="col-sm-2 col-form-label">Customer ID</label>
		    <div class="col-sm-10">
		    <input type="text" name="uid" value="<%=idD%>" class="form-control" readonly>
		    </div>
	    </div>
	    
	    <div class="row mb-3">
		    <label class="col-sm-2 col-form-label">Username</label>
		    <div class="col-sm-10">
		    <input type="text" name="cususer" value="<%=userD%>" class="form-control" readonly>
		    </div>
	    </div>
	    
		<div class="row mb-3">
		    <label class="col-sm-2 col-form-label">Password</label>
		    <div class="col-sm-10">
		    <input type="text" name="cuspass" value="********" class="form-control" readonly>
		    </div>
	    </div>
	    
	    <div class="row mb-3">
		    <label class="col-sm-2 col-form-label">Re-enter Password</label>
		    <div class="col-sm-10">
		    <input type="password" name="reenterPass" class="form-control" required>
		    </div>
	    </div><br>
	    
	    <a href="userProfile.jsp"><input type="button" name="delete" value="Cancel" class="btn btn-primary"></a>
		<input type="submit" name="delete" value="Confirm Delete Account" class="btn btn-danger"><br>
	</form>

</div>

<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>