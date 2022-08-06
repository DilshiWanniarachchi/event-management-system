package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.customer.CustomerDBUtil;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();                 /*to display javascript msg*/
		response.setContentType("text/html");
															    /*catch username, pw coming from login.jsp name="" value for parameters*/
		String username = request.getParameter("username");     
		String password = request.getParameter("password");
		
		boolean adminIsTrue;
		boolean isTrue;  
		
		adminIsTrue = com.admin.AdminDBUtil.validate(username, password);
		isTrue = com.customer.CustomerDBUtil.validate(username, password); 

		if(adminIsTrue == true) {
			HttpSession session = request.getSession();  
			String name = request.getParameter("username");
			session.setAttribute("user",name);	
			
			List<User> cusDetails = CustomerDBUtil.getCustomer(username);
			request.setAttribute("cusDetails", cusDetails);						         
			
			RequestDispatcher dis = request.getRequestDispatcher("adminProfile.jsp");
			dis.forward(request, response);
			
		}else if(isTrue == true) {
			HttpSession session = request.getSession();  
			String name = request.getParameter("username");
			session.setAttribute("user",name);
				
			List<User> cusDetails = CustomerDBUtil.getCustomer(username);
			request.setAttribute("cusDetails", cusDetails);						         
			
			RequestDispatcher dis = request.getRequestDispatcher("userProfile.jsp");
			dis.forward(request, response);
			
		}else {
			out.println("<script type='text/javascript'>");                   				 
			out.println("alert('Your username or password is incorrect');");
			out.println("location='login.jsp'");
			out.println("</script>");
	    }
	}
}
