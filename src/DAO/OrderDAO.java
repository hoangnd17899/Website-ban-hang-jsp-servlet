package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Category;
import BEAN.Order;

public class OrderDAO {
	public static boolean InsertOrder(Connection conn,Order ord) {
		PreparedStatement ptmt=null;
		
		String sql="insert into orderbilling(FullName,Phone,Email,Address,Country,City,ZipCode,CustomerID,Total,PaymentMethod) "
				+ "values(?,?,?,?,?,?,?,?,?,?)";
		try {
			ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, ord.getFullName());
			ptmt.setString(2, ord.getPhone());
			ptmt.setString(3, ord.getEmail());
			ptmt.setString(4, ord.getAddress());
			ptmt.setString(5, ord.getCountry());
			ptmt.setString(6, ord.getCity());
			ptmt.setString(7, ord.getZipCode());
			ptmt.setInt(8, ord.getCustomerID());
			ptmt.setInt(9, ord.getTotal());
			ptmt.setString(10, ord.getPaymentMethod());
			
			int ra=ptmt.executeUpdate();
			if(ra==0) {
				return false;
			}			
			return true;
		} 
		catch (SQLException e) {
			return false;
		}
	}
	
	public static List<Order> getAllOrder(Connection conn)
	{
		List<Order> lstorder=new ArrayList<Order>();
		PreparedStatement ptmt=null;
		
		String sql="select * from orderbilling";
		
		try {
			ptmt=conn.prepareStatement(sql);
			
			ResultSet rs=ptmt.executeQuery();
			while(rs.next())
			{
				Order pro=new Order();
				pro.setOrderID(rs.getInt("OrderID"));
				pro.setFullName(rs.getString("FullName"));
				pro.setPhone(rs.getString("Phone"));
				pro.setEmail(rs.getString("Email"));
				pro.setAddress(rs.getString("Address"));
				pro.setCountry(rs.getString("Country"));
				pro.setCity(rs.getString("City"));
				pro.setZipCode(rs.getString("ZipCode"));
				pro.setCustomerID(rs.getInt("CustomerID"));
				pro.setTotal(rs.getInt("Total"));
				pro.setPaymentMethod(rs.getString("PaymentMethod"));
				lstorder.add(pro);
			}		
			ptmt.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return lstorder;
	}
}
