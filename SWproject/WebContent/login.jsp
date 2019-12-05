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
</head>
<body>
    <%@ include file = "sidemenubar.jsp" %>
        <!-- Intro -->
         <section class="page-title bg-2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
					 <h1 class="main-title">로그인</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
        <div id="about">
            <div class="light-wrapper">
                <div class="container inner">
                    <div class="row">		
	<div class="box">
	
     <form action="login_verify.jsp" method="post">
        아이디  &nbsp<input type="text" name="user_id"><br/>
        비밀번호  &nbsp<input type="password" name="user_pwd"><br/>
        <br><br>
        <input type="submit" value="로그인">
      </form>		
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