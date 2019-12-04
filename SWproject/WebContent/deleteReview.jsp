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
    </body>
</html>
				