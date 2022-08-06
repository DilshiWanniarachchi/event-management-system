package com.Event_Request;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customer.CustomerDBUtil;
import com.user.User;


@WebServlet("/deleteRequestServlet")
public class deleteRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();                 /*to display javascript msg*/
		response.setContentType("text/html");
		
		String id = request.getParameter("eventid");
		
		boolean isTrue;
		isTrue = requestDBUtil.deleterequest(id);
		
		 if(isTrue==true) {
			out.println("<script type='text/javascript'>");                 
			out.println("alert('Event cancellation Successful!');");
			out.println("location='userProfile.jsp'");
			out.println("</script>");
		 }
		 else {
			List<User> cusDetails = CustomerDBUtil.getCustomerDetails(id); 
			request.setAttribute("cusDetails", cusDetails);
					
			RequestDispatcher dis = request.getRequestDispatcher("userProfile.jsp");   
			dis.forward(request, response);
			 
		 }
	}

}
