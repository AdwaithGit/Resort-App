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

@WebServlet("/signup")
public class SignUp extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    	Customer c = new Customer();
    	CustomerDAO cdao = new CustomerDAOImplementation();
//        String name = req.getParameter("name");
//        String phoneStr = req.getParameter("phone");
//        String mail = req.getParameter("mail");
//        String password = req.getParameter("password");
//        String confirmPassword = req.getParameter("confirmPassword");
    	
    	c.setName(req.getParameter("name"));
    	c.setPhone(Long.parseLong(req.getParameter("phone")));
    	c.setMail(req.getParameter("mail"));
    	
    	
    	if(req.getParameter("password").equals(req.getParameter("confirmPassword"))){
			c.setPassword(req.getParameter("password"));

			if(cdao.insertCustomer(c)) {
				//out.println("<h1>Data Saved Successfullly</h1>");
				req.setAttribute("success", "Data saved Successfully!!!");
				RequestDispatcher rd=req.getRequestDispatcher("Signup.jsp");
				rd.forward(req, resp);
			}
		}
		else {
			//out.println("<h1>failed to save the data</h1>");
			req.setAttribute("error", "failed to save the data");
			RequestDispatcher rd=req.getRequestDispatcher("Signup.jsp");
			rd.forward(req, resp);
		}


       
}

        
        
        

        
    }

