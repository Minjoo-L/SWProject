<%@ page import="java.sql.*"%>
<%@ page import="beans.JavaBeans" %>
<jsp:useBean id="DB" class="beans.JavaBeans" scope="page"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스에 리뷰 삭제  </title>
</head>
<body>
<%
	//deleteReview에서 보내온 변수 저장 
	ResultSet rs=null;
	PreparedStatement pstmt = null;
	JavaBeans review = new JavaBeans();
	Connection conn = DriverManager.getConnection("jdbc:mysql://13.115.203.27:3306/sw","swProject","swproject_moon");
    request.setCharacterEncoding("UTF-8");
	String user_id = request.getParameter("user_id");
	String time = request.getParameter("time");
	//System.out.println("아이디는 무엇?" + user_id +" "+ posting_id);
	
	// 사용자 아이디와 시간으로 삭제 
	String sql = "delete from review_test where user_id=? and time = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, time);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
%>
<script>
	alert('삭제되었습니다.'); 
	location.href='deleteReview.jsp';
</script>
</body>
</html>