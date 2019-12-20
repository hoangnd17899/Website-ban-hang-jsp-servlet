package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Category;
import BEAN.Product;

public class CategoryDAO {
	public static List<Category> getAllCategory(Connection conn)
	{
		List<Category> lstcate=new ArrayList<Category>();
		PreparedStatement ptmt=null;
		
		String sql="select * from category";
		
		try {
			ptmt=conn.prepareStatement(sql);
			
			ResultSet rs=ptmt.executeQuery();
			while(rs.next())
			{
				Category pro=new Category();
				pro.setCategoryID(rs.getInt("CategoryID"));
				pro.setAdminID(rs.getInt("AdminID"));
				pro.setCategoryName(rs.getString("CategoryName"));
				lstcate.add(pro);
			}		
			ptmt.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return lstcate;
	}
	
	public static boolean InsertCategory(Category cate,Connection conn)
	{
		PreparedStatement ptmt=null;
		
		String sql="insert into category(CategoryName,AdminID) values(?,?)";
		try {
			ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, cate.getCategoryName());
			ptmt.setInt(2, cate.getAdminID());
			
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
	
	public static boolean DeleteCategory(int id, Connection conn)
	{
		PreparedStatement ptmt=null;
		
		String sql="delete from category where CategoryID="+id;
		try {
			ptmt=conn.prepareStatement(sql);
			int rs=ptmt.executeUpdate();
			if(rs==0) return false;
			
			sql="delete from product_category where CategoryID="+id;
			ptmt=conn.prepareStatement(sql);
			rs=ptmt.executeUpdate();
			
			ptmt.close();
			return true;
		} 
		catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
