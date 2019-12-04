<%@ page import="java.sql.*"%>
<jsp:useBean id="DB" class="beans.JavaBeans" scope="page"/>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
<%
      
      	String u_id=request.getParameter("user_id");
		String u_pwd=request.getParameter("user_pwd");
		
		String id="";
		String pwd="";
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from users where user_id='" +u_id+ "' and user_pwd='"+u_pwd + "' ";
		
		rs = DB.getResult(sql);
		
		
		while(rs.next())
		{
			id=rs.getString("user_id");
			pwd=rs.getString("user_pwd");
		}
		
		if(id.equals(u_id) && pwd.equals(u_pwd))
		{
			session.setAttribute("user_id",u_id);  
			session.setAttribute("user_pwd",u_pwd); 
			if(u_id.equals("admin") && u_pwd.equals("admin"))
				response.sendRedirect("main.jsp");
		}
		else
		{
			response.sendRedirect("main.jsp");
			out.println("<script>");
			out.println("alert('ID와 비밀번호를 확인해주세요 ')");
			out.println("</script>");
		}
		
		
		
		
		%>
</body>
</html>