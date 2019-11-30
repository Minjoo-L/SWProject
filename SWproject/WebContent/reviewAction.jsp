<%@ page import="java.sql.*"%>
<%@ page import="beans.JavaBeans" %>
<jsp:useBean id="DB" class="beans.JavaBeans" scope="page"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스에 리뷰 등록 </title>
</head>
<body>
<%
	//place_details에서 보내온 변수 저장 
	ResultSet rs=null;
    PreparedStatement pstmt = null;
	//JavaBeans Review = new JavaBeans();
	Connection conn = DriverManager.getConnection("jdbc:mysql://13.115.203.27:3306/sw","swProject","swproject_moon");
	request.setCharacterEncoding("UTF-8");
	String content = request.getParameter("review");			//리뷰 내용
	String score = request.getParameter("sortMtd");
	//String id = request.getParameter("id");
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.println("id는"+id);
	Timestamp time = new Timestamp(System.currentTimeMillis());
	
	//System.out.println("Reg_date : " + Reg_date);
	
	//Review.saveReview(score, content, Reg_date);
	
	String sql = "insert into review_test values (?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "I'm user");
			pstmt.setString(2, score);
			pstmt.setString(3, content);
			pstmt.setTimestamp(4, time);
			pstmt.setInt(5, id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("안되나요되나");
		}
%>
<script>
	alert('저장되었습니다'); 
	location.href='place_details.jsp?id=<%=id%>';
</script>
</body>
</html>