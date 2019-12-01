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
      
      	//form으로부터 넘어온 값
      	String u_id=request.getParameter("user_id");
		String u_pwd=request.getParameter("user_pwd");
		
		//디비에서 검색한 값
		String id="";
		String pwd="";
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from users where user_id='" +u_id+ "' and user_pwd='"+u_pwd + "' ";
		
		rs = DB.getResult(sql);
		
		
		while(rs.next())
		{//디비에서 가져온 id,pwd
			id=rs.getString("user_id");
			pwd=rs.getString("user_pwd");
		}
		
		
		//입력받은 id와 비밀번호가 데이터베이스내의 id와 같다면
		if(id.equals(u_id) && pwd.equals(u_pwd))
		{
			//세션유지
			session.setAttribute("user_id",u_id);  
			session.setAttribute("user_pwd",u_pwd); 
			
			//사용자가 관리자라면 관리자 페이지로 이동
			if(u_id.equals("admin") && u_pwd.equals("admin"))
			{
				response.sendRedirect("addCourses.jsp");
			}
			else
			{
				response.sendRedirect("main.jsp");//main.js페이지로 이동
			}
			
			
		}
		else
		{
			response.sendRedirect("main.jsp");//main.js페이지로 이동
			//out.println("<script>");
			//out.println("alert('아이디와 비밀번호를 확인해주세요!')");
			//out.println("</script>");
		}
		%>
</body>
</html>