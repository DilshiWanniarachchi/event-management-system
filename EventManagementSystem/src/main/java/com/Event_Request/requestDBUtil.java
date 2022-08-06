package com.Event_Request;
import java.sql.Connection;
import java.sql.Statement;

import com.user.DBConnect;



public class requestDBUtil {
	
	private static Connection con;  
    private static Statement stmt;
	
	/*insert event request*/
    
	public static boolean insertrequest(String username, String packagename, String eventtitle, String eventtheme, String guestcount, String eventdate, String venuename, String venueaddress,
			String service, String description) {
		
		boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "INSERT into request (username, packageName, eventTitle, eventTheme, guestCount, eventDate, venueName, venueAdd, services, description) VALUES ('"+username+"' , '"+packagename+"' , '"+eventtitle+"' , '"+eventtheme+"' , '"+guestcount+"', '"+eventdate+"' , '"+venuename+"' , '"+venueaddress+"' , '"+service+"'  , '"+description+"')";
			int rs = stmt.executeUpdate(sql);	
			
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
			}
		
		catch(Exception e) {
			e.printStackTrace(); 
		}

		return isSuccess;
		
	}
	
	
	/*update event request*/
	
	public static boolean updaterequest(String requestid, String eventtitle,String eventtheme,String guestcount,String eventdate,String venuename,String venueaddress,String services,String description){
		boolean isSuccess = false;
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql="UPDATE request set eventTitle ='"+eventtitle+"', eventTheme='"+eventtheme+"', guestCount = '"+guestcount+"', eventDate='"+eventdate+"', venueName='"+venuename+"', venueAdd='"+venueaddress+"', services='"+services+"', description='"+description+"' where requestID = '"+requestid+"'" ;
			
			int rs = stmt.executeUpdate(sql);
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
				
		}
		catch(Exception e) {
			e.printStackTrace();	
		}
		
		return isSuccess;
	}
	
	/*delete event request*/
	
	public static boolean deleterequest(String id) {
		boolean isSuccess = false;
		
		int intID = Integer.parseInt(id);
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql="DELETE from request where requestID = '"+intID+"' ";
			
			int rs = stmt.executeUpdate(sql);
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
				
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
				
		
		return isSuccess;
	}
	
	

}

