package com.customer;

import com.user.User;

public class Customer extends User{
	private String joined_date;

	public Customer(int userID, String fName, String lName, String email, String mobile, String address,
			String username, String password, String joined_date) {
		super(userID, fName, lName, email, mobile, address, username, password, joined_date);
		this.joined_date = joined_date;
	}

	public String getJoined_date() {
		return joined_date;
	}

	public void setJoined_date(String joined_date) {
		this.joined_date = joined_date;
	}
	
	
	
}
