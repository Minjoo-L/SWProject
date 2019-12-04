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
        <link href="css/style.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
    </head>

    <body>

        <!-- Side Menu -->
        <div id="sidebar">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="main.jsp">Festival Metro</a>
                    <hr>
                </li>
                <li>
                    <a href="main.jsp">Home</a>
                </li>
                <li>
                    <a href="line.jsp">호선별 즐길거리</a>
                </li>
                <li>
                    <a href="theme.jsp">테마별 즐길거리</a>
                </li>
                <li>
                    <a href="course.jsp">추천 코스</a>
                </li>
                <li>
                    <a href="contact.jsp">Contact</a>
                </li>
            </ul>
        </div>
        <!-- /Side Menu -->

        <!-- Full Page Image Header Area -->
        <div id="top" class="header">
            <div class="vert-text parallax">
			
                <h1 class="header-text">Festival Metro</h1>
                <h3 class="header-text">
                    <em class="header-text">So we are here to guide your metro travel</em>
                </h3><br />
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

        <!-- Custom JavaScript for the Side Menu and Smooth Scrolling -->
        <script>
        $("#menu-close").click(function(e) {
            e.preventDefault();
            $("#sidebar-wrapper").toggleClass("active");
        });
        </script>
        <script>
        $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#sidebar-wrapper").toggleClass("active");
        });
        </script>
        <script>
        $(function() {
            $('a[href*=#]:not([href=#])').click(function() {
                if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

                    var target = $(this.hash);
                    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                    if (target.length) {
                        $('html,body').animate({
                            scrollTop: target.offset().top
                        }, 1000);
                        return false;
                    }
                }
            });
        });
        </script>

        <!-- modal -->

        <script>

            $('.modal').on('shown.bs.modal', function () {
                var curModal = this;
                $('.modal').each(function(){
                    if(this != curModal){
                        $(this).modal('hide');
                    }
                });
            });

        </script>

    </body>
</html>
