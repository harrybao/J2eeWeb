<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goods.jsp' starting page</title>
    
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
  <h2>商品浏览</h2><hr>
   <%!
    	public static final  String JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		public static final  String connectDB="jdbc:sqlserver://localhost:1433;databaseName=StudyJ2EE";
		public static final  String user="User1";
		public static final  String password="1203";
		public static final int Pagesize=5;
		int pageCount;
		int curPage=1;
     %>
          		 	<table border="1" align="center">
   			<tr>
   			<td align="center" width="100">商品编号</td>
 			<td align="center" width="100">商品名称</td>
 			<td align="center" width="100">商品价格</td>
 			<td align="center" width="100">操作</td>
   			</tr>
     <%
     
     	try{
     		Class.forName(JDriver);
     		Connection conn=DriverManager.getConnection(connectDB, user, password);
     		String sql="select * from Goods";
     		PreparedStatement ps=conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
     		ResultSet rs=ps.executeQuery();
     		rs.last();
     		int size=rs.getRow();
     		pageCount=(size%Pagesize==0)?(size/Pagesize):(size/Pagesize+1);
     		String tmp=request.getParameter("curPage");
     		if(tmp==null){
     			tmp="1";
     			}
     			curPage=Integer.parseInt(tmp);
     			if(curPage>=pageCount) curPage=pageCount;
     			boolean flag=rs.absolute((curPage-1)*Pagesize+1);
     			int count=0;   			 
     				do{
     					if(count>=Pagesize)break;
     					String bm=rs.getString(1);
     					String en=rs.getString(2);
     					int ep=rs.getInt(3);
     					count++;
     		 %>

      <tr>
      	<td width="100"><%=bm %></td>
      	<td width="100"><%=en %></td>
      	<td width="100"><%=ep %></td>
      	<td width="100"><a href="buy.jsp?op=add&id=<%=bm %>">加入购物车</a></td>
      </tr>
      <% 
      	}while(rs.next());
      }catch(Exception e){
      	e.printStackTrace();
      	}
      %>
      <tr>
             <td colspan="6" align="center">
      <%
   		 	 if(curPage==1){
   		 	  %>
   		 	  共<%=pageCount %>页
   		 	  当前第<%=curPage %>页
   		 	 首页
   		 	 上一页
   		 	 <a href="goods.jsp?curPage=<%=curPage+1 %>">下一页</a>
   		 	 <a href="goods.jsp?curPage=<%=curPage+1 %>">尾页</a>
   		 	 <%
   		 	 	}else if(curPage==pageCount){
   		 	  %>
   		 	  共<%=pageCount %>页
   		 	  当前第<%=curPage %>页
   		 	 <a href="goods.jsp?curPage=1">首页</a>
   		 	 <a href="goods.jsp?curPage=<%=curPage-1 %>">上一页</a>
   		 	 下一页
   		 	 尾页
   		 	 <%
   		 	 	}else{
   		 	  %>
   		 	  共<%=pageCount %>页
   		 	  当前第<%=curPage %>页
   		 	 <a href="goods.jsp?curPage=1">首页</a>
   		 	  <a href="goods.jsp?curPage=<%=curPage-1 %>">上一页</a>
   		 	    <a href="goods.jsp?curPage=<%=curPage+1 %>">下一页</a>
   		 	      <a href="goods.jsp?curPage=<%=pageCount%>">尾页</a>
   		 	      <%
   		 	      }
   		 	       %>
      </td>
      </tr>  
        <tr>
   		 	  <td  colspan="6" align="center">
   		 	  <form name="user" action="lookup.jsp" > 
					<input type="text" name="n" /><input type="submit" value="查找"/>
   			  </form>
   		 	  </td>
   		 	  </tr>
   		 	  <tr>
   		 	  <td  colspan="6" align="center">
   		 	  <a href="cart.jsp">查看购物车</a>    
	          <a href="buy.jsp?op=clear">清空购物车</a>
   		 	  </td>
   		 	  </tr>   
      </table>
   
  </body>
</html>
