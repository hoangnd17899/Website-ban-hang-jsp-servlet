package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import BEAN.Cart;
import BEAN.Customer;

public class CustomerDAO {
	public static Customer Login(String username, String password,Connection conn)
	{
		Customer cus=null;
	
		
		PreparedStatement ptmt=null;
		
		String sql="select * from customer where UserName='"+username+"' and Password='"+password+"'";
		try {
			ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			if(rs.next()) {
				cus=new Customer();
				cus.setCustomerID(rs.getInt("CustomerID"));
				cus.setUserName(rs.getString("UserName"));
				cus.setPassword(rs.getString("Password"));
				cus.setDisplayName(rs.getString("DisplayName"));
			}
			
			ptmt.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cus;
	}
	
	public static Cart getCartById(int id,Connection conn)
	{
		Cart car=null;
		
		PreparedStatement ptmt=null;
		
		String sql="select * from cart where CustomerID="+id;
		try {
			ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			if(rs.next()) {
				car=new Cart();
				car.setCartID(rs.getInt("CartID"));
				car.setCount(rs.getInt("Count"));
				car.setCustomerID(rs.getInt("CustomerID"));
			}
			
			ptmt.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return car;
	}
	
	public static boolean Register(String username, String displayname,String password,Connection conn)
	{
		PreparedStatement ptmt=null;
		
		String checkUsername="select * from customer where UserName='"+username+"'";
		String sql="insert into customer(UserName,DisplayName,Password) values('"+username+"','"+displayname+"','"+password+"')";
		try {
			ptmt=conn.prepareStatement(checkUsername);
			ResultSet rs=ptmt.executeQuery();
			if(rs.next()) {
				return false;
			}
			else {
				ptmt=conn.prepareStatement(sql);
				ptmt.executeUpdate(sql);
				
				sql="select CustomerID from customer where UserName='"+username+"'";
				ptmt=conn.prepareStatement(sql);
				rs=ptmt.executeQuery();
				rs.next();
				int CustomerID=rs.getInt("CustomerID");
				
				sql="insert into cart(Count,CustomerID) values(0,"+CustomerID+")";
				ptmt=conn.prepareStatement(sql);
				ptmt.executeUpdate(sql);
				
				return true;
			}
		} 
		catch (SQLException e) {
			return false;
		}
	}
}
