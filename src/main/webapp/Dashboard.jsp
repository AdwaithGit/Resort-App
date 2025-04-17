<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Resort.DTO.Customer" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Resort Paradise</title>

    <!-- Bootstrap & Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f9f9f9;
            padding: 20px;
        }

        .dashboard-container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .logout-btn {
            text-align: right;
        }

        .logout-btn a {
            color: red;
            font-weight: bold;
            text-decoration: none;
            transition: color 0.3s;
        }

        .logout-btn a:hover {
            color: darkred;
        }
    </style>
</head>
<body>

    <%
        // Retrieve customer from session
        Customer user = (Customer) session.getAttribute("customer");

        // Redirect to login page if user is not logged in
        if (user == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
    %>

    <div class="dashboard-container">
        <div class="logout-btn">
            <a href="Logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>

        <h2>Welcome, <%= user.getName() %>!</h2>

        <hr>
        <h4>Dashboard Overview</h4>
        <ul>
            <li><i class="fas fa-bed"></i> <a href="Booking.jsp">Manage Bookings</a></li>
            <li><i class="fas fa-concierge-bell"></i> <a href="Services.jsp">View Services</a></li>
            <li><i class="fas fa-users"></i> <a href="contact.jsp">Customer Support</a></li>
        </ul>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
