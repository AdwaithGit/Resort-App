<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.Resort.DTO.Customer"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
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
			<span class="navbar-brand">Welcome <%=(user != null) ? user : "Guest"%></span>
			<div class="d-flex">
				<%
				if (user != null) {
				%>
				<a href="Logout" class="logout-btn">Logout</a>

				<%
				} else {
				%>
				<a href="Login.jsp" class="logout-btn">Login</a>
				<%
				}
				%>
			</div>
		</div>
	</nav>

	<!-- Main Content -->
	<div class="container mt-4">
		<h2 class="mb-4">Ocean Villa</h2>

		<%
		String[][] rooms = {
				{ "Luxury Ocean View", "20000", "10", "Enjoy a luxurious stay with a breathtaking ocean view.",
				"https://hotelstclair.com/wp-content/uploads/2015/09/Executive-Ocean-VIew-Room-3.jpg" },
				{ "Sea Facing Suite", "25000", "15", "A spacious suite with a private balcony and stunning sea views.",
				"https://d2mo2a5fvrklap.cloudfront.net/app/uploads/sites/11/2022/07/01210551/encinitas-stay-oceanviewsrooms-gallery1.png" },
				{ "Premium Beachfront", "30000", "20",
				"Experience beachfront luxury with direct beach access and modern interiors.",
				"https://www.oberoihotels.com/-/media/oberoi-hotels/website-images/the-oberoi-mumbai/room-and-suites/premier-ocean-view-room/detail/premier-ocean-view-room-2.jpg" },
				{ "Honeymoon Special", "35000", "25",
				"Perfect for couples, featuring romantic décor, a hot tub, and a private terrace.",
				"https://theclifflipe.com/wp-content/uploads/2020/04/Jacuzzi-Suite-Ocean-View-5.jpeg" } };

		for (int i = 0; i < rooms.length; i++) {
			String name = rooms[i][0];
			int price = Integer.parseInt(rooms[i][1]);
			int discount = Integer.parseInt(rooms[i][2]);
			String details = rooms[i][3];
			String imageUrl = rooms[i][4];
			double finalPrice = price - (price * (discount / 100.0));
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
