package com.Resort.DAO;

import java.util.ArrayList;

import com.Resort.DTO.Rooms;

public interface RoomsDAO {
    boolean insertRoom(Rooms room);
    ArrayList<Rooms> getAllRooms();
    Rooms getRoomById(int id);
    boolean updateRoomStatus(int id, boolean isAvailable);
}
