package com.Resort.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Resort.Connection.Connector;
import com.Resort.DTO.Customer;



public class CustomerDAOImplementation  implements CustomerDAO{
	private Connection con;
	public CustomerDAOImplementation() {
		this.con=Connector.requestConnection();
	}



	@Override
	public boolean insertCustomer(Customer c) {
		String query = "INSERT INTO CUSTOMER VALUES(0, ?, ?, ?, ?, SYSDATE())"; // 5 placeholders
		int i = 0;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, c.getName());
			ps.setLong(2, c.getPhone());
			ps.setString(3, c.getMail());
			ps.setString(4, c.getPassword());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}else {
			return false;
		}
	}

	


	@Override
	public boolean updateCustomer(Customer c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteCustomer(Customer c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Customer getCustomer(String mail, String password) {
		// TODO Auto-generated method stub
		Customer c=null;
		String query="SELECT * FROM CUSTOMER WHERE MAIL=? AND PASSWORD=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Customer();	//empty object using non parameterized constructor
				
				
				c.setId(rs.getInt("ID"));
				c.setName(rs.getString("NAME"));
				c.setPhone( rs.getLong("PHONE"));
				c.setMail( rs.getString("MAIL"));
				c.setPassword( rs.getString("PASSWORD"));
				c.setDate( rs.getString("DATE"));
			}
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}

	@Override
	public Customer getCustomer(long phone, String mail) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Customer> getCustomer() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Customer getCustomer(String mail) {
	    Customer customer = null;
	    String query = "SELECT * FROM CUSTOMER WHERE email = ?";

	    try (Connection con = Connector.requestConnection();
	         PreparedStatement ps = con.prepareStatement(query)) {

	        ps.setString(1, mail);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) { // If user exists
	            customer = new Customer();
	            customer.setName(rs.getString("name"));
	            customer.setPhone(rs.getLong("phone"));
	            customer.setMail(rs.getString("email"));
	            customer.setPassword(rs.getString("password"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return customer;
	}


}
