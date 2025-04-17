<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.Resort.DTO.Customer"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mountain Retreat Rooms</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
.navbar {
	background-color: #000;
}

.navbar-brand {
	color: white;
	font-weight: bold;
}

.logout-btn {
	background-color: #dc3545;
	border: none;
	color: white;
	padding: 5px 10px;
	border-radius: 5px;
	text-decoration: none;
}

.logout-btn:hover {
	background-color: #c82333;
}

.room-container {
	margin-bottom: 40px;
	display: flex;
	align-items: center;
}

.room-img {
	width: 100%;
	height: 350px;
	object-fit: cover;
	border-radius: 10px;
	box-shadow: 0 0 10px black;
}

.room-details {
	padding: 20px;
}

.original-price {
	text-decoration: line-through;
	color: gray;
}

.discounted-price {
	font-weight: bold;
	color: #28a745;
}
</style>
</head>
<body>

	<% 
    // Fetch logged-in customer from session
    Customer customer = (Customer) session.getAttribute("customer"); 
    String user = (customer != null) ? customer.getName() : null; 
%>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container-fluid">
			<span class="navbar-brand">Welcome <%= (user != null) ? user : "Guest" %></span>
			<div class="d-flex">
				<% if (user != null) { %>
				<a href="Logout" class="logout-btn">Logout</a>

				<% } else { %>
				<a href="Login.jsp" class="logout-btn">Login</a>
				<% } %>
			</div>
		</div>
	</nav>

	<!-- Main Content -->
	<div class="container mt-4">
		<h2 class="mb-4">Mountain Retreat Rooms</h2>

		<%
		// Room details: {name, price, discount, description, image URL}
		String[][] rooms = {
				{ "Royal Alpine Suite", "22000", "12",
				"A cozy mountain retreat room featuring a warm, floral-themed interior with a stunning forest view from the balcony. The wooden furnishings and soft lighting create a relaxing and inviting ambiance.",
				"https://cdn.webhotelier.net/photos/w=1920/plmr-jsmv/L418700.jpg" },
				{ "Summit View Retreat", "26000", "15", "A charming mountain retreat room with elegant wooden furnishings, floral accents, and a cozy ambiance. The balcony offers breathtaking views of the misty hills and lush greenery.",
				"https://res.cloudinary.com/simplotel/image/upload/w_1620,h_1080/x_0,y_84,w_1620,h_912,r_0,c_crop/q_80,w_1600,dpr_1,f_auto,fl_progressive,c_limit/summit-barsana-resort-spa-kalimpong/PPF04294_Large_meiotm" },
				{ "Premium Forest Cabin", "28000", "18",
				"A luxurious mountain retreat suite with wooden interiors, a high vaulted ceiling, and elegant décor. The spacious balcony offers panoramic views of lush greenery, creating a serene escape.",
				"https://rivermistresorts.com/wp-content/uploads/2021/02/Luxury-cottage-inside-1536x1024.jpg" },
				{ "Honeymoon Hideaway", "32000", "22",
				"A modern and elegant hotel suite featuring warm lighting, luxurious furnishings, and an open-concept design. The stylish decor includes circular wall art, a cozy king-size bed, and a spacious bathroom with a bathtub.",
				"https://www.royaltonhideawayrivieracancun.com/images/slides/slide-19.jpg" } };

		// Loop through rooms and display them in a zigzag layout
		for (int i = 0; i < rooms.length; i++) {
			String name = rooms[i][0];
			int price = Integer.parseInt(rooms[i][1]); // Original price in INR
			int discount = Integer.parseInt(rooms[i][2]); // Discount percentage
			String details = rooms[i][3];
			String imageUrl = rooms[i][4]; // Get the image URL

			// Calculate discounted price
			double finalPrice = price - (price * (discount / 100.0));

			// Determine layout (odd: left image, right text | even: right image, left text)
			String flexClass = (i % 2 == 0) ? "" : "flex-row-reverse";
		%>

		<div class="row room-container <%=flexClass%>">
			<div class="col-md-6">
				<img src="<%=imageUrl%>" class="room-img" alt="<%=name%>">
			</div>
			<div class="col-md-6 room-details">
				<h4><%=name%></h4>
				<p>
					<strong>Price:</strong> <span class="original-price">₹<%=price%></span>
					<span class="discounted-price">₹<%=String.format("%.2f", finalPrice)%></span>
					(<%=discount%>% off)
				</p>
				<p><%=details%></p>
				<a
					href="<%=(customer != null) ? "Booking.jsp?roomType=" + name + "&price=" + String.format("%.2f", finalPrice)
		: "Login.jsp"%>"
					class="btn btn-primary"> Book Now </a>
			</div>
		</div>

		<%
		}
		%>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>