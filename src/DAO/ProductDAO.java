package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Product;

public class ProductDAO {
	public static int getCountProducts(Connection conn, String category) {
		int count=0;
		PreparedStatement ptmt=null;
		String sql="";
		
		if(category.contentEquals("all"))
		{
			sql="select count(*) from product";
		}
		else {
			sql="select count(*)\r\n" + 
					"from product,category,product_category\r\n" + 
					"where category.CategoryName='"+category+"'\r\n" + 
					"	and category.CategoryID=product_category.CategoryID\r\n" + 
					"    and product.ProductID=product_category.ProductID";
		}
		
		try {
			ptmt=conn.prepareStatement(sql);
			
			ResultSet rs=ptmt.executeQuery();
			rs.next();
			count=rs.getInt("count(*)");
		} 
		catch (SQLException e) {
			e.printStackTrace();
			return count;
		}
		return count;
	}
	
	public static Product getProductById(int id,Connection conn)
	{
		Product pro=new Product();
		PreparedStatement ptmt=null;
		
		String sql="select * from product where ProductID="+id;
		try {
			ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			rs.next();
				pro.setProductID(rs.getInt("ProductID"));
				pro.setProductName(rs.getString("ProductName"));
				pro.setPrice(rs.getInt("Price"));
				pro.setScreenSize(rs.getString("ScreenSize"));
				pro.setWeight(rs.getString("Weight"));
				pro.setOrigin(rs.getString("Origin"));
				pro.setImage(rs.getString("Image"));
				pro.setThumbnail(rs.getString("Thumbnail"));
				pro.setDescription(rs.getString("Description"));
			
			ptmt.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pro;
	}
	
	public static List<Product> getProductByCategory(Connection conn,String cate,int page)
	{
		List<Product> lstacc=new ArrayList<Product>();
		PreparedStatement ptmt=null;
		String sql;
		if(cate.contentEquals("all"))
		{
			sql="select * from product limit 12 offset "+(page-1)*12;
		}
		else {
			sql="select product.*\r\n" + 
					"from product,category,product_category\r\n" + 
					"where category.CategoryName='"+cate+"'\r\n" + 
					"	and category.CategoryID=product_category.CategoryID\r\n" + 
					"    and product.ProductID=product_category.ProductID limit 12 offset "+(page-1)*12;
		}
			
			try {
				ptmt=conn.prepareStatement(sql);
				
				ResultSet rs=ptmt.executeQuery();
				while(rs.next())
				{
					Product pro=new Product();
					pro.setProductID(rs.getInt("ProductID"));
					pro.setProductName(rs.getString("ProductName"));
					pro.setPrice(rs.getInt("Price"));
					pro.setScreenSize(rs.getString("ScreenSize"));
					pro.setWeight(rs.getString("Weight"));
					pro.setOrigin(rs.getString("Origin"));
					pro.setImage(rs.getString("Image"));
					pro.setThumbnail(rs.getString("Thumbnail"));
					pro.setDescription(rs.getString("Description"));
					lstacc.add(pro);
				}		
				ptmt.close();
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
			return lstacc;	
	}
	
	public static List<Product> getProductByCartId(Connection conn,int cartID)
	{
		List<Product> lstacc=new ArrayList<Product>();
		PreparedStatement ptmt=null;
		
		String sql="select product.*\r\n" + 
				"from cart_product,product\r\n" + 
				"where cart_product.CartID="+cartID+" and product.ProductID=cart_product.ProductID";
		
		try {
			ptmt=conn.prepareStatement(sql);
			
			ResultSet rs=ptmt.executeQuery();
			while(rs.next())
			{
				Product pro=new Product();
				pro.setProductID(rs.getInt("ProductID"));
				pro.setProductName(rs.getString("ProductName"));
				pro.setPrice(rs.getInt("Price"));
				pro.setScreenSize(rs.getString("ScreenSize"));
				pro.setWeight(rs.getString("Weight"));
				pro.setOrigin(rs.getString("Origin"));
				pro.setImage(rs.getString("Image"));
				pro.setThumbnail(rs.getString("Thumbnail"));
				pro.setDescription(rs.getString("Description"));
				lstacc.add(pro);
			}		
			ptmt.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return lstacc;
	}
	
	public static void AddToCart(int cartID,int productID,Connection conn)
	{
		PreparedStatement ptmt=null;
		
		String sql="insert into cart_product(CartID,ProductID) values("+cartID+","+productID+")";
		
		try {
			ptmt=conn.prepareStatement(sql);
			ptmt.executeUpdate();
			
			sql="select Count from cart where CartID="+cartID;
			ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			rs.next();
			int count=rs.getInt("Count");
			count++;
			
			sql="update cart set Count="+count+" where CartID="+cartID;
			ptmt=conn.prepareStatement(sql);
			ptmt.executeUpdate();
			
			ptmt.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
