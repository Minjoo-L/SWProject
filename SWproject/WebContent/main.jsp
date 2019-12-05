<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Enjoy SEOUL</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Add custom CSS here -->
        <link rel="stylesheet" href="css/opening.css">
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <%@ include file="sidemenubar.jsp"%>

        <!-- Full Page Image Header Area -->
        <div id="top" class="header">
            <div class="vert-text parallax">
			
                <h1><span>E</span><span>n</span><span>j</span><span>o</span><span>y</span><span>&nbsp;</span><span>S</span><span>E</span><span>O</span><span>U</span><span>L</span></h1>
                <br />
				<!--추가시작-->
				
				<%//세션에서 id와 nickname가져옴
				String session_id=(String)session.getAttribute("user_id");
				
				%>
				<% if(session_id!=null){%>
				<big><b><%=session_id %></b></big> 님 환영합니다.
				<br><a href="logout.jsp">로그아웃</a>
				<%} else {%>
				 <p>로그인을 해주세요.</p>
    			<a href="login.jsp">로그인</a>
    			<a href="join.jsp">회원가입</a>
    			<%}
    			%>
				<br><br>
             </div>
        </div>
        <!-- /Full Page Image Header Area -->
        <!-- JavaScript -->
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.parallax-1.1.3.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    </body>
</html>
