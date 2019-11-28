package beans;
import java.sql.*;

public class JavaBeans {
	
	private Connection conn = null;
	private Statement stmt = null;
	private String sql = null;
	private ResultSet rs= null;
 
	public JavaBeans() //�����ڿ��� db�� ����
	{
		try{
	   	       Class.forName("com.mysql.jdbc.Driver");
			   conn=DriverManager.getConnection("jdbc:mysql://13.115.203.27:3306/sw","user1","1234");
	   	       stmt = conn.createStatement();    
	        }
	       catch(Exception e)
		   {
	   	    System.out.println("DB ���� �����Դϴ�. : " + e.getMessage());
	       }
	}
	
	
	public ResultSet getResult(String sql) //sql���� �����Ͽ� Resultset�� ��ȯ
	{
		rs=null;	
		try{  
	   	       this.sql = sql;
	   	       rs = stmt.executeQuery(sql);
	   	       return rs;
	        }  
	    catch(Exception e)
	    { 	 
	      System.out.println("DB ���� �����Դϴ�. : " + e.getMessage());
     	  return rs;	    
		}	
	}
	
	public void excuteUpdate(String sql) //insert-db���� �����ͺ��̽��� �����͸� �����ϴ� �Լ�.
	{	
		try {
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			
			System.out.println("DB ���� �����Դϴ�. : " + e.getMessage());
		}
		
	}
	
}

