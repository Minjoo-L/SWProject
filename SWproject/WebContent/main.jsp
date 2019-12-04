<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Festival Metro</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Add custom CSS here -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <link href="css/style.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
    </head>

    <body>
        <%@ include file="sidemenubar.jsp"%>

        <!-- Full Page Image Header Area -->
        <div id="top" class="header">
            <div class="vert-text parallax">
			
                <h1><span>F</span><span>e</span><span>s</span><span>t</span><span>i</span><span>v</span><span>a</span><span>l</span><span>&nbsp;</span><span>M</span><span>e</span><span>t</span><span>r</span><span>o</span></h1>
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
