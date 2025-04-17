<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Your Stay</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .booking-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 100vh;
            padding: 0 50px;
        }

        .booking-box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
        }

        .form-label {
            font-weight: 600;
        }

        .form-control {
            width: 100%;
            border-radius: 5px;
        }

        .btn-primary {
            width: 100%;
            border-radius: 5px;
        }

        .resort-image-container {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            height: 50vh;
            padding-right: 20px;
        }

        .resort-image {
            width: 100%;
            max-width: 400px;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
        }

        @media (max-width: 992px) {
            .booking-container {
                flex-direction: column;
                height: auto;
                padding: 20px;
            }

            .resort-image-container {
                height: 30vh;
                justify-content: center;
                padding-right: 0;
            }

            .resort-image {
                height: 100%;
            }
        }
    </style>
</head>
<body>

<%
    String roomType = request.getParameter("roomType");
    String priceStr = request.getParameter("price");

    double pricePerNight = (priceStr != null) ? Double.parseDouble(priceStr) : 0.0;
    String checkInDate = request.getParameter("checkIn");
    String checkOutDate = request.getParameter("checkOut");
    double totalPrice = 0;
    int numberOfNights = 0;

    if (checkInDate != null && checkOutDate != null) {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date inDate = sdf.parse(checkInDate);
            java.util.Date outDate = sdf.parse(checkOutDate);

            long diff = outDate.getTime() - inDate.getTime();
            numberOfNights = (int) (diff / (1000 * 60 * 60 * 24));

            if (numberOfNights > 0) {
                totalPrice = numberOfNights * pricePerNight;

                // Apply discount of ₹2000 if staying for more than 1 day (without displaying it separately)
                if (numberOfNights > 1) {
                    totalPrice -= 2000;
                }
            }
        } catch (Exception e) {
            totalPrice = 0;
        }
    }
%>

<div class="container-fluid">
    <div class="row booking-container">
        <!-- Booking Form (Left Side) -->
        <div class="col-lg-5 d-flex justify-content-center">
            <div class="booking-box">
                <h3 class="text-center mb-4"><i class="fas fa-bed"></i> Book Your Stay</h3>

                <form action="Booking.jsp" method="post">
                    <div class="mb-3">
                        <label class="form-label"><i class="fas fa-hotel"></i> Room Type</label>
                        <input type="text" name="roomType" class="form-control" value="<%= (roomType != null) ? roomType : "" %>" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label"><i class="fas fa-dollar-sign"></i> Price per Night</label>
                        <input type="text" name="price" class="form-control" value="<%= pricePerNight %>" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label"><i class="fas fa-calendar-alt"></i> Check-in Date</label>
                        <input type="date" name="checkIn" class="form-control" value="<%= (checkInDate != null) ? checkInDate : "" %>" required onchange="this.form.submit()">
                    </div>

                    <div class="mb-3">
                        <label class="form-label"><i class="fas fa-calendar-check"></i> Check-out Date</label>
                        <input type="date" name="checkOut" class="form-control" value="<%= (checkOutDate != null) ? checkOutDate : "" %>" required onchange="this.form.submit()">
                    </div>

                    <div class="mb-3">
                        <label class="form-label"><i class="fas fa-moon"></i> Number of Nights</label>
                        <input type="text" class="form-control" value="<%= numberOfNights %> Night(s)" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label"><i class="fas fa-dollar-sign"></i> Total Price</label>
                        <input type="text" class="form-control" value="₹<%= totalPrice %>" readonly>
                    </div>
                </form>

                <form action="BookingServlet" method="post">
                    <input type="hidden" name="roomType" value="<%= roomType %>">
                    <input type="hidden" name="price" value="<%= pricePerNight %>">
                    <input type="hidden" name="checkIn" value="<%= checkInDate %>">
                    <input type="hidden" name="checkOut" value="<%= checkOutDate %>">
                    <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
                    <button type="submit" class="btn btn-primary" <%= (totalPrice > 0) ? "" : "disabled" %>><i class="fas fa-check"></i> Confirm Booking</button>
                </form>
            </div>
        </div>

        <!-- Resort Image (Right Side) -->
        <div class="col-lg-7 d-flex justify-content-end">
            <div class="resort-image-container">
                <img src="https://paradiseresortmz.com/wp-content/uploads/2024/01/Hotel-Paradise-Logo-black-scaled.jpg" alt="Resort View" class="resort-image">
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
