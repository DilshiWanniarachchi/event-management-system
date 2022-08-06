package com.Event_Request;

public class request {
	private int requestID;
	private String username;
	private String packagename;
	private String eventtitle;
	private String eventtheme;
	private String guestcount;
	private String eventdate;
	private String venuename;
	private String venueaddress;
	private String service;
	private String description;
	private String eventstatus;

	public request(int requestID, String username, String packagename, String eventtitle, String eventtheme,
			String guestcount, String eventdate, String venuename, String venueaddress, String service,
			String description, String eventstatus) {
		super();
		this.requestID = requestID;
		this.username = username;
		this.packagename = packagename;
		this.eventtitle = eventtitle;
		this.eventtheme = eventtheme;
		this.guestcount = guestcount;
		this.eventdate = eventdate;
		this.venuename = venuename;
		this.venueaddress = venueaddress;
		this.service = service;
		this.description = description;
		this.eventstatus = eventstatus;
	}
	
	public request(int requestID, String username, String packagename, String eventtitle, String eventtheme,
			String guestcount, String eventdate, String venuename, String venueaddress, String service,
			String description) {
		this.requestID = requestID;
		this.username = username;
		this.packagename = packagename;
		this.eventtitle = eventtitle;
		this.eventtheme = eventtheme;
		this.guestcount = guestcount;
		this.eventdate = eventdate;
		this.venuename = venuename;
		this.venueaddress = venueaddress;
		this.service = service;
		this.description = description;
	}

	public int getRequestID() {
		return requestID;
	}
	
	public String getUsername() {
		return username;
	}

	public String getPackagename() {
		return packagename;
	}

	public String getEventtitle() {
		return eventtitle;
	}
	
	public String getEventtheme() {
		return eventtheme;
	}

	public String getGuestcount() {
		return guestcount;
	}
	
	public String getEventdate() {
		return eventdate;
	}

	public String getVenuename() {
		return venuename;
	}
	
	public String getVenueaddress() {
		return venueaddress;
	}

	public String getService() {
		return service;
	}
	
	public String getDescription() {
		return description;
	}
	
	public String getEventstatus() {
		return eventstatus;
	}

	
	
	
	

}
