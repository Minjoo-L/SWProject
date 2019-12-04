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
<link href='http://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lobster'
	rel='stylesheet' type='text/css'>
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

<!-- 추가한부분-->
<link rel="stylesheet" href="style1.css">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>오잉</title>
<style>
input[type="submit"] {
	background-color: #28B4B4;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	border-radius: 10px;
	width: 260px;
	height: 38px;
}

.box {
	position: center;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	height: 10%;
	margin: 15% auto;
	text-align: center;
}

input[type="text"] {
	border: none;
	border-bottom: 2px solid #0A9696;
}

input[type="password"] {
	border: none;
	border-bottom: 2px solid #0A9696;
}

.btn1 {
	background-color: white;
	border: none;
	color: black;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
	border-radius: 10px;
	width: 30px;
	height: 38px;
}
</style>
<script language = "javascript">

</script>
</head>
<body id="body">
	<%@ include file="sidemenubar.jsp"%>

	<%
		request.setCharacterEncoding("utf-8");
		String receiver = request.getParameter("user_id");
        String referer = request.getHeader("referer");
        String login_user = (String)session.getAttribute("user_id");
		
		if(login_user == null){
            %>
            <script>
                alert("로그인을 해주세요 ");
                location.href = 'login.jsp';
            </script>
            <%} %>

	<section class="page-title bg-2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						
						<h1>쪽지 </h1>
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
						<div class="post-comments-form">
	<h3 class="post-sub-heading"> 받는 사람 &nbsp <%=receiver%> </h3>
<%
	request.setCharacterEncoding("utf-8");
	
	%>
	<form method="post" action="messageAction.jsp" id="form" role="form">
		<div class="row">
			
			<!-- Comment -->
			<div class="form-group col-md-12">
				<textarea name="review" id="review" class=" form-control" rows="6"
					placeholder="내용을 입력하세요 " maxlength="400"></textarea>
			</div>

			<!-- Send Button -->
			<div class="form-group col-md-12">
				<input type="hidden" name="receiver" value="<%=receiver%>"> 
				<input type="hidden" name = "referer" value = "<%= referer %>">
				<button type="submit" class="btn btn-main ">보내기 </button>
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

