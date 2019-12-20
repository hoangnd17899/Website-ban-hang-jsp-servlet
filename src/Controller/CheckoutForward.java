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
import BEAN.Order;
import BEAN.Product;
import DAO.CartDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/CheckoutForward")
public class CheckoutForward extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CheckoutForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=DBConnection.CreateConnection();
		HttpSession session = request.getSession(false);
		if (session.getAttribute("user") != null) {
			Cart car=(Cart)session.getAttribute("cart");
			List<Product> productsInCart = ProductDAO.getProductByCartId(conn, car.getCartID());
			
			if(car.getCount()==0) {
				request.setAttribute("message", "Hiện tại giỏ hàng rỗng, không thể thanh toán !");
				
				RequestDispatcher rd=request.getRequestDispatcher("Views/frontend/cart.jsp");
				rd.forward(request, response);
			}
			
			int total=0;
			for (Product product : productsInCart) {
				total+=product.getPrice();
			}
			request.setAttribute("total", total);
			
			RequestDispatcher rd=request.getRequestDispatcher("Views/frontend/checkout.jsp");
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("Views/frontend/login.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=DBConnection.CreateConnection();
		HttpSession session = request.getSession(false);
		Customer cus=(Customer)session.getAttribute("user");
		Cart car=(Cart)session.getAttribute("cart");
		
		request.setCharacterEncoding("UTF-8");
		String fullName=request.getParameter("fullName");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String country=request.getParameter("country");
		String city=request.getParameter("city");
		String zipCode=request.getParameter("zipCode");
		String total=request.getParameter("total");
		String paymentMethod=request.getParameter("paymentMethod");
		
		
		Order ord=new Order();
		ord.setFullName(fullName);
		ord.setPhone(phone);
		ord.setEmail(email);
		ord.setAddress(address);
		ord.setCountry(country);
		ord.setCity(city);
		ord.setZipCode(zipCode);
		ord.setTotal(Integer.parseInt(total));
		ord.setCustomerID(cus.getCustomerID());
		ord.setPaymentMethod(paymentMethod);
		
		boolean rs=OrderDAO.InsertOrder(conn, ord);
		if(rs)
		{
			CartDAO.CleanCart(car.getCartID(), conn);
			car.setCount(0);
			session.removeAttribute("cart");
			session.setAttribute("cart",car);
			
			RequestDispatcher rd=request.getRequestDispatcher("Views/frontend/checkoutsuccess.jsp");
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("Views/frontend/checkout.jsp");
			rd.forward(request, response);
		}
	}

}
