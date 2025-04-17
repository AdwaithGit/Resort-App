<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Validate Admin Session
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("userId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    String role = (String) session1.getAttribute("role");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("index.jsp");
        return;
    }

    String adminEmail = (String) session1.getAttribute("adminEmail"); // Optional: Display admin email
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .sidebar {
            height: 100vh;
            background-color: #343a40;
            padding-top: 20px;
            color: white;
        }
        .sidebar a {
            text-decoration: none;
            color: white;
            display: block;
            padding: 10px 20px;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .dashboard-content {
            padding: 20px;
        }
        .card {
            transition: 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-3 col-lg-2 d-md-block sidebar">
            <h3 class="text-center">Admin Panel</h3>
            <a href="admin-dashboard.jsp">Dashboard</a>
            <a href="manageRooms.jsp">Manage Rooms</a>
            <a href="manageBookings.jsp">Manage Bookings</a>
            <a href="logout.jsp">Logout</a>
        </nav>

        <!-- Main Content -->
        <main class="col-md-9 col-lg-10 dashboard-content">
            <h2>Welcome, Admin</h2>
            <p>Email: <%= adminEmail != null ? adminEmail : "Not Available" %></p>

            <!-- Admin Options -->
            <div class="row">
                <div class="col-md-6">
                    <div class="card bg-primary text-white">
                        <div class="card-body">
                            <h5 class="card-title">Manage Rooms</h5>
                            <p>Add, edit, and delete resort rooms.</p>
                            <a href="manageRooms.jsp" class="btn btn-light">Go to Rooms</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card bg-success text-white">
                        <div class="card-body">
                            <h5 class="card-title">Manage Bookings</h5>
                            <p>View and update customer bookings.</p>
                            <a href="manageBookings.jsp" class="btn btn-light">Go to Bookings</a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
