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
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>

		<!-- 추가한부분-->
		  <link rel="stylesheet" href="style1.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
input[type="submit"]{
  background-color: #28B4B4;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius:10px;
  width:260px;
  height:38px;
}

    .box{
        position:center;
        top:0;left:0;bottom:0;right:0;
        height:10%;
        margin:15% auto;
        text-align:center;
    }
    input[type="text"]{
            border:none;
            border-bottom:2px solid #0A9696;
        }
    input[type="password"]{
            border:none;
            border-bottom:2px solid #0A9696;
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
</head>
<body>
	 <!-- Side Menu -->
        <a id="menu-toggle" href="#" class="btn btn-primary btn-lg toggle"><i class="fa fa-bars"></i></a>
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li>
                    <a id="menu-close" href="#" class="btn btn-default btn-lg pull-right toggle">
                        <i class="fa fa-times"></i>
                    </a>
                </li>
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
                    <a href="message.jsp">쪽지보내기</a>
                </li>
                <li>
                    <a href="contact.jsp">Contact</a>
                </li>
            </ul>
        </div>
        <!-- /Side Menu -->

        <!-- Intro -->
        <div id="about">
            <div class="light-wrapper">
                <div class="container inner">
					<br><br>
					<table width="100%">
						<tr>
							<td><p algn="left"><a href="/"><button type="button" class="btn1">before</button></a></p></td>
							
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
	////////////////////////////////////////////////////////////////////////////////////////////
   
</body>
</html>
<!--
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="style1.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
    input[type="text"]{
            border:none;
            border-bottom:2px solid #D1C4E9;
        }
    input[type="password"]{
            border:none;
            border-bottom:2px solid #D1C4E9;
    }
input[type="submit"]{
  background-color: #D1C4E9;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius:10px;
  width:260px;
  height:38px;
}
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
</head>
<body>
    <form action="/join" method="post">
        <div class="box">
        <h1><font size="10" color="#673AB7">Join Page</font></h1><br>
        아이디  &nbsp<input type="text" name="user_id"><br/>
        비밀번호  &nbsp<input type="password" name="user_pwd"><br/>
        닉네임  &nbsp<input type="text" name="user_nickname"><br/><br>
        <input type="submit" value="회원가입">
    </div>
    </form>
</body>
</html>-->
