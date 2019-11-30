<%@ page import="java.sql.*" %>
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
    A:link {text-decoration:none; color:white;}
   	A:visited {text-decoration: none; color:white;}
    A:active {text-decoration: none; color:white;}
    A:hover {text-decoration: none; color:white;}
</style>
    </head>

    <body>
    <%
		ResultSet rs =null;
		int i = 0;
	 	String c_name ="", c_theme ="", firplace_name ="", secplace_name="",thrplace_name="", forplace_name="";
	 	int id = 0;
	 	request.setCharacterEncoding("utf-8");
	 	//where조건을 이제는 게시글 제목으로 찾는걸로 바꾸기 
	 	String sql = "select * from courses";
	 	rs = DB.getResult(sql);
	 	
	%>
   
    <%@ include file = "sidemenubar.jsp" %>

        <!-- Portfolio -->
        <div id="places" class="places">
            <div class="container">
				<table width="100%">
						<tr>
							<td><p algn="left"><a href="/theme"><button type="button" class="btn1">before</button></a></p></td>
							<td><p align="right"><a href="/message"><button type="button" class="btn1">next</button></a></p></td>
						</tr>
				</table>
                <div class="row">
                    <div class="col-md-4 col-md-offset-4 text-center">
                        <h2 class="main-title">추천 코스</h2>
                        <hr>
                    </div>
                </div>
            </div>  
            <div class="divide50">
			</div>  
            <div class="container">
                <div class="row">
                 <% while (rs.next()){
				 		c_name = rs.getString(1);
				 		c_theme = rs.getString(2);
				 		firplace_name = rs.getString(3);
				 		secplace_name = rs.getString(4);
				 		thrplace_name = rs.getString(5);
				 		forplace_name = rs.getString(6);
				 		id = rs.getInt(7);
				 	%>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="grid center-block">
                            <figure class="effect-zoe">
                                <img src="img/paris.jpg" alt="paris" class="img-responsive center-block">
                                <figcaption>
                                    <h2><a href="place_details.jsp?id=<%=id%>"><%=c_name %></a></h2>
                                    <p class="icon-links">
                                        <a href="#"><i class="fa fa-heart-o"></i></a>
                                        <a href="#"><i class="fa fa-eye"></i></a>
                                        <a href="#"><i class="fa fa-bookmark-o"></i></a>
                                    </p>
                                    <p class="description">
										<a href="place_details.jsp?id=<%=id%>">
                                       		<%=forplace_name %>
										</a>
                                    </p>
                                </figcaption>           
                            </figure>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
                

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
