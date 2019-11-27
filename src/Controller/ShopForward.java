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

import BEAN.Product;
import DAO.ProductDAO;
import DB.DBConnection;

/**
 * Servlet implementation class ShopForward
 */
@WebServlet("/ShopForward")
public class ShopForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopForward() {
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
		Connection conn=DBConnection.CreateConnection();
		String cate=request.getParameter("category");
		List<Product> lstpro=null;
		String page=request.getParameter("page");
		if(page==null)
		{
			lstpro=ProductDAO.getProductByCategory(conn, cate,1);
			request.setAttribute("listaccount", lstpro);
			request.setAttribute("listcount", ProductDAO.getCountProducts(conn,cate));
			request.setAttribute("cate", cate);
			
			RequestDispatcher rd=request.getRequestDispatcher("Views/frontend/shop.jsp");
			rd.forward(request, response);
		}
		else {
			lstpro=ProductDAO.getProductByCategory(conn, cate,Integer.parseInt(page));
			request.setAttribute("listaccount", lstpro);
			request.setAttribute("listcount", ProductDAO.getCountProducts(conn,cate));
			request.setAttribute("cate", cate);
			
			RequestDispatcher rd=request.getRequestDispatcher("Views/frontend/shop.jsp");
			rd.forward(request, response);
		}	
	}

}
