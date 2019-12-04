<%@ page import="java.sql.*"%>
<jsp:useBean id="DB" class="beans.JavaBeans" scope="page"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	        <meta name="description" content="">
        <meta name="author" content="">

        <title>Festival Metro</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Add custom CSS here -->
        <link href="css/style.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
    <%@ include file = "sidemenubar.jsp" %>
        <!-- Intro -->
        <div id="about">
            <div class="light-wrapper">
                <div class="container inner">
					<br><br>
					<table width="100%">
						<tr>
							<td><p algn="left"><a href="main.jsp"><button type="button" class="btn1">before</button></a></p></td>
							
						</tr>
					</table>
					
					
                    <div class="row">
                        <div class="text-center">
                            <h2 class="main-title">Join</h2>
							<hr>
                        </div>		
	<div class="box">	
     <form action="join.jsp" method="post">
       
        아이디  &nbsp<input type="text" name="user_id"><br/>
        비밀번호  &nbsp<input type="password" name="user_pwd"><br/>
        닉네임  &nbsp<input type="text" name="user_nickname"><br/><br>
        <input type="submit" value="회원가입">
    
    </form>
   <%
   					//form으로부터 값 받아오기
					String user_id=request.getParameter("user_id");
					String user_pwd=request.getParameter("user_pwd");
					String user_nickname=request.getParameter("user_nickname");
					boolean value=false;
					
					Connection conn=null;
					Statement stmt=null;
					ResultSet rs=null;
					
					String sql="insert into users values ('"+user_id+"','"+user_pwd+"','"+user_nickname+"')";
					value=DB.excuteUpdateRB(sql);
					
					if(value)
						{
						response.sendRedirect("login.jsp");
						}
	%>				
	</div>	
                      </div>
                      <!-- /.row --> 
                      
                    </div>
                    <!-- /.container --> 
                  </div>
                  <!-- /.light-wrapper -->
                </div>
        <!-- /Intro -->
        <!-- JavaScript -->
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.parallax-1.1.3.js"></script>
</body>
</html>

