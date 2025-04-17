package com.Resort.DTO;

public class Rooms {
    private int id;
    private String roomType;
    private double price;
    private boolean isAvailable;

    // Constructor
    public Rooms(int id, String roomType, double price, boolean isAvailable) {
        this.id = id;
        this.roomType = roomType;
        this.price = price;
        this.isAvailable = isAvailable;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public boolean isAvailable() { return isAvailable; }
    public void setAvailable(boolean isAvailable) { this.isAvailable = isAvailable; }
}
