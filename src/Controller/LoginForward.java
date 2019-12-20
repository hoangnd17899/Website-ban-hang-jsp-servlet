package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Cart;
import BEAN.Customer;
import BEAN.Product;
import DAO.AdminDAO;
import DAO.CustomerDAO;
import DAO.ProductDAO;
import DB.DBConnection;

/**
 * Servlet implementation class LoginForward
 */
@WebServlet("/LoginForward")
public class LoginForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd=request.getRequestDispatcher("Views/frontend/login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		Connection conn=DBConnection.CreateConnection();
		if(AdminDAO.Login(username, password, conn))
		{
			List<Product> allProduct = ProductDAO.getAllProduct(conn);
			request.setAttribute("allproduct",allProduct);
			RequestDispatcher rd=request.getRequestDispatcher("Views/admin/products.jsp");
			rd.forward(request, response);
		}
		else {
			Customer cus=CustomerDAO.Login(username, password, conn);
			if(cus!=null)
			{
				Cart car=CustomerDAO.getCartById(cus.getCustomerID(), conn);
				HttpSession session=request.getSession();  
		        session.setAttribute("user",cus);
		        session.setAttribute("cart",car);
				
				RequestDispatcher rd=request.getRequestDispatcher("Views/frontend/home.jsp");
				rd.forward(request, response);
			}
			else {
				request.setAttribute("message", "Tài khoản không tồn tại");
				
				RequestDispatcher rd=request.getRequestDispatcher("Views/frontend/login.jsp");
				rd.forward(request, response);
			}
		}	
	}
}
