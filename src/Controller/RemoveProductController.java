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

/**
 * Servlet implementation class RemoveProductController
 */
@WebServlet("/RemoveProductController")
public class RemoveProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productID=request.getParameter("id");
		Connection conn=DBConnection.CreateConnection();
		HttpSession session = request.getSession(false);
		Cart car=(Cart)session.getAttribute("cart");
		
		ProductDAO.removeProductFromCart(car.getCartID(),Integer.parseInt(productID), conn);
		int count=car.getCount();count--;
		car.setCount(count);
		session.removeAttribute("cart");
		session.setAttribute("cart",car);
		
		RequestDispatcher rd=request.getRequestDispatcher("/CartForward");
		rd.forward(request, response);
	}

}
