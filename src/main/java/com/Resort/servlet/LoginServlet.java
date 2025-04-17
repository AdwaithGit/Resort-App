package com.Resort.servlet;

import java.io.IOException;
import com.Resort.DAO.CustomerDAO;
import com.Resort.DAO.CustomerDAOImplementation;
import com.Resort.DTO.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Retrieve user input
        String email = req.getParameter("mail");
        String password = req.getParameter("password");

        // Validate input fields
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            req.setAttribute("error", "Email and Password are required.");
            RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
            rd.forward(req, resp);
            return; // Stop execution
        }

        // Check credentials
        CustomerDAO cdao = new CustomerDAOImplementation();
        Customer customer = cdao.getCustomer(email, password);

        if (customer != null) { 
            // Create session only for valid users
            HttpSession session = req.getSession(true);
            session.setAttribute("mail", email); // Store email in session
            session.setAttribute("customer", customer); // Store customer details

            req.setAttribute("success", "Login successful");
            RequestDispatcher rd = req.getRequestDispatcher("userDashboard.jsp");
            rd.forward(req, resp);
        } else {
            req.setAttribute("error", "Invalid Credentials");
            RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
            rd.forward(req, resp);
        }
    }
}
