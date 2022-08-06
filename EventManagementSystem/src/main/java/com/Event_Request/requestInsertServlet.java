package com.Event_Request;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/requestInsertServlet")
public class requestInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			PrintWriter out = response.getWriter();                 /*to display javascript msg*/
			response.setContentType("text/html");

			String username = request.getParameter("username");
			String packagename = request.getParameter("pname");
			String eventtitle = request.getParameter("etitle");
			String eventtheme = request.getParameter("etheme");
			String guestcount = request.getParameter("gcount");
			String eventdate = request.getParameter("edate");
			String venuename = request.getParameter("vname");
			String venueaddress = request.getParameter("vaddress");
			String service = request.getParameter("serv");
			String description = request.getParameter("des");		
			
			boolean IsTrue;
			
			IsTrue = requestDBUtil.insertrequest(username, packagename, eventtitle, eventtheme, guestcount, eventdate, venuename, venueaddress, service, description);
			
			if(IsTrue == true) {			
				out.println("<script type='text/javascript'>");                   /*display javascript msg*/
				out.println("alert('Event Request Submitted Successfully!');");
				out.println("location='userProfile.jsp'");
				out.println("</script>");
			}else {
				out.println("<script type='text/javascript'>");                   /*display javascript msg*/
				out.println("alert('Event Request Submition Failed!');");
				out.println("location='requestform.jsp'");
				out.println("</script>");
			}
			
	}
		

}