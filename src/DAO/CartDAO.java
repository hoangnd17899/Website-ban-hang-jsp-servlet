package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CartDAO {
	public static void CleanCart(int cartID,Connection conn) {
		PreparedStatement ptmt=null;
		
		String sql="update cart set Count=0 where CartID="+cartID;
		try {
			ptmt=conn.prepareStatement(sql);
			ptmt.executeUpdate();
			sql="delete from cart_product where CartID="+cartID;
			ptmt=conn.prepareStatement(sql);
			ptmt.executeUpdate();
		} 
		catch (SQLException e) {
			
		}
	}
}
