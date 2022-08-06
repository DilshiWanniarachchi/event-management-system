package com.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.User;


@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("uid");
		String fname = request.getParameter("cusfname");
		String lname = request.getParameter("cuslname");
		String email = request.getParameter("cusemail");
		String mobile = request.getParameter("cusmobile");
		String address = request.getParameter("cusaddress");
		String username = request.getParameter("cususer");
		String password = request.getParameter("cuspass");
		
		boolean isTrue;
		
		isTrue = CustomerDBUtil.updateCustomer(id, fname, lname, email, mobile, address, username, password);
		
		if(isTrue == true) {
			List<User> cusDetails = CustomerDBUtil.getCustomerDetails(id);   /*display updated details of the user when navigating back*/
			request.setAttribute("cusDetails", cusDetails);
			   
			RequestDispatcher dis = request.getRequestDispatcher("userProfile.jsp");   
			dis.forward(request, response);
			  
		}else {
			List<User> cusDetails = CustomerDBUtil.getCustomerDetails(id);   /*display updated details of the user when navigating back*/
			request.setAttribute("cusDetails", cusDetails);
			   
			RequestDispatcher dis = request.getRequestDispatcher("userProfile.jsp");   
			dis.forward(request, response);
		}
	}

}
