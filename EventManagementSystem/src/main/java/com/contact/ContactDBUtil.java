package com.contact;

import java.sql.Connection;
import java.sql.Statement;

import com.user.DBConnect;

public class ContactDBUtil {
	
	private static Connection con;                    
	private static Statement stmt;
	private static boolean success;
	
	/*---insert contact us msg to DB)---*/

	public static boolean submitContactMsg(String email, String subject, String message) {
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into contact (email, subject, message) values('"+email+"', '"+subject+"', '"+message+"')";
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
