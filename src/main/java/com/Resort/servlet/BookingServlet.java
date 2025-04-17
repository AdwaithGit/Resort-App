package com.Resort.servlet;

import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.Resort.DAO.BookingDAOImplementation;
import com.Resort.DTO.Booking;
import com.Resort.utils.EmailSender; // Import the EmailSender class

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAOImplementation bookingDAO;

    public void init() {
        bookingDAO = new BookingDAOImplementation();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false); // Do not create a new session if it doesn't exist

        if (session == null || session.getAttribute("mail") == null) {
            request.setAttribute("error", "Please log in first.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
            dispatcher.forward(request, response);
            return; // Stop further execution
        }

        String mail = (String) session.getAttribute("mail");

        try {
            // Get booking details from request
            String roomType = request.getParameter("roomType");
            String price = request.getParameter("price"); // Capture price
            Date checkIn = Date.valueOf(request.getParameter("checkIn"));
            Date checkOut = Date.valueOf(request.getParameter("checkOut"));

            // Check room availability
            if (bookingDAO.isRoomAvailable(roomType, checkIn, checkOut)) {
                Booking booking = new Booking(mail, roomType, checkIn, checkOut);
                int bookingId = bookingDAO.bookRoom(booking);

                if (bookingId > 0) {
                    request.setAttribute("message", "Booking successful!");
                    request.setAttribute("bookingId", bookingId); // Pass booking ID to JSP

                    // **Send HTML Email Confirmation**
                    String subject = "Booking Confirmation - " + roomType;
                    String body = "<html><body>"
                            + "<h2>Booking Confirmation</h2>"
                            + "<p>Dear Customer,</p>"
                            + "<p>Your booking for a <b>" + roomType + "</b> room is confirmed.</p>"
                            + "<p><b>Booking ID:</b> " + bookingId + "</p>"
                            + "<p><b>Check-in Date:</b> " + checkIn + "</p>"
                            + "<p><b>Check-out Date:</b> " + checkOut + "</p>"
                            + "<p><b>Price:</b> $" + price + "</p>"
                            + "<p>Thank you for choosing our resort!</p>"
                            + "<p>Best Regards,</p>"
                            + "<p><b>Resort Team</b></p>"
                            + "</body></html>";

                    // Call EmailSender utility with HTML content
                    EmailSender.sendEmail(mail, subject, body, true);

                } else {
                    request.setAttribute("error", "Booking failed.");
                }
            } else {
                request.setAttribute("error", "Room unavailable.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while processing your booking.");
        }

        // Forward back to booking page
        RequestDispatcher dispatcher = request.getRequestDispatcher("Booking.jsp");
        dispatcher.forward(request, response);
    }
}
