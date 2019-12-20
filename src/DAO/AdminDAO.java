package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
	public static boolean Login(String username, String password,Connection conn)
	{	
		PreparedStatement ptmt=null;
		
		String sql="select * from admin where UserName='"+username+"' and Password='"+password+"'";
		try {
			ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			if(rs.next()) {
				ptmt.close();
				return true;
			}
			return false;
		} 
		catch (SQLException e) {
			return false;
		}
	}
}
