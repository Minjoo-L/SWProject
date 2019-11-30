<%@ page import="java.sql.*"%>
<jsp:useBean id="DB" class="beans.JavaBeans" scope="page"/>
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
		
<style>
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
		.btn2{
  background-color: white;
  border: none;
  color: black;
  font-size: 20px;
  height:38px;
	}
	A:link {text-decoration:none; color:white;}
   	A:visited {text-decoration: none; color:white;}
    A:active {text-decoration: none; color:white;}
    A:hover {text-decoration: none; color:white;}
</style>
    </head>

    <body>
        <%
        String user_id = (String)session.getAttribute("user_id");  // 현재 로그인한 사용자 아이디 가져오기 
        System.out.println("유저 아이디" + user_id);
       
    
%>

    <!-- Side Menu -->
    <a id="menu-toggle" href="#" class="btn btn-primary btn-lg toggle"><i class="fa fa-bars"></i></a>
    
    <div id="sidebar">
    
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
            <% if("admin".equals(user_id) && user_id != null){
                System.out.println(user_id); %>
            <li>
                <a href="addCourses.jsp">코스 추가 </a>
            </li>
            <li>
                <a href="deleteReview.jsp">후기 삭제  </a>
            </li>
            <%
            }else{
            %>
            <li>
                <a href="contact.jsp">Contact</a>
            </li>
            <%} %>
        </ul>

    </div>
    <!-- /Side Menu -->
        <!-- Portfolio -->
        <div id="places" class="places">
            <div class="container">
				<table width="100%">
						<tr>
							<td><p algn="left"><a href="/"><button type="button" class="btn1">before</button></a></p></td>
							<td><p align="right"><a href="/theme"><button type="button" class="btn1">next</button></a></p></td>
						</tr>
					</table>
                <div class="row">
                    <div class="col-md-4 col-md-offset-4 text-center">
                        <h2 class="main-title">호선별 즐길거리</h2>
                        <hr>
                    </div>
                </div>
            </div>  
            <div class="divide50"></div>  
            <div class="container">
				<table width = "100%">
					<tr>
						<td><button type="button" class="btn2">#1호선</button></td>
						<td><button type="button" class="btn2">#2호선</button></td>
						<td><button type="button" class="btn2">#3호선</button></td>
						<td><button type="button" class="btn2">#4호선</button></td>
						<td><button type="button" class="btn2">#5호선</button></td>
						<td><button type="button" class="btn2">#6호선</button></td>
						<td><button type="button" class="btn2">#7호선</button></td>
						<td><button type="button" class="btn2">#8호선</button></td>
						<td><button type="button" class="btn2">#9호선</button></td>
					</tr>
				</table>
				
				<div class="row">
				<%
					int id, ref=0;
					String name="", station="", img="";
					Connection conn=null;
					Statement stmt=null;
					ResultSet rs=null;
					
					String sql="select * from attraction";
					rs=DB.getResult(sql);
					if(rs==null){
						out.println("DB연동 오류");
					}
					while(rs.next()){
						name=rs.getString("name");
						station=rs.getString("station");
						img=rs.getString("img");
					%>
					<!-- DB에서 불러오기 -->
					<div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="grid center-block">
                            <figure class="effect-zoe">
                                <img src="<%=img %> " class="img-responsive center-block" width="800px" height="400px">
                                <figcaption>
                                    <h2><%=name %> </h2>
                                    <p class="icon-links">
                                        <a href="#"><i class="fa fa-heart-o"></i></a>
                                        <a href="#"><i class="fa fa-eye"></i></a>
                                        <a href="#"><i class="fa fa-bookmark-o"></i></a>
                                    </p>
                                    <p class="description"><%=station %></p>
                                </figcaption>           
                            </figure>
                        </div>
                    </div>
					<% }%>
				</div>
			</div>
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
