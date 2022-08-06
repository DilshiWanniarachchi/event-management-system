package com.Event_Request;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateRequestServlet")
public class updateRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		PrintWriter out = response.getWriter();                 /*to display javascript msg*/
		response.setContentType("text/html");
		
		 String requestid = request.getParameter("eventid");
		 String eventtitle = request.getParameter("eventtitle");
		 String eventtheme = request.getParameter("eventtheme");
		 String guestcount = request.getParameter("guestcount");
		 String eventdate = request.getParameter("eventdate");
		 String venuename = request.getParameter("venuename");
		 String venueaddress = request.getParameter("venueaddress");
		 String services = request.getParameter("services");
		 String description = request.getParameter("description");
		 
		 boolean isTrue;
		 
		 isTrue = requestDBUtil.updaterequest(requestid, eventtitle, eventtheme, guestcount, eventdate, venuename, venueaddress, services, description);
		 
		 if(isTrue==true) {
			 out.println("<script type='text/javascript'>");                 
			 out.println("alert('Update Successful!');");
			 out.println("location='eventdetails.jsp'");
			 out.println("</script>");
		 }
		 else {
			 out.println("<script type='text/javascript'>");                 
			 out.println("alert('Update Unsuccessful!');");
			 out.println("location='eventdetails.jsp.jsp'");
			 out.println("</script>");
			 
		 }
	
	
	}

}
