package com.Resort.DTO;

import java.sql.Date;

public class Booking {
    private int id;
    private String mail;
    private String roomType;
    private Date checkIn;
    private Date checkOut;

    // Constructor for creating new bookings
    public Booking(String mail, String roomType, Date checkIn, Date checkOut) {
        this.mail = mail;
        this.roomType = roomType;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
    }

    // Constructor for fetching bookings from the database
    public Booking(int id, String mail, String roomType, Date checkIn, Date checkOut) {
        this.id = id;
        this.mail = mail;
        this.roomType = roomType;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    

    public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }

    public Date getCheckIn() { return checkIn; }
    public void setCheckIn(Date checkIn) { this.checkIn = checkIn; }

    public Date getCheckOut() { return checkOut; }
    public void setCheckOut(Date checkOut) { this.checkOut = checkOut; }

    @Override
    public String toString() {
        return "Booking [id=" + id + ", mail=" + mail + ", roomType=" + roomType + 
               ", checkIn=" + checkIn + ", checkOut=" + checkOut + "]";
    }
}
