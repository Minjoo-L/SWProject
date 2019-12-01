<%@ page import="java.sql.*"%>
<jsp:useBean id="DB" class="beans.JavaBeans" scope="page"/>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Festival Metro</title>
</head>
<body>
<%
		Boolean value;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
	    request.setCharacterEncoding("UTF-8");
		String c_name = request.getParameter("c_name");
		System.out.println(c_name);
		// 사용자 아이디와 게시글 번호로 삭제 
		String sql = "delete from courses where c_name='"+c_name+"'";
			try {
				DB.excuteUpdate(sql);
			}catch(Exception e) {
				e.printStackTrace();
			}
%>
		
<script>
	alert('삭제되었습니다.'); 
	location.href='deleteCourses.jsp';
</script>
</body>
</html>