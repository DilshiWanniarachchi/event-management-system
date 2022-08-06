<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<%@ page language="java" import="java.sql.*" %>
<%@page import="java.util.List"%>
<%@ page import="com.customer.*" %>
<%@ page import="com.user.*" %>
<%@page import="java.util.Iterator"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/userProfile.css"/>


<title>The 7 | User Profile</title>

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

<div class="row">
	<div class="col container">
	
		<table class="table table-striped table-hover" id="userdetails">
			<%
			try {
				
				List<User> cusDetails = CustomerDBUtil.getCustomer(username);
				Iterator it = cusDetails.iterator();	
				while(it.hasNext()){
		          	User user =(User)it.next();
			%>
			
			<tr id="heading">
				<td colspan="2"><h3>CUSTOMER PROFILE</h3></td>
			</tr>
			<tr id="heading">
				<td colspan="2"><img src="images/avatar.png" id="avatar"></td>
			</tr>
			<tr id="heading">
				<td colspan="2" class="table table-dark">Personal Details</td>
			</tr>
			<tr>
				<th class="table table-warning">User ID</th>
				<td><%=user.getuserID()%></td>
			</tr>
			<tr>
				<th class="table table-warning">First Name</th>
				<td><%=user.getfName()%></td>
			</tr>
			<tr>
				<th class="table table-warning">Last Name</th>
				<td><%=user.getlName()%></td>
			</tr>
			<tr>
				<th class="table table-warning">E-mail</th>
				<td><%=user.getEmail()%></td>
			</tr>
			<tr>
				<th class="table table-warning">Mobile</th>
				<td><%=user.getMobile()%></td>
			</tr>
			<tr>
				<th class="table table-warning">Address</th>
				<td><%=user.getAddress()%></td>
			</tr>
			<tr>
				<th class="table table-warning">Joined Date</th>
				<td><%=user.getJoined_date()%></td>
			</tr>
			<tr id="heading">
				<td colspan="2" class="table table-dark">Login Details</td>
			</tr>
			<tr>
				<th class="table table-warning">Username</th>
				<td><%=user.getUsername()%></td>
			</tr>
			<tr>
				<th class="table table-warning">Password</th>
				<td><%=user.getPassword()%></td>
			</tr>
		</table>
		<table class="table table-striped table-hover" id="userdetails">
			<tr id="heading">
				<td colspan="2" style="background: #000080; color: white;">Settings</td>
			</tr>
			<tr>
				<td>
					<!-- update -->
					<a href="updateCustomer.jsp?userID=<%=user.getuserID()%>&&fName=<%=user.getfName()%>&&lName=<%=user.getlName()%>&&email=<%=user.getEmail()%>&&mobile=<%=user.getMobile()%>&&address=<%=user.getAddress()%>&&joined_date=<%=user.getJoined_date()%>&&username=<%=user.getUsername()%>&&password=<%=user.getPassword()%>">
						<input type="button" name="update" value="Update Profile Details" class="btn btn-success">
					</a>
				</td>	
				<td>	
					<!-- delete -->
					<a href="deleteCustomer.jsp?userID=<%=user.getuserID()%>&&username=<%=user.getUsername()%>&&password=<%=user.getPassword()%>">
						<input type="button" name="delete" value="Delete My Account" class="btn btn-danger" style="float:right;">
					</a>
				</td>
			</tr>
		</table>

			       	
							<%}
				        
						}catch (Exception e) {
								e.printStackTrace();
						}%>
		
	</div>
		
	<div class="col container">
		
		<div class="row">
			<!-- view request -->
			<a href="eventdetails.jsp">
			<input type="button" name="myevent" value="View My Event Details" class="btn btn-danger"  style="float:right;">
			</a>
			
		</div>
		
		<div class="row">
		
			<div class="card" style="width: 22rem;">
			  <img src="images/event1.jpg" class="card-img-top" alt=>
			  <div class="card-body">
			    <h5 class="card-title">Birthday package</h5>
			    <p class="card-text">Its is a chance to craft moments that will last you a lifetime on your birthday. Browse through our curation of different themes</p>
			    <a href="#" class="btn btn-outline-primary">View more</a>
			  </div>
			</div>
			
			<div class="card" style="width: 22rem;">
			  <img src="images/event2.jpg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">Kids Birthday package</h5>
			    <p class="card-text">We custom-build every kids party with the best in bowling, arcade games, and signature menus that are made to "wow".</p>
			    <a href="#" class="btn btn-outline-primary">View more</a>
			  </div>
			</div>
		
		</div>
		
		<div class="row">
		
			<div class="card" style="width: 22rem;">
			  <img src="images/event3.jpg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">Cocktail party package</h5>
			    <p class="card-text">Take a moment to look over our cocktail party packages. You'll find plenty of choices, complemented by our knowledgeable and attentive staff</p>
			    <a href="#" class="btn btn-outline-primary">View more</a>
			  </div>
			</div>
			
			<div class="card" style="width: 22rem;">
			  <img src="images/event4.jpg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">Corporate Event Package</h5>
			    <p class="card-text">With this comprehensive package, you will have the luxury of having peace of mind leading up to your special event</p>
			    <a href="#" class="btn btn-outline-primary">View more</a>
			  </div>
			</div>
		
		</div>
	
	</div>
</div>	

<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>