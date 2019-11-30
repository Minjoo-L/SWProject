<%@ page import="java.sql.*" %>
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

				<title>자세한 내용입니다</title>

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
	</style>
	</head>
	<body id ="body">
		<%
			ResultSet rs=null;
			 request.setCharacterEncoding("utf-8");
			 String score ="", content ="", time ="";
			 int id = Integer.parseInt(request.getParameter("id"));
			 String c_name="", c_theme ="", firplace_name="", secplace_name="", thrplace_name="",forplace_name="";
			 System.out.println("id는 "+id);
			 String sql = "select * from courses where id ="+id;
			 rs =DB.getResult(sql);
			 
				 if (rs.next()){
					 c_name = rs.getString("c_name");
					 c_theme = rs.getString("c_theme");
					 firplace_name = rs.getString("firplace_name");
					 secplace_name = rs.getString("secplace_name");
					 thrplace_name = rs.getString("thrplace_name");
					 forplace_name = rs.getString("forplace_name");
					 }
				 
		%>
		<section class="page-title bg-2">
			<div class="container">
			  <div class="row">
				<div class="col-md-12">
				  <div class="block">
					<h1><%= c_name%></h1>
					<p>축제와 자세한 이야기들</p>
				  </div>
				</div>
			  </div>
			</div>
		  </section>

		  <section class="page-wrapper">
			  <div class="container">
				  <div class="row">
					  <div class="col-md-12">
						  <div class="post post-single">
							  <h2 class="post-title"><%=c_name=></h2>
							  <div class="post-meta">
								  <ul>
									<li>
									  <i class="ion-calendar"></i> 테마는? <%=c_theme %>
									</li>
									<li>
									  <i class="ion-android-people"></i> 작성자
									</li>
									<li>
									  <a href=""><i class="ion-pricetags"></i> 서울</a>,<a href=""> TRAVEL</a>, <a
									  href="">축제</a>
									</li>

								  </ul>
								</div>
							  <div class="post-thumb">
								  <img class="img-responsive" src="img/a.png" alt="">
							  </div>
							  <div class="post-content post-excerpt">
								  <p><%=firplace_name %></p>
								  <blockquote class="quote-post">
									  <p>
										  무슨 언어지 프랑스언가
										  Lid est laborum dolo rumes fugats untras. Etharums ser quidem rerum facilis dolores nemis omnis fugats vitaes nemo minima rerums unsers sadips amets.. Sed ut perspiciatis unde omnis iste natus error
									  </p>
								  </blockquote>
								  <p>내요이 없어요오오</p>
								  <pre>
								  이 부분은 삭제 할까요오오오
								  </pre>
								  <p>어떤 내용이 필요할까아ㅏ아아아ㅏ</p>
							  </div>
							  		 <div class="post-comments-form">
								  <h3 class="post-sub-heading">후기</h3>
				<form method="post" action="#" id="form" role="form" >
					 <div class="row">
							<%
					 	
							//where조건을 이제는 게시글 id로 찾는걸로 바꾸기, review schema 수정 필요
							//대충 불러오는 것만 확인한상태 
							sql = "select * from review_test where score = '5'";
							rs = DB.getResult(sql);
							while (rs.next()){
								score = rs.getString("score");
								content = rs.getString("content");
								time = rs.getString("time");
							
							%>
   
						<!-- 	 for (let data of results){ -->
								<div class="col-md-6 form-group">
									<!-- Name -->
										<div class=" from-group col-md-12" >
												<p>평점 &nbsp <%=score %></p>
												<p><%=content %> </p>
												<h5> - 이름 &nbsp [<%=time%>]</h5>
										</div>
								</div>
						<!-- } -->	
					  </div>

				</form>
						</div>
								  <div class="post-comments-form">
									  <h3 class="post-sub-heading">후기 작성</h3>
									  <form method="post" action="reviewAction.jsp" id="form" role="form" >
											<div class="row">
												<div class="col-md-6 form-group">
													<h3> 평점
													<select name="sortMtd" title="평점" class="optSelect2" onchange="$('#sortMethod').val(this.value);fnChgEvalMove(1)">
														<option value="5">5</option>
														<option value="4">4</option>
														<option value="3">3</option>
														<option value="2">2</option>
														<option value="1">1</option>
													</select>
													</h3>
												</div>
												<!-- Comment -->
												<div class="form-group col-md-12">
													<textarea name="review" id="review" class=" form-control" rows="6" placeholder="Comment" maxlength="400"></textarea>
												</div>
  
												<!-- Send Button -->
												<div class="form-group col-md-12">
													<input type = "hidden" name = "id" value="<%=id%>">
													<button type="submit" class="btn btn-main ">
														완료
													</button>
												</div>
											</div>
										</form>
								  </div>


							  </div>

						  </div>
					  </div>
				  </div>
			  </section>
		</body>
		</html>
