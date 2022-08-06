package com.contact;

public class Contact {
	private int messageID;
	private String email;
	private String subject;
	private String message;
	
	public Contact(int messageID, String email, String subject, String message) {
		this.messageID = messageID;
		this.email = email;
		this.subject = subject;
		this.message = message;
	}

	public int getMessageID() {
		return messageID;
	}

	public String getEmail() {
		return email;
	}

	public String getSubject() {
		return subject;
	}

	public String getMessage() {
		return message;
	}
	
	
	
	

}
