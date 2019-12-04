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
      
      	//form�쇰�遺��� ���댁�� 媛� 
      	String u_id=request.getParameter("user_id");
		String u_pwd=request.getParameter("user_pwd");
		
		//��鍮����� 寃����� 媛� 
		String id="";
		String pwd="";
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from users where user_id='" +u_id+ "' and user_pwd='"+u_pwd + "' ";
		
		rs = DB.getResult(sql);
		
		
		while(rs.next())
		{// ��鍮����� 媛��몄�� id, pwd 
			id=rs.getString("user_id");
			pwd=rs.getString("user_pwd");
		}
		
		
		//���� 諛��� id�� 鍮�諛�踰��멸� �곗�댄�곕��댁�ㅻ�댁�� id�� 媛���
		if(id.equals(u_id) && pwd.equals(u_pwd))
		{
			//�몄����吏� 
			session.setAttribute("user_id",u_id);  
			session.setAttribute("user_pwd",u_pwd); 
			
			//�ъ�⑹��媛� 愿�由ъ���쇰㈃ 愿�由ъ�� ���댁�濡� �대�� 
			if(u_id.equals("admin") && u_pwd.equals("admin"))
			{
				response.sendRedirect("main.jsp");
			}
			else
			{
				response.sendRedirect("main.jsp");//main.jsp ���댁�濡� �대�� 
			}
			
			
		}
		else
		{
			response.sendRedirect("main.jsp");//main.js���댁�濡� �대�� 
			//out.println("<script>");
			//out.println("alert('���대���� 鍮�諛�踰��몃�� ���명�� 二쇱�몄��! ')");
			//out.println("</script>");
		}
		
		
		
		
		%>
</body>
</html>