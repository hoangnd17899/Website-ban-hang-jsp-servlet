package DB;

import java.sql.*;

public class DBConnection {
	public static Connection CreateConnection() {
		Connection conn=null;
		String url="jdbc:mysql://localhost:3306/webbanhang";
		String name="root";
		String pass="1234";
		
		//load driver
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		//create connection
		try {
			conn=DriverManager.getConnection(url, name, pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
				
	}
}
