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

				<title>Enjoy SEOUL</title>

				<!-- Bootstrap core CSS -->
				<link href="css/bootstrap.css" rel="stylesheet">

				<!-- Add custom CSS here -->
				<link href="css/style.css" rel="stylesheet">
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
 		String user_id="", score ="", content="", time="";
 		String sql = "";
 		int posting_id = Integer.parseInt(request.getParameter("posting_id"));	//posting_id 값 넘겨 받기 
 		String posting_title = request.getParameter("posting_title");			//posting_title 값 넘겨 받
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
					<h3 class="post-sub-heading" style="text-align: center;"><a href="place_details.jsp?id=<%=posting_id%>"><%=posting_title %></a></h3> 
					 <div class="row">
					 <%
					sql= "select * from review_test where posting_id="+posting_id;
					 rs =DB.getResult(sql);
				 		while (rs.next()){
				 			user_id = rs.getString("user_id");
				 			score = rs.getString("score");
				 			content = rs.getString("content");
				 			time = rs.getString("time");
				 			posting_id = rs.getInt("posting_id");
				 			posting_title = rs.getString("posting_title");
				 			
				 			String date = time.substring(0,10);
							String tt = time.substring(11,19);
					 %>
						<!-- 	 for (let data of results){ -->
								<div class="col-md-6 form-group">
									<!-- Name -->
									
									<form method="post" action="reviewDeleteAction.jsp" id="form" role="form">
										<div class=" from-group col-md-12" >
											  	
											<p>평점: <%=score%> </p><button type="submit" class="btn btn-main "style="float: right;">
													  삭제 
												 </button>
											<p>내용: <%=content %> </p>
											<h5>작성자:  &nbsp <%=user_id%> &nbsp[<%=date%> / <%=tt %>] </h5>
											<input type = "hidden"name = "user_id" value="<%=user_id %>">
											<input type="hidden" name = "time" value ="<%=time%>">
											<hr width = "100%">
											
										</div>
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
				