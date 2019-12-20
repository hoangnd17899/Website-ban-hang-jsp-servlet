package ADMIN;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import BEAN.Product;
import DAO.ProductDAO;
import DB.DBConnection;

/**
 * Servlet implementation class InsertForward
 */
@WebServlet("/InsertForward")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 100MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class InsertForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd=request.getRequestDispatcher("Views/admin/insert.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String productName=request.getParameter("ProductName");
		String price=request.getParameter("Price");
		String screenSize=request.getParameter("ScreenSize");
		String weight=request.getParameter("Weight");
		String origin=request.getParameter("Origin");
		String description=request.getParameter("Description");
		int category=Integer.parseInt(request.getParameter("category"));
		
		Product pro =new Product();
		pro.setProductName(productName);
		pro.setPrice(Integer.parseInt(price));
		pro.setScreenSize(screenSize);
		pro.setWeight(weight);
		pro.setOrigin(origin);
		pro.setDescription(description);
		
		 try {
	  
	           // Đường dẫn tuyệt đối tới thư mục gốc của web app.
	           String appPath = request.getServletContext().getRealPath("");
	           appPath = appPath.replace('\\', '/');
	  
	            //Thư mục để save file tải lên.
	           String fullSavePath = null;
	           if (appPath.endsWith("/")) {
	               fullSavePath = appPath + "Contents/Image/Product";
	           } else {
	               fullSavePath = appPath + "/Contents/Image/Product";
	           }
	 
	  
	            //Tạo thư mục nếu nó không tồn tại.
	           File fileSaveDir = new File(fullSavePath);
	           if (!fileSaveDir.exists()) {
	               fileSaveDir.mkdir();
	           }
	  
	           // Danh mục các phần đã upload lên (Có thể là nhiều file).
	           for (Part part : request.getParts()) {
	               String fileName = extractFileName(part);
	                              
	               if (fileName != null && fileName.length() > 0) {
	            	   UUID uuid = UUID.randomUUID();
		               String randomUUIDString = uuid.toString();
		               fileName=randomUUIDString+"_"+fileName;
		               pro.setImage(fileName);
	            	   
	                   String filePath = fullSavePath + File.separator + fileName;
	                   System.out.println("Write attachment to file: " + filePath);
	                   
	                   Connection conn=DBConnection.CreateConnection();
	                   boolean rs=ProductDAO.InsertProduct(pro, conn,category);
	                   
	                   if(rs)
	                   {
	                	   // Ghi vào file.
		                   part.write(filePath);
		                   break;
	                   }
	                   else {
	                	   request.setAttribute("errorMessage", "Thêm mới không thành công !");
	        	           RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/InsertForwad");
	        	           dispatcher.forward(request, response);
	                   }
	               }
	           }
	  
	           // Upload thành công.
	           response.sendRedirect(request.getContextPath() + "/ProductsForward");
	       } catch (Exception e) {
	           e.printStackTrace();
	           request.setAttribute("errorMessage", "Error: " + e.getMessage());
	           RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/InsertForward");
	           dispatcher.forward(request, response);
	       }
	   }
	 
	   private String extractFileName(Part part) {
	       // form-data; name="file"; filename="C:\file1.zip"
	       // form-data; name="file"; filename="C:\Note\file2.zip"
	       String contentDisp = part.getHeader("content-disposition");
	       String[] items = contentDisp.split(";");
	       for (String s : items) {
	           if (s.trim().startsWith("filename")) {
	               // C:\file1.zip
	               // C:\Note\file2.zip
	               String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
	               clientFileName = clientFileName.replace("\\", "/");
	               int i = clientFileName.lastIndexOf('/');
	               // file1.zip
	               // file2.zip
	               return clientFileName.substring(i + 1);
	           }
	       }
	       return null;
	   }		
}
