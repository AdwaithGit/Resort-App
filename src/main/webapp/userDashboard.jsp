<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.Resort.DTO.Customer" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- FontAwesome for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        /* Navbar */
        .navbar-dark {
            background-color: #343a40;
        }
        .navbar-brand {
            font-size: 22px;
            font-weight: bold;
        }
        .navbar-text {
            font-size: 18px;
            color: white;
            margin-left: 15px;
        }
        .nav-item {
            font-size: 18px;
        }
        .logout-btn {
            background: red;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }
        .logout-btn:hover {
            background: darkred;
        }

        /* Rooms Section */
        .rooms {
            margin: 50px 0;
            text-align: center;
        }
        .rooms h2 {
            font-size: 32px;
            margin-bottom: 20px;
            color: #333;
        }
        .room-cards {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }
        .room-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            width: 300px;
            transition: 0.3s;
        }
        .room-card:hover {
            transform: scale(1.05);
        }
        .room-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .room-card h3 {
            margin: 10px 0;
            font-size: 20px;
            color: #2575fc;
        }
        .room-card p {
            padding: 0 15px 15px;
            color: #555;
        }
        .room-card a {
            text-decoration: none;
            color: inherit;
            display: block;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-dark navbar-expand-lg">
        <div class="container-fluid">
            <%
                HttpSession sessionObj = request.getSession(false);
                Customer customer = (sessionObj != null) ? (Customer) sessionObj.getAttribute("customer") : null;

                if (customer != null) {
            %>
                <!-- Left side of navbar -->
                
                <span class="navbar-text">Welcome, <%= customer.getName() %></span>

                <!-- Right side of navbar -->
                <div class="d-flex">
				<a href="Logout" class="logout-btn">Logout</a>
			</div>
            <%
                } else {
                    response.sendRedirect("Login.jsp"); 
                }
            %>
        </div>
    </nav>

    <!-- Rooms Section -->
    <section id="rooms" class="rooms">
        <h2>Our Rooms</h2>
        <div class="room-cards">
            <div class="room-card">
                <a href="OceanvillaDashboard.jsp">
                    <img src="https://blog.amari.com/wp-content/uploads/2020/01/executive-suite-ocean-view-2.jpg" alt="Ocean View Suite">
                    <h3><i class="fas fa-water"></i> Ocean View Suite</h3>
                    <p>Enjoy stunning ocean views from your private suite.</p>
                </a>
            </div>
            <div class="room-card">
                <a href="LuxuaryvillaDashboard.jsp">
                    <img src="https://res.cloudinary.com/simplotel/image/upload/w_1620,h_1080/x_0,y_84,w_1620,h_912,r_0,c_crop/q_80,w_1600,dpr_1,f_auto,fl_progressive,c_limit/summit-barsana-resort-spa-kalimpong/PPF04294_Large_meiotm" alt="Luxury Villa">
                    <h3><i class="fas fa-home"></i> Luxury Villa</h3>
                    <p>Experience ultimate comfort in our spacious luxury villa.</p>
                </a>
            </div>
            <div class="room-card">
                <a href="MountainRetreatDashboard.jsp">
                    <img src="https://storage.kempinski.com/cdn-cgi/image/w=1920,f=auto,g=auto,fit=scale-down/ki-cms-prod/images/8/1/7/4/194718-1-eng-GB/f88a1f8efa70-73669719_4K.jpg" alt="Mountain Retreat">
                    <h3><i class="fas fa-tree"></i> Mountain Retreat</h3>
                    <p>Reconnect with nature in our mountain retreat rooms.</p>
                </a>
            </div>
        </div>
    </section>

</body>
</html>
