package myservlet.control;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class HandleExit extends HttpServlet{
	  public void init(ServletConfig config) throws ServletException{
		  super.init(config);
	  }
public void doPost(HttpServletRequest request,HttpServletResponse response)	
		throws ServletException,  IOException{
	HttpSession session = request.getSession(true);
	session.invalidate();
	response.sendRedirect("index.jsp");	
	}
   public void doGet(HttpServletRequest request,HttpServletResponse response)
     throws ServletException,  IOException{
	   doPost(request,response);
	   
   }
	  
}