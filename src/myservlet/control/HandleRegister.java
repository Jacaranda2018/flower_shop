package myservlet.control;
import mybean.data.*;

import java.sql.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.qimo.util.DBUtil;

public class HandleRegister extends HttpServlet{
		public void init(ServletConfig config)throws ServletException{
			super.init(config);
			try {
				Class.forName("com.mysql.jdbc.Driver");
			}
			catch(Exception e){}
		}
		public String handleString(String s)
		{
			try{
			byte bb[]=s.getBytes("iso-8859-1");
			s=new String(bb);
			}
			catch(Exception ee){
				
			}
			return s;
		}
		public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
			Connection con;
			PreparedStatement sql;
			Register userBean=new Register();
	    
			request.setAttribute("userBean",userBean);
			String logname=request.getParameter("logname");
			String password=request.getParameter("password");
			String again_password=request.getParameter("again_password");
			String phone=request.getParameter("phone");
			String address=request.getParameter("address");
			String realname=request.getParameter("realname");
			 // if(logname==null)
				//  logname="";
			  //if(password==null)
				//  password="";
			  if(!password.equals(again_password)){
				  userBean.setBackNews("�������벻ͬ,ע��ʧ��");
				  RequestDispatcher dispatcher=request.getRequestDispatcher("inputRegisterMess.jsp");
				  dispatcher.forward(request,response);
				  return;
			  }
			  boolean isLD=true;
			  for(int i=0;i<logname.length();i++)
			  {
				  char c=logname.charAt(i);
				  if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0')))
					  isLD=false;
			  }
			  boolean boo=logname.length()>0&&password.length()>0&&isLD;
			  String backNews="";
			  try{
				  con=DBUtil.getConn();
				  String insertCondition="insert into user(logname,password,phone,address,realname) values(?,?,?,?,?)";
				  sql=con.prepareStatement(insertCondition);
				  if(boo)
				  {
				   sql.setString(1,handleString(logname));
				   sql.setString(2,handleString(password));
				   sql.setString(3,handleString(phone));
				   sql.setString(4,handleString(address));
				   sql.setString(5,handleString(realname));
				   backNews="ע��ɹ�";
			
				    int m=sql.executeUpdate();
				    response.setContentType("text/html;charset=GB2312");
				
						 PrintWriter out = response.getWriter();
						 out.print("<html>");
						 out.print("<head>");
					
						 out.print("</head>");
						 out.print("<body bgcolor=#FFFFFF>");
						 
						 out.print("<h2 align=center><font color=black align=center>"+backNews+"</font></h2>");
						
						 //out.print("<img src='image/4.jpg' width=1420 height=400px></img>");
						 out.print("<a href = login.jsp style='text-decoration : none;color:#000000'><h3 align=center>ǰ����¼</a>");
						 out.print("<a href = index.jsp style='text-decoration : none;color:#000000'><h3 align=center>������ҳ</a>");
					
						 out.print("</body></html>");
					
					
				
				   if(m!=0){
					   backNews="ע��ɹ�";
					   userBean.setBackNews(backNews);
					   userBean.setLogname(logname);
					   userBean.setPhone(handleString(phone));
					   userBean.setAddress(handleString(address));
					   userBean.setRealname(handleString(realname));
					   
					 //  RequestDispatcher dispatcher=request.getRequestDispatcher("inputRegisterMess.jsp");
					   
	                //   dispatcher.forward(request,response);
					  
	                   
				   }
				  }
				  else{
					  backNews="��Ϣ��д���������������зǷ��ַ�";
					  userBean.setBackNews(backNews);
				
			  }
			  con.close();
			  
		}
		catch(SQLException exp){
			backNews="�û�Ա�ѱ�ʹ��,������������"+exp;
			userBean.setBackNews(backNews);
			response.setContentType("text/html;charset=GB2312");
			try {
				 PrintWriter out = response.getWriter();
				 out.print("<html>");
				 out.print("<head>");
			
				 out.print("</head>");
				 out.print("<body bgcolor=#004B44>");
				 
				 out.print("<h2 align=center><font color=black align=center>"+backNews+"</font></h2>");
				
				 //out.print("<img src='image/4.jpg' width=1420 height=400px></img>");
				 out.print("<a href = index.jsp style='text-decoration : none;color:#FF5809'><h3 align=center>������ҳ</a>");
			
				 out.print("</body></html>");
			 }catch(IOException e) {}
			
		}
		//RequestDispatcher dispatcher=request.getRequestDispatcher("inputRegisterMess.jsp");

	   // dispatcher.forward(request,response);
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doPost(request,response);
	}
	}
