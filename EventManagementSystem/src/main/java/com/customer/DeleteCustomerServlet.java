package com.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.User;


@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String id = request.getParameter("uid");
		String reenterpassword = request.getParameter("reenterPass");
		
		boolean isTrue;
		
		isTrue = CustomerDBUtil.validateDelete(reenterpassword);
		
		if(isTrue == true) {
			CustomerDBUtil.deleteCustomer(id, reenterpassword);
			out.println("<script type='text/javascript'>");                 
			out.println("alert('Account deletion Successful!');");
			out.println("location='register.jsp'");
			out.println("</script>");
		}else {
			List<User> cusDetails = CustomerDBUtil.getCustomerDetails(id); 
			request.setAttribute("cusDetails", cusDetails);
				
			RequestDispatcher dis = request.getRequestDispatcher("userProfile.jsp");   
			dis.forward(request, response);
			
	    }
	}

}
