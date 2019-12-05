<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Enjoy SEOUL</title>
</head>
<body>
	<%
	session.invalidate();
	response.sendRedirect("main.jsp");
	%>
	
</body>
</html>