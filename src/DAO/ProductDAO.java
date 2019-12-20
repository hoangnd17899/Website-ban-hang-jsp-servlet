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
	
	public static List<Product> getAllProduct(Connection conn)
	{
		List<Product> lstacc=new ArrayList<Product>();
		PreparedStatement ptmt=null;
		
		String sql="select * from product";
		
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
	
	public static void removeProductFromCart(int cartID, int productID,Connection conn)
	{
		PreparedStatement ptmt=null;
		
		String sql="delete from cart_product where CartID="+cartID+" and ProductID="+productID;
		
		try {
			ptmt=conn.prepareStatement(sql);
			ptmt.executeUpdate();
			
			sql="select Count from cart where CartID="+cartID;
			ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			rs.next();
			int count=rs.getInt("Count");
			count--;
			
			sql="update cart set Count="+count+" where CartID="+cartID;
			ptmt=conn.prepareStatement(sql);
			ptmt.executeUpdate();
			
			ptmt.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static boolean InsertProduct(Product pro,Connection conn,int cate)
	{
		PreparedStatement ptmt=null;
		
		String sql="insert into product(ProductName,Price,ScreenSize,Weight,Origin,Image,Description) "
				+ "values(?,?,?,?,?,?,?)";
		try {
			ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, pro.getProductName());
			ptmt.setInt(2, pro.getPrice());
			ptmt.setString(3, pro.getScreenSize());
			ptmt.setString(4, pro.getWeight());
			ptmt.setString(5, pro.getOrigin());
			ptmt.setString(6, pro.getImage());
			ptmt.setString(7, pro.getDescription());
			
			int ra=ptmt.executeUpdate();
			if(ra==0) {
				return false;
			}
			
			sql="SELECT LAST_INSERT_ID() as ProductID";
			ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			rs.next();
			int productID=rs.getInt("ProductID");
			
			sql="insert into product_category(ProductID,CategoryID) values("+productID+","+cate+")";
			ptmt=conn.prepareStatement(sql);
			ptmt.executeUpdate(sql);
			
			return true;
		} 
		catch (SQLException e) {
			return false;
		}
	}
	
	public static boolean DeleteProduct(int id, Connection conn)
	{
		PreparedStatement ptmt=null;
		
		String sql="delete from product where ProductID="+id;
		try {
			ptmt=conn.prepareStatement(sql);
			int rs=ptmt.executeUpdate();
			if(rs==0) return false;
			
			sql="delete from product_category where ProductID="+id;
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
	
	public static boolean UpdateProduct(Product pro,Connection conn)
	{
		PreparedStatement ptmt=null;
		
		String sql="update product set ProductName=?, Price=?,ScreenSize=?,Weight=?,Origin=?,Image=?,Description=? where ProductID=?";
		try {
			ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, pro.getProductName());
			ptmt.setInt(2, pro.getPrice());
			ptmt.setString(3, pro.getScreenSize());
			ptmt.setString(4, pro.getWeight());
			ptmt.setString(5, pro.getOrigin());
			ptmt.setString(6, pro.getImage());
			ptmt.setString(7, pro.getDescription());
			ptmt.setInt(8, pro.getProductID());
			
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
}
