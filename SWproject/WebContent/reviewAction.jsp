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
	Connection conn = DriverManager.getConnection("jdbc:mysql://13.115.203.27:3306/sw","","");
	request.setCharacterEncoding("UTF-8");
	String content = request.getParameter("review");			//리뷰 내용
	String score = request.getParameter("sortMtd");
	String posting_title = request.getParameter("c_name");
	String user_id = request.getParameter("user_id");
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.println("id는"+id);
	System.out.println("user id는"+user_id);
	Timestamp time = new Timestamp(System.currentTimeMillis());

	//후기 작성했는지 확인 
	String SQL = "select * from review_test where user_id = ?";
	pstmt = conn.prepareStatement(SQL);
	pstmt.setString(1, user_id);
	rs = pstmt.executeQuery();
	if(rs.isBeforeFirst()){
		System.out.println("조회된데이 있 ");
		%>
	<script>
	alert('이미 후기를 작성한 글입니다.'); 
	location.href='place_details.jsp?id=<%=id%>';
	</script>
		<%
	}
	else{
	//후기 처음 작성하는 사람만 등록 
	//String sql = "insert into review_test (user_id,score,content,time,posting_id,posting_title) select ?,?,?,?,?,? from dual where not exists (select user_id from review_test where user_id=?)";
	String sql = "insert into review_test values (?,?,?,?,?,?)";
	try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, score);
			pstmt.setString(3, content);
			pstmt.setTimestamp(4, time);
			pstmt.setInt(5, id);
			pstmt.setString(6, posting_title);
			//pstmt.setString(7, user_id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
%>
<script>
	alert('저장되었습니다'); 
	location.href='place_details.jsp?id=<%=id%>';
</script>
<%} %>
</body>
</html>