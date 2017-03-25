<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'lookup.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <table border="1" align="center">
   <tr>
   	<th align="center">商品编号</th>
    <th align="center">商品名称</th>
    <th align="center">商品价格</th>
    <th align="center">库存</th>
   	</tr>
   <% 
   	String JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
   	String conntDB="jdbc:sqlserver://localhost:1433;databaseName=StudyJ2EE";
   	String user="User1";
   	String password="1203";
   	try{
   		Class.forName(JDriver);   		
   		}catch(Exception e){
   			e.printStackTrace();
   			}
   	  request.setCharacterEncoding("UTF-8");
      String n=request.getParameter("n");		
   	Connection conn=DriverManager.getConnection(conntDB, user, password); 
   	String sql="select * from Goods where Wname like ?+'%'";
   	PreparedStatement ps=conn.prepareStatement(sql);
   	ps.setString(1, n);
   	ResultSet rs=ps.executeQuery();
   	while(rs.next()){
   		out.println("<tr>");
 			out.println("<td>"+rs.getString(1)+"</td>");
 			out.println("<td>"+rs.getString(2)+"</td>");
 			out.println("<td>"+rs.getInt(3)+"</td>");
 			out.println("<td>"+rs.getInt(4)+"</td>");
 			out.println("<td><a href='buy.jsp?op=add&id="+rs.getString(1)+"'>加入购物车</a></td>");
 			out.println("</tr>");
   	}
   %>
   </table>
  </body>
</html>
