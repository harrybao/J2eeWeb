<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'buy.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  	<% 
	 String JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	 String connectDB="jdbc:sqlserver://localhost:1433;databaseName=StudyJ2EE";
	 String user="User1";
	 String password="1203";
	 Connection conn=null;
	 request.setCharacterEncoding("UTF-8");
		try{
			Class.forName(JDriver);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection(connectDB, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql=null;
		String op=request.getParameter("op");
		if(op.equals("add")){
			String bm=request.getParameter("id");
			String name=null,price=null;
			sql="select* from Goods where Wreaid=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,bm);
			System.out.println(bm);
			rs=ps.executeQuery();
			if(rs.next()){
				name=rs.getString("Wname");
				price=rs.getString("Wprice");
			}

			sql="insert into Cart(Wname,Wprice) values(?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, price);
			ps.executeUpdate();
			ps.close();
			conn.close();
			response.sendRedirect("cart.jsp");
		}
		if(op.equals("del")){
			String id=request.getParameter("id");
			sql="delete from Cart where Wname=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
			ps.close();
			conn.close();
			response.sendRedirect("cart.jsp");
			}
			if(op.equals("clear")){
				sql="delete from Cart";
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();
				conn.close();
				response.sendRedirect("cart.jsp");
				}
%>
</html>
