package com.Resort.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.Resort.DAO.BookingDAOImplementation;

@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAOImplementation bookingDAO;

    public void init() {
        bookingDAO = new BookingDAOImplementation();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            session.setAttribute("error", "Please log in first.");
            response.sendRedirect("Login.jsp");
            return;
        }

        try {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));

            // Ensure the user can only cancel their own booking
            if (bookingDAO.cancelBooking(bookingId, userEmail)) {
                session.setAttribute("message", "Booking cancelled successfully.");
            } else {
                session.setAttribute("error", "Cancellation failed. You can only cancel your own bookings.");
            }
        } catch (Exception e) {
            session.setAttribute("error", "Invalid booking ID.");
        }
        response.sendRedirect("ViewBookingsServlet");
    }
}
