<%@ page import="java.sql.*" %>
<%@ page import="beans.JavaBeans" %>
<jsp:useBean id="DB" class="beans.JavaBeans" scope="page"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

 
		<!DOCTYPE html>
		<html lang="en">
		<head>

			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<meta name="description" content="">
			<meta name="author" content="">

				<title>Festival Metro </title>

				<!-- Bootstrap core CSS -->
				<link href="css/bootstrap.css" rel="stylesheet">

				<!-- Add custom CSS here -->
				<link href="css/style.css" rel="stylesheet">
				<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
				 <!-- bootstrap.min css -->
		  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
		  <!-- Ionic Icon Css -->
		  <link rel="stylesheet" href="plugins/Ionicons/css/ionicons.min.css">
		  <!-- animate.css -->
		  <link rel="stylesheet" href="plugins/animate-css/animate.css">
		  <!-- Magnify Popup -->
		  <link rel="stylesheet" href="plugins/magnific-popup/dist/magnific-popup.css">
		  <!-- Owl Carousel CSS -->
		  <link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
		  <link rel="stylesheet" href="plugins/slick-carousel/slick/slick-theme.css">

		  <!-- Main Stylesheet -->
		  <link rel="stylesheet" href="css/style.css">
		  <link rel="stylesheet" href="./css/swiper.min.css">
	</head>
<body>
	    <%@ include file = "sidemenubar.jsp" %>
        <!-- Intro -->
        <div id="about">
            <div class="light-wrapper">
                <div class="container inner">
									
                    <div class="row">
                        <div class="text-center">
                            <h2 class="main-title">deleteCourses</h2>
                            <hr>
                        </div>
						
						<div class="page">
								<%
								String name="";
								int i=0;
								Connection conn=null;
								Statement stmt=null;
								ResultSet rs=null;
								
								String sql="select * from courses";
								rs=DB.getResult(sql);
								
								if(rs==null){
									out.println("DB연동 오류");
								}
								
								%>
								<h3 class="post-sub-heading" style="text-align: center;">코스 목록</a></h3> 
								
										<% while(rs.next()){
											String c_name=rs.getString(1);
											String c_theme=rs.getString(2);
											String c_first=rs.getString(3);
											String c_second=rs.getString(4);
											String c_third=rs.getString(5);
											String c_fourth=rs.getString(6);
										%>
										<form action="deleteCourses_verify.jsp" method="post" id="form" role="form">
											<div class="form-group col-md-12">
											<p>코스 이름 : <%=c_name %></p>
											<button type="submit" class="btn btn-main "style="float: right;">삭제</button>
											<p>코스 테마 : <%=c_theme %></p>
											<p>코스 내용 : </p>
											<p> <%=c_first %><%=", " %><%=c_second %><%=", " %><%=c_third %><%=", " %><%=c_fourth %></p>
											<input type="hidden" name="c_name" value="<%=c_name %>">  
											<hr width="100%">
											</div>							   			
					  					</form>
					  					<%} %>
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
                        <p>Copyright &copy; <a href="https://github.com/Minjoo-L/SWProject">software_project 세일러문조</a>  2019</p>
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
