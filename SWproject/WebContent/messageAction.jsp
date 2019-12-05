<%@ page import="java.sql.*"%>
<%@ page import="beans.JavaBeans"%>
<jsp:useBean id="DB" class="beans.JavaBeans" scope="page" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enjoy SEOUL</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String receiver = request.getParameter("receiver");  // 받는 사람 
	String sender = (String)session.getAttribute("user_id");	// 보내는 사람 
	String content =  request.getParameter("review");		//쪽지 내용 
	String referer = request.getParameter("referer");
	Timestamp time = new Timestamp(System.currentTimeMillis());
	ResultSet rs=null;
    PreparedStatement pstmt = null;
	Connection conn = DriverManager.getConnection("jdbc:mysql://13.115.203.27:3306/sw?useUnicode=true&characterEncoding=UTF-8","swProject","swproject_moon");
	
	String SQL = "insert into message (receiver, sender, content, time) values (?,?,?,?)"; // 받는 사람, 보내는 사람, 쪽지내용, 시간 
	pstmt = conn.prepareStatement(SQL);
	pstmt.setString(1, receiver);
	pstmt.setString(2, sender);
	pstmt.setString(3, content);
	pstmt.setTimestamp(4, time);
	pstmt.executeUpdate();
	%>
<script>
alert("쪽지를 전송하였습니다. ");
location.href = "<%=referer%>"
</script>
</body>
</html>