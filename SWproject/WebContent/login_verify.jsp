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
      
      	//form���κ��� �Ѿ�� ��
      	String u_id=request.getParameter("user_id");
		String u_pwd=request.getParameter("user_pwd");
		
		//��񿡼� �˻��� ��
		String id="";
		String pwd="";
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from users where user_id='" +u_id+ "' and user_pwd='"+u_pwd + "' ";
		
		rs = DB.getResult(sql);
		
		
		while(rs.next())
		{//��񿡼� ������ id,pwd
			id=rs.getString("user_id");
			pwd=rs.getString("user_pwd");
		}
		
		
		//�Է¹��� id�� ��й�ȣ�� �����ͺ��̽����� id�� ���ٸ�
		if(id.equals(u_id) && pwd.equals(u_pwd))
		{
			//��������
			session.setAttribute("user_id",u_id);  
			session.setAttribute("user_pwd",u_pwd); 
			
			//����ڰ� �����ڶ�� ������ �������� �̵�
			if(u_id.equals("admin") && u_pwd.equals("admin"))
			{
				response.sendRedirect("addCourses.jsp");
			}
			else
			{
				response.sendRedirect("main.jsp");//main.js�������� �̵�
			}
			
			
		}
		else
		{
			response.sendRedirect("main.jsp");//main.js�������� �̵�
			//out.println("<script>");
			//out.println("alert('���̵�� ��й�ȣ�� Ȯ�����ּ���!')");
			//out.println("</script>");
		}
		
		
		
		
		%>
</body>
</html>