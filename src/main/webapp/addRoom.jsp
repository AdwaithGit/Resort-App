<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession();
    String role = (String) session1.getAttribute("role");

    if (role == null || !role.equals("admin")) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Room</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Add Room</h2>

        <% String success = (String) request.getAttribute("success"); %>
        <% if (success != null) { %>
            <p class="text-success"><%= success %></p>
        <% } %>

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <p class="text-danger"><%= error %></p>
        <% } %>

        <form action="addRoom" method="post">
            <input type="text" name="room_type" class="form-control mb-2" placeholder="Room Type" required>
            <input type="number" name="price" class="form-control mb-2" placeholder="Price" required>
            <button type="submit" class="btn btn-primary">Add Room</button>
        </form>
    </div>
</body>
</html>
