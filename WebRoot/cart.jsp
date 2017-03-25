<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
		String sql="select Wname,Wprice,con=count(Wname) from Cart group by Wname,Wprice";
		ResultSet rs=atmt.executeQuery(sql);
%>
  </head>
  
  <body>
 <h2>我的购物车</h2><br>
 <a href="index.jsp">首页</a>//<a href="goods.jsp">继续选择商品</a><hr>
 <table border="1" width="600" align="center">
 	<tr bgcolor="#dddddd">
 	<td align="center" width="100">商品名称</td>
 	<td align="center" width="100">商品价格</td>
 	<td align="center" width="100">数量</td>
 	<td align="center" width="100">金额</td>
 	<td align="center" width="100">编辑</td>
 	</tr>
 	<%
 		while(rs.next()){
 			out.println("<tr>");
 			out.println("<td>"+rs.getString("Wname")+"</td>");
 			out.println("<td>"+rs.getInt("Wprice")+"</td>");
 			out.println("<td>"+rs.getInt("con")+"</td>");
 			out.println("<td>"+(rs.getInt("Wprice")*rs.getInt("con"))+"</td>");
 			out.println("<td><a href='buy.jsp?op=del&id="+rs.getString("Wname")+"'>退回商品架</a></td>");
 			out.println("</tr>");			
 		}
 		 sql="select sum(Wprice) from Cart ";
		 rs=atmt.executeQuery(sql);
		 while(rs.next()){
 			int sum=rs.getInt(1);
 			out.println("<tr>");
 			out.println("<td colspan='6' align='center'>总价为"+sum+"￥</td>");
 			out.println("</tr>");
 		}
 		atmt.close();
		conn.close();
 	 %>
 	  <tr>
   		 	  <td  colspan="6" align="center">
   		 	  <form name="settle" action="settle.jsp" > 
			 <input type="submit" value="结算"/>
   			  </form>
   		 	 </td>
   	  </tr>
 	</table>
 	<hr>
</body>
</html>
