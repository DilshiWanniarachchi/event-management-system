
package com.admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.user.DBConnect;

public class AdminDBUtil {
	
	private static Connection con;                     /*these variables can be used in any method within the class*/
	private static Statement stmt;
	private static ResultSet rs;
	private static boolean success;
	
	/*---validate Admin login credentials---*/
	
	public static boolean validate(String username, String password) {

		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from user where username='"+username+"' and password='"+password+"' and admin_privilege=1 ";
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
	
    /*---update admin details in the DB ---*/
	
	public static boolean updateAdmin(String id, String fname, String lname, String email, String mobile, String address, String username, String password) {
		
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
	
	/*---retrieve admin details in the DB to display in updated profile page---*/
	
	public static List<Admin> getAdminDetails(String id) {
		
		int convertedID = Integer.parseInt(id);   /*to convert int id(in DB ) to String */
		
		ArrayList<Admin> customerOb = new ArrayList<>();
		
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
				
				Admin cus = new Admin(uID, fname, lname, email, mobile, address, user, pass);
				customerOb.add(cus);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return customerOb;
		
	}
	

}
