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
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>

		<!-- 추가한부분-->
		  <link rel="stylesheet" href="style1.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style>
     .box{
        position:absolute;
        top:0;left:0;bottom:0;right:0;
        height:10%;
        margin:15% auto;
        text-align:center;
    }
    .btn1{
  background-color: white;
  border: none;
  color: black;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 20px;
  border-radius:10px;
  width:30px;
  height:38px;
	}
	
		
    </style>
		<!--endofUI예진-->
    </head>

    <body>

        <!-- Side Menu -->
        <!--<a id="menu-toggle" href="#" class="btn btn-primary btn-lg toggle"><i class="fa fa-bars"></i></a>-->
        <div id="sidebar">
            <ul class="sidebar-nav">
                <!--<li>
                    <a id="menu-close" href="#" class="btn btn-default btn-lg pull-right toggle">
                        <i class="fa fa-times"></i>
                    </a>
                </li>-->
                <li class="sidebar-brand">
                    <a href="main.jsp">Festival Metro</a>
                    <hr>
                </li>
                <li>
                    <a href="index.jsp">Home</a>
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
                    <a href="message.jsp">쪽지보내기</a>
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
				<!--추가끝-->
                <!--<a href="#about" class="btn header-btn">Find Out More</a>-->
            </div>
        </div>
        <!-- /Full Page Image Header Area -->

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 text-center">
                        <ul class="list-inline">
                            <li>
                                <i class="fa fa-facebook"></i>
                            </li>
                            <li>
                                <i class="fa fa-twitter"></i>
                            </li>
                            <li>
                                <i class="fa fa-dribbble"></i>
                            </li>
                            <li>
                                <i class="fa fa-pinterest"></i>
                            </li>
                        </ul>
                        <hr>
                        <p>Copyright &copy; <a href="https://themewagon.com/">Themewagon</a>  2014</p>
                        <div class="top-scroll">
                            <a href="#top"><i class="fa fa-arrow-circle-up scroll"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- /Footer -->

        <!-- begin:booking -->
        <div class="modal fade" id="booking" tabindex="-1" role="dialog" aria-labelledby="booking" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Online Booking Form</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form">
                            <div class="form-group">
                                <label for="emailAddress">Email address</label>
                                <input id="emailAddress" type="email" class="form-control input-lg" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input id="password" type="password" class="form-control input-lg" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label for="country">Which country do you want to travel?</label>
                                <select class="form-control" id="country">
                                    <option>Australia</option>
                                    <option>Bangladesh</option>
                                    <option>England</option>
                                    <option>France</option>
                                    <option>U.S.A</option>
                                </select>
                            </div>
                            
                        </form>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn confirm-btn" value="Confirm">
                    </div>
                </div>
            </div>
        </div>
        <!-- end:booking -->

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
