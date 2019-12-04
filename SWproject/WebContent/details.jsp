<%@ page import="java.sql.*"%>
<jsp:useBean id="DB" class="beans.JavaBeans" scope="page" />
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
<!-- bootstrap.min css -->
<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
<!-- Ionic Icon Css -->
<link rel="stylesheet" href="plugins/Ionicons/css/ionicons.min.css">
<!-- animate.css -->
<link rel="stylesheet" href="plugins/animate-css/animate.css">
<!-- Magnify Popup -->
<link rel="stylesheet"
	href="plugins/magnific-popup/dist/magnific-popup.css">
<!-- Owl Carousel CSS -->
<link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
<link rel="stylesheet"
	href="plugins/slick-carousel/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="css/style.css">
</head>
<body id="body">
	<%@ include file="sidemenubar.jsp"%>

	<%
			String login_user = (String)session.getAttribute("user_id");  // 현재 로그인한 사용자 아이디 가져오기 
			//로그인 안 해도 글 볼 수 있게 처리 
			if ( login_user == null) login_user = "";
			ResultSet rs=null;
			 request.setCharacterEncoding("utf-8");
			 String user_id ="", score="", content="";
			 String name="", phone_number="", address="", station="",contents="", time="", holiday="", fee="", etc="", theme="", img="", line ="";
			 int id = Integer.parseInt(request.getParameter("id"));
			 String sql = "select a.*, s.line from attraction a, station2 s, subwayLine l where a.station=s.name and s.line=l.line_num and a.id="+id;


			 rs =DB.getResult(sql);
			 
				 if (rs.next()){
					 name = rs.getString("name");
					 phone_number = rs.getString("phone_number");
					 address = rs.getString("address");
					 station = rs.getString("station");
					 contents = rs.getString("contents");
					 time = rs.getString("time");
					 holiday = rs.getString("holiday");
					 fee = rs.getString("fee");
					 etc = rs.getString("etc");
					 theme = rs.getString("theme");
					 img = rs.getString("img");
					 line = rs.getString("line");
					 }
				 
		%>

	<section class="page-title bg-2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h1><%= name %></h1>
						<p>명소와 그 이야기</p>
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
						<h2 class="post-title"><%=name%></h2>
						<div class="post-meta">
							<ul>
								<li><i class="ion-calendar"></i> 테마는? <%=theme %></li>
								<li><i class="ion-android-people"></i> 작성자는 관리자지롱</li>
								<li><a href=""><i class="ion-pricetags"></i> 서울</a>,<a
									href=""> TRAVEL</a>, <a href="">꺄르르륵 </a></li>

							</ul>
						</div>
						<div class="post-thumb">
							<img class="img-responsive" src="<%=img %>" alt="">
						</div>
						<div class="post-content post-excerpt">
							<p><%=name%>
							</p>
							<blockquote class="quote-post">
								<p>상세 설명</p>
							</blockquote>
							<p><%=contents%></p>
							<pre>
									전화번호 &nbsp&nbsp <%=phone_number %>
									주소  &nbsp&nbsp <%=address%>
									운영시간  &nbsp&nbsp <%=time%>
									교통  &nbsp&nbsp <%=line %>호선  <%=station%>역 
									휴무일 &nbsp&nbsp <%=holiday%>
									요금  &nbsp&nbsp <%=fee%>
									비고  &nbsp&nbsp <%=etc%>
								  </pre>
						</div>
						<div class="post-comments-form">
							<h3 class="post-sub-heading">후기</h3>

							<div class="row">
								<%
							sql = "select * from review_test where kind = 'attraction' and posting_id = "+id;
							rs =DB.getResult(sql);
							if (!rs.isBeforeFirst()){
								%>
								<p>&nbsp&nbsp&nbsp후기가 없습니다 </p>
								<% 
							}
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
									<div class=" from-group col-md-12">
									<form method="post" action="reviewDeleteAction.jsp" id="form" role="form">

										<%
											System.out.println(user_id);
											//이 부분에서 오류 난다면 다시 로그인 한 후 실행
											if(login_user.equals(user_id) && login_user != ""){
										%>
										<button type="submit" class="btn btn-main "
											style="float: right;">삭제</button>
										<% } %>
										<p>
											평점: &nbsp
											<%= score %></p>
										<p>
											내용:
											<%=content%>
										</p>
										<h5>
											작성자: &nbsp
											<%=user_id%>
											&nbsp[<%=date%>
											/
											<%=tt %>]
										</h5>
										<hr width="100%">
										<input type="hidden" name = "time" value = "<%=time%>"/>
										<input type="hidden" name = "user_id" value = "<%=user_id %>"/>
										</form>
									</div>
								</div>
								<% } %>
							</div>
						</div>
						<jsp:include page="inputReview.jsp">
							<jsp:param name="c_name" value="<%=name %>" />
							<jsp:param name="id" value="<%=id %>" />
							<jsp:param name="kind" value="attraction" />
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

