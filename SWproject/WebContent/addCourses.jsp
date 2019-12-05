<%@ page import="java.sql.*"%>
<jsp:useBean id="DB" class="beans.JavaBeans" scope="page"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8");%>
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
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
</head>
<style>
	select {
width: 200px;
padding: .8em .5em;
border: 1px solid #999;
font-family: inherit;
background: url('arrow.jpg') no-repeat 95% 50%;
border-radius: 0px;
-webkit-appearance: none;
-moz-appearance: none;
appearance: none;
}

select::-ms-expand {
    display: none;
}
</style>
<body>
  <%@ include file = "sidemenubar.jsp" %>
        <!-- Intro -->
        	<section class="page-title bg-2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h1>코스 추가</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
        <div id="about">
            <div class="light-wrapper">
                <div class="container inner">		
                    <div class="row">

<div class="page">
		<%
		String name="";
		int i=0;
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from attraction";
		rs=DB.getResult(sql);
		
		if(rs==null){
			out.println("DB연동 오류");
		}
		
		%>
		<div id="box2">
		<form action="addCourses_verify.jsp" method="post">
		
			
			<br>
			<label class="field a-field a-field_a1">
			<span class="a-field__label">추가하고싶은 코스이름</span><br>
		  <input class="field__input a-field__input" type="text" name="course_name" placeholder="e.g. 경복궁주변맛집탐방" required>
		  <span class="a-field__label-wrap">
		  <br>
		  </span>
		  <br><br>
			</label>
			<hr width="50%">
			<label class="field a-field a-field_a1">
			<span class="a-field__label">코스 테마</span><br>
		  <input class="field__input a-field__input" type="text" name="course_theme" placeholder="e.g. 힐링" required>
		  <span class="a-field__label-wrap">
		  </span>
		  <br>
    		<br><br>
  			</label>
   			<table width="100%" height="100%">
		<tr>
			<td>
			<h3>코스내 <big>첫</big>번째 장소</h3>

			<select id="fp" name="fp">
			<% while(rs.next()){%>
				<option><%= rs.getString("name")%></option>
			<%	} %>
			</select>
			</td>
			<td>
			<h3>코스내 <big>두</big>번째 장소</h3>
			<%	rs=null;
			String sql2="select * from attraction";
			rs=DB.getResult(sql2);
		%>
			<select id="sp" name="sp">
			<% while(rs.next()){%>
				<option><%= rs.getString("name")%></option>
			<%	} %>
			</select>
			</td>
		
			<td><h3>코스내 <big>세</big>번째 장소</h3>
			<%	rs=null;
			String sql3="select * from attraction";
			rs=DB.getResult(sql3);
			%>
			<select id="tp" name="tp">
			<% while(rs.next()){%>
				<option><%= rs.getString("name")%></option>
			<%	} %>
			</select>
			</td>
			<td><h3>코스내 <big>네</big>번째 장소</h3>
			<%	rs=null;
			String sql4="select * from attraction";
			rs=DB.getResult(sql4);
			%>
			<select id="fop" name="fop">
			<% while(rs.next()){%>
				<option><%= rs.getString("name")%></option>
			<%	} %>
			</select>
			</td>
		</tr>
	</table>
						 <br><br><br>
    <input type="submit" value="코스 추가">
   			
		</form>
	</div><!--end of box2-->
    </div>                  
                      </div>
                      <!-- /.row --> 
                      
                    </div>
                    <!-- /.container -->
				
                  </div>
                  <!-- /.light-wrapper -->
                </div>
        <!-- /Intro -->
        <!-- JavaScript -->
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.parallax-1.1.3.js"></script>

</body>
</html>
