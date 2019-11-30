<%@ page import="java.sql.*"%>
<jsp:useBean id="DB" class="beans.JavaBeans" scope="page"/>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
		Connection conn=null;
		ResultSet rs=null;
		
		
		String gname=request.getParameter("course_name");
		System.out.println(gname);
		String gtheme=request.getParameter("course_theme");
		System.out.println(gtheme);
		String fp1=request.getParameter("fp");
		System.out.println(fp1);
		String fp2=request.getParameter("sp");
		System.out.println(fp2);
		String fp3=request.getParameter("tp");
		System.out.println(fp3);
		String fp4=request.getParameter("fop");
		System.out.println(fp4);
		String aNull=null;
		Boolean value;
		
		String sqlI="insert into courses values ('"+gname+"','"+gtheme+"','"+fp1+"','"+fp2+"','"+fp3+"','"+fp4+"')";
		value = DB.excuteUpdateRB(sqlI);
		
		if(value)
		{
			//out.println("<script>");
			//out.println("alert('코스가 성공적으로 추가되었습니다')");
			//out.println("</script>");
			response.sendRedirect("addCourses.jsp");
		}

		%>
		

</body>
</html>