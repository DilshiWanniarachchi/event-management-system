package com.user;

public class User {
	protected int userID;
	protected String fName;
	protected String lName;
	protected String email;
	protected String mobile;
	protected String address;
	protected String username;
	protected String password;
	private String joined_date;
	
	public User(int userID, String fName, String lName, String email, String mobile, String address,
			String username, String password, String joined_date) {
		this.userID = userID;
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		this.joined_date = joined_date;
		this.username = username;
		this.password = password;
	}

	public User(int userID, String fName, String lName, String email, String mobile, String address,
			String username, String password) {
		this.userID = userID;
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		this.username = username;
		this.password = password;
	}

	public int getuserID() {
		return userID;
	}

	public String getfName() {
		return fName;
	}

	public String getlName() {
		return lName;
	}

	public String getEmail() {
		return email;
	}

	public String getMobile() {
		return mobile;
	}

	public String getAddress() {
		return address;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getJoined_date() {
		return joined_date;
	}

}
