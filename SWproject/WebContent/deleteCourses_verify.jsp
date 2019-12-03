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
		
		int count=0;
		ResultSet rs=null;
	    request.setCharacterEncoding("UTF-8");
		String c_name = request.getParameter("c_name");
		System.out.println(c_name);
		// 사용자 아이디와 게시글 번호로 삭제 
		String sql1 = "select count(*) from courses";
		try{
			rs=DB.getResult(sql1);
			while(rs.next()){
				count=rs.getInt(1);
			}
			if(count<=5){
				out.println("<script>alert('삭제할 수 없습니다.(코스가 최소 5개는 존재해야 됩니다.)');");
				out.println("location.href='deleteCourses.jsp';</script>");	
			}
			else{
				String sql2="select id from courses where c_name='"+c_name+"'";
				String id=null;
				try{
					rs=DB.getResult(sql2);
					while(rs.next()){
						id=rs.getString(1);
						System.out.println("ID : "+id);
					}
					String sql3 = "delete from courses where c_name='"+c_name+"'";
					try {
						DB.excuteUpdate(sql3);
						String sql4="update courses set id=id-1 where id>"+id;
						try{
							DB.excuteUpdate(sql4);
							out.println("<script>alert('코스가 삭제되었습니다.');");
							out.println("location.href='deleteCourses.jsp';</script>");	
						}
						catch(Exception e){ e.printStackTrace(); }				
					}catch(Exception e) {
						e.printStackTrace();
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
%>
</body>
</html>