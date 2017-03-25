package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Login extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException{
		
	doPost(request,response);
		
	}
public void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws IOException{
		response.setContentType("text/html;charset=gbk");
		PrintWriter out = response.getWriter();
		String piccode = (String) request.getSession().getAttribute("piccode");
		String uid = request.getParameter("username");
		String pwd = request.getParameter("password");
		String checkcode = request.getParameter("checkcode");
		checkcode = checkcode.toUpperCase();
		String JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
	  	String connectDB="jdbc:sqlserver://localhost:1433;databaseName=StudyJ2EE";	  	
	  	try {
				Class.forName(JDriver);
			} catch (ClassNotFoundException e1) {
				e1.printStackTrace();
			}
	  	 if(checkcode.equals(piccode)){
	  		try{
	  			String user="User1";
	  			String password="1203";
	  			Connection con=DriverManager.getConnection(connectDB,user,password);
	  			PreparedStatement ps=con.prepareStatement("select * from Users where Userid=? and Uspwd=?");
	  			ps.setString(1,uid);
	  			ps.setString(2,pwd);
	  			ResultSet rs=ps.executeQuery();
	    		if(rs.next()){			
	    						try {
	    						request.getRequestDispatcher("../goods.jsp").forward(request,response);
	    						} catch (ServletException e) {
	    						e.printStackTrace();			
	    						}
	    					}else{
	    						out.println("您输入的账户或密码不正确！");
	    						}	
	    		rs.close();
	  			con.close();
	  		}catch(SQLException e){
	  			e.printStackTrace();
	  			System.exit(0);
	  			}
	  		}else{
				out.println("验证码输入错误！！！");
			}
		out.flush();
		out.close();
		
	}


}
