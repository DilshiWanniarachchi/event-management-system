package com.admin;

import com.user.User;

public class Admin extends User{
	private String admin_privilege;

	public Admin(int userID, String fName, String lName, String email, String mobile, String address, String username,
			String password) {
		super(userID, fName, lName, email, mobile, address, username, password);
	}


	public Admin(int userID, String fName, String lName, String email, String mobile, String address, String username,
			String password, String joined_date, String admin_privilege) {
		super(userID, fName, lName, email, mobile, address, username, password, joined_date);
		this.admin_privilege = admin_privilege;
	}


	public String getAdmin_privilege() {
		return admin_privilege;
	}

	public void setAdmin_privilege(String admin_privilege) {
		this.admin_privilege = admin_privilege;
	}

	
}
