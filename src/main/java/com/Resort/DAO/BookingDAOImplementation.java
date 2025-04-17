package com.Resort.DAO;

import java.sql.*;
import java.util.ArrayList;
import com.Resort.Connection.Connector;
import com.Resort.DTO.Booking;

public class BookingDAOImplementation implements BookingDAO {
	private Connection con;

	public BookingDAOImplementation() {
		this.con = Connector.requestConnection();
	}

	// ✅ Method to book a room (Insert into the database)
	@Override
	public int bookRoom(Booking booking) {
	    int generatedId = -1;
	    String sql = "INSERT INTO bookings (customer_id, mail, room_type, check_in, check_out) VALUES (?, ?, ?, ?, ?)";
	    
	    try (
	         PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
	        
	        // Get customer_id from email (Ensure this function works)
	        int customerId = getCustomerIdByEmail(booking.getMail()); 
	        System.out.println("Customer ID: " + customerId); // Debugging

	        if (customerId == -1) {
	            System.out.println("Error: Customer ID not found for email: " + booking.getMail());
	            return -1;
	        }

	        stmt.setInt(1, customerId);
	        stmt.setString(2, booking.getMail());
	        stmt.setString(3, booking.getRoomType());
	        stmt.setDate(4, booking.getCheckIn());
	        stmt.setDate(5, booking.getCheckOut());

	        int rowsInserted = stmt.executeUpdate();
	        System.out.println("Rows Inserted: " + rowsInserted); // Debugging

	        if (rowsInserted > 0) {
	            ResultSet rs = stmt.getGeneratedKeys();
	            if (rs.next()) {
	                generatedId = rs.getInt(1);
	                System.out.println("Generated Booking ID: " + generatedId);
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace(); // Print detailed error
	    }
	    
	    return generatedId;
	}


	public int getCustomerIdByEmail(String email) {
    String sql = "SELECT id FROM customer WHERE mail = ?";
    int customerId = -1;
    
    try (
         PreparedStatement stmt = con.prepareStatement(sql)) {
        
        stmt.setString(1, email);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            customerId = rs.getInt("id");
            System.out.println("✅ Customer found! ID: " + customerId);
        } else {
            System.out.println("❌ Error: No customer found with email: " + email);
        }
    } catch (SQLException e) {
        System.out.println("❌ SQL Error in getCustomerIdByEmail:");
        e.printStackTrace();
    }

    return customerId;
}


	// ✅ Method to check if a room is available for the given dates
	@Override
	public boolean isRoomAvailable(String roomType, Date checkIn, Date checkOut) {
		String sql = "SELECT COUNT(*) FROM bookings WHERE room_type = ? AND (check_in < ? AND check_out > ?)";

		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, roomType);
			ps.setDate(2, checkOut);
			ps.setDate(3, checkIn);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1) == 0; // Room is available if count is 0
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// ✅ Method to update an existing booking
	@Override
	public boolean updateBooking(Booking booking) {
		String sql = "UPDATE bookings SET check_in = ?, check_out = ?, room_type = ? WHERE id = ? AND mail = ?";

		try (PreparedStatement stmt = con.prepareStatement(sql)) {
			stmt.setDate(1, booking.getCheckIn());
			stmt.setDate(2, booking.getCheckOut());
			stmt.setString(3, booking.getRoomType());
			stmt.setInt(4, booking.getId());
			stmt.setString(5, booking.getMail());

			return stmt.executeUpdate() > 0; // Returns true if update was successful
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// ✅ Method to cancel a booking
	@Override
	public boolean cancelBooking(int bookingId, String mail) {
		String sql = "DELETE FROM bookings WHERE id = ? AND mail = ?";

		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, bookingId);
			ps.setString(2, mail);

			return ps.executeUpdate() > 0; // Returns true if deletion was successful
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// ✅ Method to get booking details by booking ID
	@Override
	public Booking getBookingById(int bookingId) {
		String sql = "SELECT * FROM bookings WHERE id = ?";

		try (PreparedStatement stmt = con.prepareStatement(sql)) {
			stmt.setInt(1, bookingId);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return new Booking(
							rs.getInt("id"),
							rs.getString("mail"),
							rs.getString("room_type"),
							rs.getDate("check_in"),
							rs.getDate("check_out")
							);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// ✅ Method to get all bookings
	@Override
	public ArrayList<Booking> getAllBookings() {
		ArrayList<Booking> bookings = new ArrayList<>();
		String sql = "SELECT * FROM bookings";

		try (Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {
			while (rs.next()) {
				bookings.add(new Booking(
						rs.getInt("id"),
						rs.getString("mail"),
						rs.getString("room_type"),
						rs.getDate("check_in"),
						rs.getDate("check_out")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookings;
	}

	// ✅ Method to get all bookings by a specific user
	@Override
	public ArrayList<Booking> getBookingsByUser(String mail) {
		ArrayList<Booking> bookings = new ArrayList<>();
		String sql = "SELECT * FROM bookings WHERE mail = ?";

		try (PreparedStatement stmt = con.prepareStatement(sql)) {
			stmt.setString(1, mail);

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					bookings.add(new Booking(
							rs.getInt("id"),
							rs.getString("mail"),
							rs.getString("room_type"),
							rs.getDate("check_in"),
							rs.getDate("check_out")
							));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookings;
	}
}
