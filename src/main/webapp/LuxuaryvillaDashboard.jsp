<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.Resort.DTO.Customer"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Luxury Villa</title>
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
		<h2 class="mb-4">Luxury Villa</h2>

		<%
		// Updated Room details with "Ocean" removed
		String[][] rooms = { { "Imperial Penthouse", "40000", "30",
				"This luxurious bedroom features a grand bed with gold-accented furniture, deep purple drapery, and intricate ceiling décor with a crystal chandelier. The marble flooring and ornate details create a regal, palace-like ambiance.",
				"https://th.bing.com/th/id/R.877f1b9e3a43678023fea75b34dbd320?rik=R3YIj4xDELN8Bg&riu=http%3a%2f%2fwww.stevewilliamskitchens.co.uk%2fwp-content%2fuploads%2f2016%2f05%2f8-luxury-bedrooms-in-detail-69.jpg&ehk=LyTMEIgpjVzz%2b0pUsHlgMVO1glG3LyRutj916ml4ze4%3d&risl=&pid=ImgRaw&r=0" },

				{ "Majestic Skyview Suite", "35000", "25",
				"This spacious luxury suite features a modern design with a plush king-size bed, elegant seating area, and floor-to-ceiling windows offering stunning views of a tropical resort. Soft neutral tones, blue accents, and natural light create a serene and sophisticated ambiance.",
				"https://premieregypthotels.com/images/uploads/premier-le-r%C3%AAve-majestic-suite-2021313125432.jpg" },

				{ "Royal Sapphire Retreat", "30000", "20",
				"This elegant hotel room features warm wooden accents, a plush king-size bed, and ambient lighting for a cozy atmosphere. A stylish work desk, modern décor, and soft carpeting add to its luxurious comfort.",
				"https://media-cdn.tripadvisor.com/media/photo-s/05/e2/66/ab/coral-al-hamra.jpg" },

				{ "Presidential Grand Villa", "50000", "35",
				"This luxurious villa suite features an elegant blend of earthy tones, plush furnishings, and large windows offering breathtaking views. The high-ceiling design, private outdoor seating, and artistic décor create a serene and sophisticated retreat.",
				"https://content.themulia.com/proxy/https://cdn.prod.website-files.com/6624ff6a5db57a668993dd5e/66a1d86734ae657ecd701e9c_Mulia%20Villas%20-%20Presidential%20Villa%20-%20Bedroom%202.webp" } };

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
