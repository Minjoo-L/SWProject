<%@ page import="java.sql.*" %>
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

				<title>후기 삭제 </title>

				<!-- Bootstrap core CSS -->
				<link href="css/bootstrap.css" rel="stylesheet">

				<!-- Add custom CSS here -->
				<link href="css/style.css" rel="stylesheet">
				<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
				<link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
				<link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
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

				<!-- 추가한부분-->
		    <link rel="stylesheet" href="style1.css">
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="ie=edge">
			<title>오잉</title>
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
		.swiper-container {
     	 	width: 90%;
     	 	height: 100%;
    	}
    footer{
	background-color:#E8F5FF;
	}
	</style>
	
	</head>
	<body id ="body">
	<%
		ResultSet rs=null;
 		request.setCharacterEncoding("utf-8");
 		String posting_title="";
 		int posting_id = 0;
 		String sql = "";
 		
	%>
	  <%@ include file = "sidemenubar.jsp" %>
	
		<section class="page-title bg-2">
			<div class="container">
			  <div class="row">
				<div class="col-md-12">
				  <div class="block">
					<h1>후기 삭제 </h1>
					<p>관리자</p>
				  </div>
				</div>
			  </div>
			</div>
		  </section>
						
			 <div class="col-md-12">
				 <div class="post post-single">	  
				<div class="post-comments-form">
				
					<h3 class="post-sub-heading" style ="text-align: center;">게시글 목록 </h3> 
					 <div class="row">
					 <%
					sql= "select distinct posting_id, posting_title from review_test";
					 rs =DB.getResult(sql);
				 		while (rs.next()){
				 			posting_id = rs.getInt("posting_id");
				 			posting_title = rs.getString("posting_title");
					 %>
						<!-- 	 for (let data of results){ -->
						<div class="from-group col-md-12">
							<!-- Name -->
								<form method="post" action="showReviewAction.jsp" id="form" role="form">
									<input type="hidden" name = "posting_id" value="<%=posting_id %>">
									<input type = "hidden" name = "posting_title" value = "<%= posting_title %>">
									<button type="submit" class="btn btn-main "style="float: right;">리뷰 조회  </button>
										
										<p> <a href="place_details.jsp?id=<%=posting_id%>"><%=posting_title%></a></p>
									<hr width = "100%">
								</form>
								</div>
						<% }%>
					  </div>
					  

				</div>
				</div>
				</div>
 <!-- JavaScript -->
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.parallax-1.1.3.js"></script>
		<!-- Swiper JS -->
  		<script src="./css/swiper.min.js"></script>
  		
	
  	
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
     <script type="text/javascript">
		$(function(){
			$("#review").chagne(function(){
				alert("변경!");
			})
		})
	</script>

    </body>
</html>
				