package ADMIN;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Category;
import BEAN.Product;
import DAO.CategoryDAO;
import DAO.ProductDAO;
import DB.DBConnection;

/**
 * Servlet implementation class InsertCategory
 */
@WebServlet("/InsertCategory")
public class InsertCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd=request.getRequestDispatcher("Views/admin/insertcate.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String categoryName=request.getParameter("CategoryName");
		String adminID=request.getParameter("AdminID");
		
		
		Category cate =new Category();
		cate.setCategoryName(categoryName);
		cate.setAdminID(Integer.parseInt(adminID));
		
		Connection conn=DBConnection.CreateConnection();
        boolean rs=CategoryDAO.InsertCategory(cate, conn);
        
        if(rs)
        {
        	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CategoryForward");
	        dispatcher.forward(request, response);
        }
        else {
     	   	request.setAttribute("errorMessage", "Thêm mới không thành công !");
	        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/InsertForwad");
	        dispatcher.forward(request, response);
        }
	}
}
