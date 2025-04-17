<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<title>Resort Paradise</title>

<style>
/* Global Styles */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	color: #333;
	line-height: 1.6;
}

a {
	text-decoration: none;
	color: inherit;
}

/* Navbar */
.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 40px;
	background: #333;
	color: white;
	position: sticky;
	top: 0;
	z-index: 1000;
}

.navbar .logo h1 {
	font-size: 2rem;
	font-family: 'Satisfy', cursive;
	color: #f8c146;
}

.navbar nav ul {
	list-style: none;
	display: flex;
	gap: 20px;
}

.navbar nav ul li a {
	font-size: 1.1rem;
	color: white;
	transition: color 0.3s ease;
	display: flex;
	align-items: center;
	gap: 5px;
}

.navbar nav ul li a:hover {
	color: #f8c146;
}

/* Hero Section */
.hero {
	background: url('resort1.jpg') no-repeat center/cover;
	height: 80vh;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	color: white;
	position: relative;
}

.hero::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0, 0, 0, 0.5);
}

.hero-content {
	position: relative;
	z-index: 1;
}

.hero-content h1 {
	font-size: 4rem;
	font-weight: 700;
	margin-bottom: 20px;
}

.hero-content p {
	font-size: 1.5rem;
	margin-bottom: 30px;
}

.btn-book {
	background: #f8c146;
	padding: 12px 30px;
	color: white;
	font-size: 1.2rem;
	border-radius: 5px;
	transition: background 0.3s ease;
	display: inline-flex;
	align-items: center;
	gap: 8px;
}

.btn-book:hover {
	background: #e6ac30;
}

/* About Section */
.about {
	padding: 80px 20px;
	text-align: center;
	background: #f9f9f9;
}

.about h2 {
	font-size: 2.5rem;
	margin-bottom: 20px;
	color: #333;
}

.about p {
	font-size: 1.2rem;
	max-width: 800px;
	margin: 0 auto;
	color: #555;
}

/* Rooms Section */
.rooms {
	padding: 80px 20px;
	text-align: center;
	background: #fff;
}

.rooms h2 {
	font-size: 2.5rem;
	margin-bottom: 40px;
	color: #333;
}

.room-cards {
	display: flex;
	justify-content: center;
	gap: 30px;
	flex-wrap: wrap;
}

.room-card {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	width: 300px;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.room-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
}

.room-card img {
	width: 100%;
	border-radius: 8px;
	margin-bottom: 15px;
}

.room-card h3 {
	font-size: 1.8rem;
	margin-bottom: 10px;
	color: #333;
	display: flex;
	align-items: center;
	gap: 8px;
}

.room-card p {
	font-size: 1rem;
	color: #777;
}

/* Footer */
.footer {
	background: #333;
	color: white;
	text-align: center;
	padding: 40px 20px;
}

.footer p {
	margin: 10px 0;
	font-size: 1rem;
}

.social-icons {
	margin-top: 20px;
}

.social-icons a {
	color: white;
	font-size: 1.5rem;
	margin: 0 10px;
	transition: color 0.3s ease;
}

.social-icons a:hover {
	color: #f8c146;
}
</style>
</head>
<body>

	<header>
		<div class="navbar">
			<div class="logo">
				<h1>
					<i class="fas fa-umbrella-beach"></i> Resort Paradise
				</h1>
			</div>
			<nav>
				<ul>
					<li><a href="#about"><i class="fas fa-info-circle"></i>
							About</a></li>
					<li><a href="#rooms"><i class="fas fa-bed"></i> Rooms</a></li>
					<li><a href="Booking.jsp"><i class="fas fa-calendar-check"></i>
							Book Now</a></li>
					<li><a href="#contact"><i class="fas fa-envelope"></i>
							Contact</a></li>
				</ul>
			</nav>
		</div>
	</header>

	<section id="hero" class="hero">
		<div class="hero-content">
			<h1>Luxury Awaits You</h1>
			<p>Experience the ultimate in comfort and relaxation.</p>
			<a href="Signup.jsp" class="btn-book"><i
				class="fas fa-arrow-right"></i> Book Your Stay</a>
		</div>
	</section>

	<section id="rooms" class="rooms">
		<h2>Our Rooms</h2>
		<div class="room-cards">
			<div class="room-card"><a href="OceanvillaDashboard.jsp">
				<img
					src="https://blog.amari.com/wp-content/uploads/2020/01/executive-suite-ocean-view-2.jpg"
					alt="Ocean View Suite">
				<h3>
					<i class="fas fa-water"></i> Ocean View Suite
				</h3>
				<p>Enjoy stunning ocean views from your private suite.</p></a>
			</div>
			<div class="room-card"><a href="LuxuaryvillaDashboard.jsp">
				<img
					src="https://res.cloudinary.com/simplotel/image/upload/w_1620,h_1080/x_0,y_84,w_1620,h_912,r_0,c_crop/q_80,w_1600,dpr_1,f_auto,fl_progressive,c_limit/summit-barsana-resort-spa-kalimpong/PPF04294_Large_meiotm"
					alt="Luxury Villa">
				<h3>
					<i class="fas fa-home"></i>  Luxury Villa
				</h3>
				<p>Experience ultimate comfort in our spacious luxury villa.</p></a>
			</div>
			<div class="room-card"> <a href="MountainRetreatDashboard.jsp">
				<img
					src="https://storage.kempinski.com/cdn-cgi/image/w=1920,f=auto,g=auto,fit=scale-down/ki-cms-prod/images/8/1/7/4/194718-1-eng-GB/f88a1f8efa70-73669719_4K.jpg"
					alt="Mountain Retreat">
				<h3>
					<i class="fas fa-tree"></i> Mountain Retreat
				</h3>
				<p>Reconnect with nature in our mountain retreat rooms.</p></a>
			</div>
		</div>
	</section>
	<footer id="contact" class="footer">
		<p>Sy No.216 & 344 Channagondanahalli, Chikmagalur - 577101</p>
		<p>T: +91 8050677478 | E: reservations@paradisechikmagalur.com</p>
		<div class="social-icons">
			<a href="#"><i class="fab fa-whatsapp"></i></a> <a href="#"><i
				class="fab fa-instagram"></i></a> <a href="#"><i
				class="fab fa-facebook"></i></a> <a href="#"><i
				class="fab fa-twitter"></i></a>
		</div>
		<p>© 2024 Paradise Hotels & Resorts Pvt. Ltd.</p>
	</footer>

</body>
</html>
