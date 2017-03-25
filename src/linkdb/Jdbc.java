package linkdb;
import java.sql.*;

public class Jdbc {
	public static Connection conn;
	public static Connection getCon(){
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=StudyJ2EE", "User1", "1203");
			return conn;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public static void CloseCon(){
		try{
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
