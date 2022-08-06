<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/contactus.css"/>

<title>The 7 | Login | Contact Us</title>

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
          <a class="nav-link active" href="contact.jsp">Contact Us</a>
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

<div class="container" id="contact">
            <h2 class="text-center h1">Contact Us</h2><br><br>
            
     <div class="row"> 
     
     	<div class="col">      
                <div class="content address">
                    <h3 class="fs-2">Talk to us</h3>
                    <p class="fs-5">As we move toward a virtual world where remote work becomes the norm, The 7's online event management software platform gives you and your team the flexibility to access your event data and connect anywhere, anytime.</p>
                    
                    <br>
                    
                    <div>
                        <div>
                            <h1 class="fs-5">E-mail:</h1>
                            <p class="fs-5">the7eventplanners@gmail.com</p>
                        </div><hr>
                        <div>
                            <h1 class="fs-5">Work Time:</h1>
                            <p class="fs-5">Monday - Saturday from 8am to 8pm</p>
                        </div><hr>
                        <div>
                            <h1 class="fs-5">Phone:</h1>
                            <p class="fs-5">+1 2788 95640</p>
                        </div>
                    </div>
                </div>
           </div>
           
           <div class="col bg-light" id="form">    
                <form action="contact" method="post">
                
                <div class="mb-3">
				  <label class="form-label">E-mail</label>
				  <input type="text" class="form-control" name="email" required>
				</div>
				<div class="mb-3">
				  <label class="form-label">Subject</label>
				  <input type="text" class="form-control" name="subject" required>
				</div>
				<div class="mb-3">
				  <label class="form-label">Message</label>
				  <input type="text" class="form-control" name="message" placeholder="Type your message..." id="msgbox" required>
				</div>
			
			    <input type="submit" name="contact" value="Submit Message" class="btn btn-primary">
			    </form>  
			</div>    
	</div>	    
</div>

</body>
</html>