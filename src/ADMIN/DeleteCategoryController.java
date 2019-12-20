package ADMIN;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import DB.DBConnection;

/**
 * Servlet implementation class DeleteCategoryController
 */
@WebServlet("/DeleteCategoryController")
public class DeleteCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCategoryController() {
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
		boolean rs=CategoryDAO.DeleteCategory(id, conn);
		if(rs)
		{
			RequestDispatcher rd=request.getRequestDispatcher("/CategoryForward");
			rd.forward(request, response);
		}
		else {
			
		}
	}

}
