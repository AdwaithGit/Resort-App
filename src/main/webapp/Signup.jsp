<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modern SignUp Form</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- jQuery Validation -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>

    <style>
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, white,grey);
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .card {
            width: 400px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 30px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            animation: fadeIn 1s ease-in-out;
        }

        .card h2 {
            text-align: center;
            color: #fff;
            font-weight: 600;
        }

        .error {
            color: #ff4757;
            font-size: 12px;
            margin-top: 5px;
            display: block;
        }
    </style>
</head>

<body>
    <div class="card">
        <h2>Create an Account</h2>
        
        <% String successMessage = (String) request.getAttribute("success");
        if (successMessage != null) { %>
            <p class="text-success fw-bold"><%= successMessage %></p>
        <% } %>

        <% String error = (String) request.getAttribute("error");
        if (error != null) { %>
            <p class="text-danger fw-bold"><%= error %></p>
        <% } %>

        <form id="registrationForm" action="signup" method="post">
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" name="name" >
            </div>

            <div class="mb-3">
                <label class="form-label">Phone</label>
                <input type="text" class="form-control" name="phone" >
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="mail" >
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" class="form-control" id="pw" name="password" >
            </div>

            <div class="mb-3">
                <label class="form-label">Confirm Password</label>
                <input type="password" class="form-control" name="confirmPassword" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Sign Up</button>
        </form>

        <p class="text-center mt-3">
            Already have an account? <a href="Login.jsp">Login</a>
        </p>
    </div>

    <!-- jQuery Validation Script -->
    <script>
        $(document).ready(function () {
            $("#registrationForm").validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 3
                    },
                    phone: {
                        required: true,
                        digits: true,
                        
                        maxlength: 10
                    },
                    mail: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 6
                    },
                    confirmPassword: {
                        required: true,
                        equalTo: "#pw"
                    }
                },
                messages: {
                    name: {
                        required: "Please enter your name",
                        minlength: "Name must be at least 3 characters"
                    },
                    phone: {
                        required: "Please enter your phone number",
                        digits: "Only numbers allowed",
                       
                        maxlength: "Phone number must not exceed 10 digits"
                    },
                    mail: {
                        required: "Please enter your email",
                        email: "Enter a valid email address"
                    },
                    password: {
                        required: "Please enter a password",
                        minlength: "Password must be at least 6 characters"
                    },
                    confirmPassword: {
                        required: "Please confirm your password",
                        equalTo: "Passwords do not match"
                    }
                },
                errorElement: "div",
                errorPlacement: function (error, element) {
                    error.addClass("error");
                    error.insertAfter(element);
                }
            });
        });
    </script>
</body>
</html>
