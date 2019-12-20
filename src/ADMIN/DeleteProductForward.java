package ADMIN;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductDAO;
import DB.DBConnection;

/**
 * Servlet implementation class DeleteProductForward
 */
@WebServlet("/DeleteProductForward")
public class DeleteProductForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductForward() {
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
		
		int id=Integer.parseInt(request.getParameter("id"));
		boolean rs=ProductDAO.DeleteProduct(id, conn);
		if(rs)
		{
			RequestDispatcher rd=request.getRequestDispatcher("/ProductsForward");
			rd.forward(request, response);
		}
		else {
			
		}
	}

}
