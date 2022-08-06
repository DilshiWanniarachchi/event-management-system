package com.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();                 /*to display javascript msg*/
		response.setContentType("text/html");
		
		String fname = request.getParameter("fname");  /*parameter is--> name="" value in the customer.jsp*/
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String joineddate = request.getParameter("joineddate");
		
		boolean isTrue;
		
		isTrue = CustomerDBUtil.registerCustomer(fname, lname, email, mobile, address, username, password, joineddate);
		
		if(isTrue == true) {			
			out.println("<script type='text/javascript'>");                   /*display javascript msg*/
			out.println("alert('Registration Successful!');");
			out.println("location='login.jsp'");
			out.println("</script>");
		}else {
			out.println("<script type='text/javascript'>");                   /*display javascript msg*/
			out.println("alert('Registration Failed!');");
			out.println("location='register.jsp'");
			out.println("</script>");
		}
		
	}

}
