<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Resort.DTO.Booking" %>
<%@ page session="true" %>
<%
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    ArrayList<Booking> bookings = (ArrayList<Booking>) session.getAttribute("bookings");
    String message = (String) session.getAttribute("message");
    String error = (String) session.getAttribute("error");
%>

<html>
<head>
    <title>View Bookings</title>
</head>
<body>
    <h2>Your Bookings</h2>

    <% if (message != null) { %>
        <p style="color:green;"><%= message %></p>
        <% session.removeAttribute("message"); %>
    <% } %>

    <% if (error != null) { %>
        <p style="color:red;"><%= error %></p>
        <% session.removeAttribute("error"); %>
    <% } %>

    <table border="1">
        <tr>
            <th>Booking ID</th>
            <th>Room Type</th>
            <th>Check-In</th>
            <th>Check-Out</th>
            <th>Action</th>
        </tr>

        <% if (bookings != null && !bookings.isEmpty()) {
            for (Booking booking : bookings) { %>
                <tr>
                    <td><%= booking.getId() %></td>
                    <td><%= booking.getRoomType() %></td>
                    <td><%= booking.getCheckIn() %></td>
                    <td><%= booking.getCheckOut() %></td>
                    <td>
                        <form action="CancelBookingServlet" method="post">
                            <input type="hidden" name="bookingId" value="<%= booking.getId() %>">
                            <input type="submit" value="Cancel">
                        </form>
                    </td>
                </tr>
            <% }
        } else { %>
            <tr><td colspan="5">No bookings found.</td></tr>
        <% } %>
    </table>
</body>
</html>
