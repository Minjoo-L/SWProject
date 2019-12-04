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
	</head>
	<body id ="body">
	  <%@ include file = "sidemenubar.jsp" %>
	
			<%
			String login_user = (String)session.getAttribute("user_id");  // 현재 로그인한 사용자 아이디 가져오기 
			//로그인 안 해도 글 볼 수 있게 처리 
			if ( login_user == null) login_user = "";
			ResultSet rs=null;
			 request.setCharacterEncoding("utf-8");
			 String score ="", content ="", time ="", user_id="";
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
					<h1><%= c_name %></h1>
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
							  <h2 class="post-title"><%=c_name%></h2>
							  <div class="post-meta">
								  <ul>
									<li>
									  <i class="ion-calendar"></i> 테마는? <%=c_theme %>
									</li>
									<li>
									  <i class="ion-android-people"></i> 작성자는 관리자지롱
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
									<p><%=firplace_name %> </p>
								  <blockquote class="quote-post">
									  <p> 무슨 얘기를 넣지이ㅣ
									  </p>
								  </blockquote>
								  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum illo deserunt necessitatibus quibusdam sint, eos explicabo tenetur molestiae vero facere, aspernatur sit mollitia perferendis reiciendis. Deleniti magni explicabo sed alias fugit amet animi molestias ipsum maiores. Praesentium sint, id laborum quos. Tempora inventore est, dolor corporis quis doloremque nostrum, eos velit culpa quasi labore. Provident laborum porro nihil iste, magnam officia nemo praesentium autem, libero vel officiis. Omnis pariatur nam voluptatem voluptate at officia repellat ea beatae eligendi? Mollitia error saepe, aperiam facere. Optio maiores deleniti veritatis eaque commodi atque aperiam, debitis iste alias eligendi ut facilis earum! Impedit, tempore.</p>
								  <pre>
									이부분은 지우는게 나을까아아아
								  </pre>
								  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex error esse a dolore, architecto sapiente, aliquid commodi, laudantium eius nemo enim. Enim, fugit voluptatem rem molestiae. Sed totam quis accusantium iste nesciunt id exercitationem cumque repudiandae voluptas perspiciatis, consequatur quasi, molestias, culpa odio adipisci. Nesciunt optio fugiat iste quam modi, ex vitae odio pariatur! Corrupti explicabo at harum qui doloribus, sit dicta nemo, dolor, enim eum molestias fugiat obcaecati autem eligendi? Nisi delectus eaque architecto voluptatibus, unde sit minus quae quod eligendi soluta recusandae doloribus, officia, veritatis voluptatum eius aliquam quos. Consectetur, nisi? Veritatis totam, unde nostrum exercitationem tempora suscipit, molestias, deserunt ipsum laborum aut iste eaque? Vitae delectus dicta maxime non mollitia? Sapiente eos a quia eligendi deserunt repudiandae modi molestias tenetur autem pariatur ullam itaque, quas eveniet, illo quam rerum ex obcaecati voluptatum nesciunt incidunt culpa provident illum soluta. Voluptas possimus nesciunt inventore perspiciatis neque fugiat, magnam natus repellendus praesentium eum voluptatum, alias incidunt, tempora reprehenderit recusandae et numquam itaque ratione dolor voluptatibus in commodi ut! Neque deserunt nostrum commodi dolor natus quo, non vitae deleniti, vero voluptatem error aspernatur veniam expedita numquam amet quia in dolores velit esse molestiae! Iusto architecto accusantium quisquam recusandae quod vero quia.</p>
							  </div>
			<div class="post-comments-form">
				<h3 class="post-sub-heading">후기</h3>
				
					 <div class="row">
							<%
							sql = "select * from review_test where posting_id="+id;
							rs =DB.getResult(sql);
								while (rs.next()){
									user_id = rs.getString("user_id");
									score = rs.getString("score");
									content = rs.getString("content");
									time = rs.getString("time");
									
									String date = time.substring(0,10);
									String tt = time.substring(11,19);
							%>
						<!-- 	 for (let data of results){ -->
								<div class="col-md-6 form-group">
									<!-- Name -->
										<div class=" from-group col-md-12" >
											<form method="post" action="reviewDeleteAction.jsp" id="form" role="form">

												<%
												System.out.println(user_id);
												if(login_user.equals(user_id) && login_user != null){
												%>
													<button type="submit" class="btn btn-main "style="float: right;">
														  삭제 
													 </button>
												<% } %>
												<p>평점:  &nbsp <%=score %></p>
												<p>내용: <%=content %> </p>
												<h5>작성자:  &nbsp <%=user_id%> &nbsp[<%=date%> / <%=tt %>] </h5>
												<hr width = "100%">
												<input type="hidden" name = "time" value = "<%=time%>"/>
												<input type="hidden" name = "user_id" value = "<%=user_id %>"/>
										</form>
										</div>
								</div>
						<% } %>
					  </div>
					</div>
					<jsp:include page="inputReview.jsp">
							<jsp:param name = "c_name" value="<%=c_name %>"/>
							<jsp:param name = "id" value = "<%=id %>"/>
							<jsp:param name = "kind" value = "courses"/>
					</jsp:include>	 

							  </div>

						  </div>
					  </div>
				  </div>
			  </section>
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

