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
		Boolean isExist=false;
		
		String gname=request.getParameter("course_name");
		String gtheme=request.getParameter("course_theme");
		String fp1=request.getParameter("fp");
		String fp2=request.getParameter("sp");
		String fp3=request.getParameter("tp");
		String fp4=request.getParameter("fop");
		int count=0;
		
		String sql1="select * from courses";
		rs=DB.getResult(sql1);
		
		while(rs.next()){
			String test_fp1=rs.getString(3);
			String test_fp2=rs.getString(4);
			String test_fp3=rs.getString(5);
			String test_fp4=rs.getString(6);
			System.out.println("DB : "+test_fp1+"() , WEB : "+fp1+"()");
			System.out.println("DB : "+test_fp2+"() , WEB : "+fp2+"()");
			System.out.println("DB : "+test_fp3+"() , WEB : "+fp3+"()");
			System.out.println("DB : "+test_fp4+"() , WEB : "+fp4+"()");
			if(test_fp1.equals(fp1) && test_fp2.equals(fp2) && test_fp3.equals(fp3) && test_fp4.equals(fp4))
			{
				isExist=true;
				break;
			}
		}
		
		if(isExist){
			out.println("<script>alert('이미 존재하는 내용의 코스입니다.');");
			out.println("location.href='addCourses.jsp';</script>");
		}
		else{
			String sql2="select max(id) as count from courses";
			rs=DB.getResult(sql2);
			while(rs.next()){
				count=rs.getInt("count");
				count=count+1;
			}
			String sqlI="insert into courses values ('"+gname+"','"+gtheme+"','"+fp1+"','"+fp2+"','"+fp3+"','"+fp4+"','"+count+"')";
			
			try{
				DB.excuteUpdate(sqlI);	
				out.println("<script>alert('코스가 추가되었습니다.');");
				out.println("location.href='addCourses.jsp';</script>");
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		%>
<script>
	alert('코스가 추가되었습니다.');
	location.href='addCourses.jsp';
</script>	

</body>
</html>