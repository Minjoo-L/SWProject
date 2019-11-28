package beans;
import java.sql.*;

public class JavaBeans {
	
	private Connection conn = null;
	private Statement stmt = null;
	private String sql = null;
	private ResultSet rs= null;
 
	public JavaBeans() //생성자에서 db와 연동
	{
		try{
	   	       Class.forName("com.mysql.jdbc.Driver");
			   conn=DriverManager.getConnection("jdbc:mysql://13.115.203.27:3306/sw","user1","1234");
	   	       stmt = conn.createStatement();    
	        }
	       catch(Exception e)
		   {
	   	    System.out.println("DB 연동 오류입니다. : " + e.getMessage());
	       }
	}
	
	
	public ResultSet getResult(String sql) //sql문을 싱행하여 Resultset을 반환
	{
		rs=null;	
		try{  
	   	       this.sql = sql;
	   	       rs = stmt.executeQuery(sql);
	   	       return rs;
	        }  
	    catch(Exception e)
	    { 	 
	      System.out.println("DB 연동 오류입니다. : " + e.getMessage());
     	  return rs;	    
		}	
	}
	
	public void excuteUpdate(String sql) //insert-db에서 데이터베이스에 데이터를 삽입하는 함수.
	{	
		try {
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			
			System.out.println("DB 연동 오류입니다. : " + e.getMessage());
		}
		
	}
	
}

