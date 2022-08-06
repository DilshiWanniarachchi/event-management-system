package com.contact;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();                 /*to display javascript msg*/
		response.setContentType("text/html");
		  
		String email = request.getParameter("email");			/*parameter is--> name="" value in the contact.jsp*/
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		boolean isTrue;
		
		isTrue = ContactDBUtil.submitContactMsg(email, subject, message);
		
		if(isTrue == true) {			
			out.println("<script type='text/javascript'>");                   /*display javascript msg*/
			out.println("alert('Message Submission Successful!');");
			out.println("location='contact.jsp'");
			out.println("</script>");
		}else {
			out.println("<script type='text/javascript'>");                   /*display javascript msg*/
			out.println("alert('Message Submission Failed!');");
			out.println("location='contact.jsp'");
			out.println("</script>");
		}
		
	}

}
