<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'settle.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<% 
	 String JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	 String connectDB="jdbc:sqlserver://localhost:1433;databaseName=StudyJ2EE";
	 String user="User1";
	 String password="1203";
	 Connection conn=null;
	 
		try{
			Class.forName(JDriver);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection(connectDB, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		Statement atmt=conn.createStatement();
		String sql="select sum(Wprice) from Cart ";
		ResultSet rs=atmt.executeQuery(sql);
%>

  </head>
  
  <body>
    <%
 		while(rs.next()){
 			int sum=rs.getInt(1);
 			out.println(sum);
 		}
 	 %>
  </body>
</html>
