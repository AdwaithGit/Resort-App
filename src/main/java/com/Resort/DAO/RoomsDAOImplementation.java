package com.Resort.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import com.Resort.Connection.Connector;
import com.Resort.DTO.Rooms;

public class RoomsDAOImplementation implements RoomsDAO {

    @Override
    public boolean insertRoom(Rooms room) {
        try {
            Connection conn = Connector.requestConnection();
            PreparedStatement pst = conn.prepareStatement(
                "INSERT INTO rooms (room_type, price, availability) VALUES (?, ?, ?)"
            );
            pst.setString(1, room.getRoomType());
            pst.setDouble(2, room.getPrice());
            pst.setBoolean(3, room.isAvailable());

            int rowsAffected = pst.executeUpdate();
            conn.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public ArrayList<Rooms> getAllRooms() {
        ArrayList<Rooms> roomList = new ArrayList<>();
        try {
            Connection conn = Connector.requestConnection();
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM rooms");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Rooms room = new Rooms(
                    rs.getInt("id"),
                    rs.getString("room_type"),
                    rs.getDouble("price"),
                    rs.getBoolean("availability")
                );
                roomList.add(room);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return roomList;
    }

    @Override
    public Rooms getRoomById(int id) {
        try {
            Connection conn = Connector.requestConnection();
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM rooms WHERE id = ?");
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                Rooms room = new Rooms(
                    rs.getInt("id"),
                    rs.getString("room_type"),
                    rs.getDouble("price"),
                    rs.getBoolean("availability")
                );
                conn.close();
                return room;
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean updateRoomStatus(int id, boolean isAvailable) {
        try {
            Connection conn = Connector.requestConnection();
            PreparedStatement pst = conn.prepareStatement("UPDATE rooms SET availability = ? WHERE id = ?");
            pst.setBoolean(1, isAvailable);
            pst.setInt(2, id);

            int rowsAffected = pst.executeUpdate();
            conn.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
