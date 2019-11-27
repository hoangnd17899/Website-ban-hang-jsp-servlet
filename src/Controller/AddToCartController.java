package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Cart;
import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/AddToCartController")
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AddToCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Connection conn=DBConnection.CreateConnection();
		
		if (session.getAttribute("user") != null) {
			Cart car=(Cart)session.getAttribute("cart");
			int count=car.getCount();count++;
			int cartID=car.getCartID();
			int productID=Integer.parseInt(request.getParameter("id"));
			car.setCount(count);
			session.removeAttribute("cart");
			session.setAttribute("cart",car);
			ProductDAO.AddToCart(cartID, productID, conn);
			
			RequestDispatcher rd=request.getRequestDispatcher("/CartForward");
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("Views/frontend/login.jsp");
			rd.forward(request, response);
		}			
	}
}
