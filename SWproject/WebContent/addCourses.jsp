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

        <title>Festival Metro</title>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Add custom CSS here -->
        <link href="css/style.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
  <%@ include file = "sidemenubar.jsp" %>
        <!-- Intro -->
        <div id="about">
            <div class="light-wrapper">
                <div class="container inner">		
                    <div class="row">
                        <div class="text-center">
                            <h2 class="main-title">AddCourses</h2>
                            <hr>
                        </div>
						
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
		
		<form action="addCourses_verify.jsp" method="post">
		
			
  			<label class="field a-field a-field_a1">
    		<input class="field__input a-field__input" type="text" name="course_name" placeholder="e.g. 경복궁주변맛집탐방" required>
    		<span class="a-field__label-wrap">
      		<span class="a-field__label">추가하고싶은 코스이름</span>
    		</span>
    		<br><br>
  			</label>
  			<hr width="50%">
  			<label class="field a-field a-field_a1">
    		<input class="field__input a-field__input" type="text" name="course_theme" placeholder="e.g. 힐링" required>
    		<span class="a-field__label-wrap">
      		<span class="a-field__label">코스 테마</span>
    		</span>
    		<br><br>
  			</label>
  			
   			<br><br><br><br><br>
   			<table width="100%" height="100%">
		<tr>
			<td>
			<h3>코스내 <big>첫</big>번째 장소</h3>

			<select id="fp" name="fp">
			<% while(rs.next()){%>
				<option><%= rs.getString("name")%></option>
			<%	} %>
			</select>
				<!-- 장소이름 <input type="text" name="place_name1"><br><br>
				사진 src<input type="text" name="img_src1" ><br><br>
				설명<br> <textarea name="explanation1" cols="40" rows="5"></textarea> -->
				
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
  			<!-- 
				장소이름 <input type="text" name="place_name3"><br><br>
				사진 src<input type="text" name="img_src3"><br><br>
				설명 <textarea name="explanation3" cols="40" rows="5"></textarea>
				 -->
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
				<!--  
				장소이름 <input type="text" name="place_name2"><br><br>
				사진 src<input type="text" name="img_src2"><br><br>
				설명 <textarea name="explanation2" cols="40" rows="5"></textarea>-->
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
				<!--  장소이름 <input type="text" name="place_name4"><br><br>
				사진 src<input type="text" name="img_src4"><br><br>
				설명 <textarea name="explanation4" cols="40" rows="5"></textarea>-->
			</td>
		</tr>
	</table>
						 <br><br><br><br><br><br>
    <input type="submit" value="course add">
   			
		</form>
		
		
	
    
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
