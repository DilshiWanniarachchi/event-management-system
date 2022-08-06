package com.customer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.user.User;
import com.user.DBConnect;

public class CustomerDBUtil {
	
	private static Connection con;                    
	private static Statement stmt;
	private static ResultSet rs;
	private static boolean success;
	
	/*---validate login credentials---*/
	
	public static boolean validate(String username, String password) {
	
	try {
		
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "select * from user where username='"+username+"' and password='"+password+"' ";
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			success = true;  
		}else {
			success = false;
		}
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	
	return success;

    }
	
    /*---get customer details from DB (to display in user account)---*/
	
    public static List<User> getCustomer(String username){
		
		ArrayList<User> customerOb = new ArrayList<>();
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from user where username='"+username+"' ";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int uID = rs.getInt(1);
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String email = rs.getString(4);
				String mobile = rs.getString(5);
				String address = rs.getString(6);
				String user = rs.getString(7);
				String pass = rs.getString(8);
				String joined = rs.getString(10);
				
				User cus = new User(uID, fname, lname, email, mobile, address, user, pass, joined);
				customerOb.add(cus);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return customerOb;
		
	}
    
    /*---register a new customer---*/
	
	public static boolean registerCustomer(String fname, String lname, String email, String mobile, String address, String username, String password, String joineeddate) {
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into user (fName, lName, email, mobile, address, username, password, joined_date) values('"+fname+"', '"+lname+"', '"+email+"', '"+mobile+"', '"+address+"', '"+username+"', '"+password+"', '"+joineeddate+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				success = true;
			}else {
				success = false;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return success;
	}
	
	/*---update customer details in the DB---*/
	
	public static boolean updateCustomer(String id, String fname, String lname, String email, String mobile, String address, String username, String password) {
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "update user set fName='"+fname+"', lName='"+lname+"', email='"+email+"', mobile='"+mobile+"', address='"+address+"', username='"+username+"', password='"+password+"' where userID='"+id+"' ";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				success = true;
			}else {
				success = false;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return success;
	}
	
	/*---retrieve customer details in the DB to display in updated profile page---*/
	
	public static List<User> getCustomerDetails(String id) {
		
		int convertedID = Integer.parseInt(id);   /*to convert int id(in DB ) to String */
		
		ArrayList<User> customerOb = new ArrayList<>();
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from user where userID='"+convertedID+"' ";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int uID = rs.getInt(1);
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String email = rs.getString(4);
				String mobile = rs.getString(5);
				String address = rs.getString(6);
				String user = rs.getString(7);
				String pass = rs.getString(8);
				String joined = rs.getString(10);
				
				User cus = new User(uID, fname, lname, email, mobile, address, user, pass, joined);
				customerOb.add(cus);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return customerOb;
		
	}
	
	/*---validate password to delete the account---*/
	
	public static boolean validateDelete(String reenterpassword) {
	
	try {
		
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "select * from user where password='"+reenterpassword+"'";
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			success = true;  
		}else {
			success = false;
		}
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	
	return success;

    }
	
	/*---delete customer from the DB---*/
	
    public static boolean deleteCustomer(String id, String reenterPass) {
	
	    int convertedID = Integer.parseInt(id);
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "delete from user where userID='"+convertedID+"' and password='"+reenterPass+"' " ;
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				success = true;
			}else {
				success = false;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return success;

	    }
    
    
    
    
    
    
}