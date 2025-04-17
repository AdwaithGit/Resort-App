<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Our Services - Resort Paradise</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">

<style>
body {
	font-family: 'Poppins', sans-serif;
	background-color: #f8f9fa;
}

.service-card {
	transition: transform 0.3s;
}

.service-card:hover {
	transform: scale(1.05);
}
</style>
</head>
<body>

	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">Resort Paradise</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="Index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="services.jsp">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="rooms.jsp">Rooms</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Services Section -->
	<div class="container my-5">
		<h2 class="text-center mb-4">Our Premium Services</h2>
		<div class="row">
			<div class="col-md-4">
				<div class="card service-card">
					<img
						src="https://images.pexels.com/photos/3865784/pexels-photo-3865784.jpeg?auto=compress&cs=tinysrgb&w=600"
						class="card-img-top" alt="Spa & Wellness">
					<div class="card-body">
						<h5 class="card-title">
							<i class="fas fa-spa"></i> Spa & Wellness
						</h5>
						<p class="card-text">Relax and rejuvenate with our world-class
							spa treatments.</p>
					</div>
				</div>
			</div>





			<div class="col-md-4">
				<div class="card service-card">
					<img
						src="https://images.unsplash.com/photo-1528605248644-14dd04022da1?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80"
						class="card-img-top" alt="Fine Dining">
					<div class="card-body">
						<h5 class="card-title">
							<i class="fas fa-utensils"></i> Fine Dining
						</h5>
						<p class="card-text">Enjoy gourmet meals crafted by our
							award-winning chefs.</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card service-card">
					<img
						src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80"
						class="card-img-top" alt="Adventure Sports">
					<div class="card-body">
						<h5 class="card-title">
							<i class="fas fa-water"></i> Adventure Sports
						</h5>
						<p class="card-text">Experience thrilling water sports and
							outdoor adventures.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="text-center p-4 bg-dark text-white"> &copy;
		2025 Resort Paradise. All Rights Reserved. </footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
