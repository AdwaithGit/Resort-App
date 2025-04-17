<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">

<style>
/* Fullscreen Background */
body, html {
	height: 100%;
	margin: 0;
	font-family: 'Inter', sans-serif;
	background: linear-gradient(135deg, #1f1c2c, #928dab);
	display: flex;
	justify-content: center;
	align-items: center;
}

/* Modern Glassmorphism Card Design */
.login-container {
	width: 400px;
	padding: 40px;
	background: rgba(255, 255, 255, 0.1);
	border-radius: 40px 10px; /* Smaller border radius for sharper edges */
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1), inset 0 4px 8px
		rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(15px);
	text-align: center;
	color: white;
	transition: all 0.4s ease-in-out;
}

/* Interactive Hover Effect */
.login-container:hover {
	box-shadow: 0 12px 40px rgba(0, 0, 0, 0.2), inset 0 6px 12px
		rgba(255, 255, 255, 0.2);
	transform: translateY(-5px);
}

/* Input Group Styling */
.input-group {
	position: relative;
	margin-bottom: 25px;
}

.input-group .input-group-text {
	background: rgba(255, 255, 255, 0.1);
	border: none;
	border-radius: 8px 8px; /* Smaller border radius for input group */
	padding: 12px;
	color: #fff;
	font-size: 18px;
}

.input-group input {
	flex: 1;
	padding: 12px;
	border-radius: 0 8px 8px 0;
	/* Smaller border radius for input fields */
	border: none;
	font-size: 14px;
	color: white;
	background: rgba(255, 255, 255, 0.1);
	outline: none;
	transition: 0.3s;
}

.input-group input::placeholder {
	color: rgba(255, 255, 255, 0.7);
}

.input-group input:focus {
	background: rgba(255, 255, 255, 0.2);
	box-shadow: inset 0 0 10px rgba(255, 255, 255, 0.3);
}

/* Password Toggle */
.toggle-password {
	cursor: pointer;
	color: white;
	font-size: 18px;
	padding: 12px;
}

.toggle-password:hover {
	color: #ddd;
}

/* Button Styling */
.btn-primary {
	background-color: rgba(255, 255, 255, 0.1);
	border: none;
	border-radius: 8px; /* Smaller border radius for button */
	padding: 12px;
	width: 100%;
	color: white;
	font-weight: 600;
	transition: 0.3s;
	box-shadow: 0 4px 6px rgba(255, 255, 255, 0.1), 0 6px 12px
		rgba(255, 255, 255, 0.2);
}

.btn-primary:hover {
	background-color: rgba(255, 255, 255, 0.2);
	transform: translateY(-2px);
	box-shadow: 0 6px 12px rgba(255, 255, 255, 0.2), 0 10px 20px
		rgba(255, 255, 255, 0.3);
}

/* Links */
a {
	color: white;
	font-weight: 500;
	transition: color 0.3s;
	text-decoration: none;
}

a:hover {
	color: #ddd;
}

/* Additional Styling */
h2 {
	font-weight: 700;
	margin-bottom: 30px;
	color: white;
}

p {
	margin: 10px 0;
}
</style>
</head>
<body>
	<div class="login-container">
		<h2 class="mb-4">Welcome Back</h2>

		<% String logoutMes = (String) session.getAttribute("message"); %>
		<% if (logoutMes != null) { %>
		<p class="text-danger fw-bold"><%= logoutMes %></p>
		<% } %>

		<% String error = (String) session.getAttribute("error"); %>
		<% if (error != null) { %>
		<p class="text-danger fw-bold"><%= error %></p>
		<% } %>

		<% String successMessage = (String) request.getAttribute("successful"); %>
		<% if (successMessage != null) { %>
		<p class="text-success fw-bold"><%= successMessage %></p>
		<% } %>

		<form action="login" method="POST">
			<!-- Email Field -->
			<div class="input-group">
				<span class="input-group-text"><i class="fas fa-envelope"></i></span>
				<input type="email" class="form-control" name="mail"
					placeholder="Email ID" required>
			</div>

			<!-- Password Field -->
			<div class="input-group">
				<span class="input-group-text"><i class="fas fa-lock"></i></span> <input
					type="password" class="form-control" id="pw" name="password"
					placeholder="Password" required> <span
					class="input-group-text toggle-password" id="togglePw"><i
					class="fas fa-eye"></i></span>
			</div>

			<button type="submit" class="btn btn-primary">Login</button>
		</form>

		<p class="mt-3">
			Don't have an account? <a href="Signup.jsp">Sign up</a>
		</p>
		<p>
			Forgot Pin? <a href="Forgot.jsp">Reset Pin</a>
		</p>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Password Toggle Script -->
	<script>
        document.getElementById("togglePw").addEventListener("click", function() {
            let pwField = document.getElementById("pw");
            let type = pwField.type === "password" ? "text" : "password";
            pwField.type = type;
            this.querySelector("i").classList.toggle("fa-eye");
            this.querySelector("i").classList.toggle("fa-eye-slash");
        });
    </script>
</body>
</html>