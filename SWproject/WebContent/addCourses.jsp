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
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>

		<!-- 추가한부분-->
		  <link rel="stylesheet" href="style1.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
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
    input[type="text"]:focus{
            border:none;
            border-bottom:2px solid #0A9696;

        }
    input[type="textarea"]{
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
		
.field{
  --uiFieldPlaceholderColor: var(--fieldPlaceholderColor, #767676);
}

.field__input{ 
  background-color: transparent;
  border-radius: 0;
  border: none;

  -webkit-appearance: none;
  -moz-appearance: none;

  font-family: inherit;
  font-size: 1em;
}

.field__input:focus::-webkit-input-placeholder{
  color: var(--uiFieldPlaceholderColor);
}

.field__input:focus::-moz-placeholder{
  color: var(--uiFieldPlaceholderColor);
  opacity: 1;
}

/*
=====
LEVEL 2. CORE STYLES
=====
*/

.a-field{
  display: inline-block;
}

.a-field__input{ 
  display: block;
  box-sizing: border-box;
  width: 100%;
}

.a-field__input:focus{
  outline: none;
}

/*
=====
LEVEL 3. PRESENTATION STYLES
=====
*/

/* a-field */

.a-field{
  --uiFieldHeight: var(--fieldHeight, 40px);  
  --uiFieldBorderWidth: var(--fieldBorderWidth, 2px);
  --uiFieldBorderColor: var(--fieldBorderColor);

	/*추가하고싶은 코스이름 폰트크기*/
  --uiFieldFontSize: var(--fieldFontSize, 1.5em);
  --uiFieldHintFontSize: var(--fieldHintFontSize, 1em);

/*추가하고싶은 코스이름 밑의 바의 길이*/
  --uiFieldPaddingRight: var(--fieldPaddingRight, 80px);
  --uiFieldPaddingBottom: var(--fieldPaddingBottom, 15px);
  --uiFieldPaddingLeft: var(--fieldPaddingLeft, 15px);   

  position: relative;
  box-sizing: border-box;
  font-size: var(--uiFieldFontSize);
  padding-top: 1em;  
}

.a-field1{
  --uiFieldHeight: var(--fieldHeight, 40px);  
  --uiFieldBorderWidth: var(--fieldBorderWidth, 2px);
  --uiFieldBorderColor: var(--fieldBorderColor);

	/*추가하고싶은 코스이름 폰트크기*/
  --uiFieldFontSize: var(--fieldFontSize, 1em);
  --uiFieldHintFontSize: var(--fieldHintFontSize, 1em);

/*추가하고싶은 코스이름 밑의 바의 길이*/
  --uiFieldPaddingRight: var(--fieldPaddingRight, 70px);
  --uiFieldPaddingBottom: var(--fieldPaddingBottom, 15px);
  --uiFieldPaddingLeft: var(--fieldPaddingLeft, 15px);   

  position: relative;
  box-sizing: border-box;
  font-size: var(--uiFieldFontSize);
  padding-top: 1em;  
}

.a-field__input{
  height: var(--uiFieldHeight);
  padding: 0 var(--uiFieldPaddingRight) 0 var(--uiFieldPaddingLeft);
  border-bottom: var(--uiFieldBorderWidth) solid var(--uiFieldBorderColor);  
}

.a-field__input::-webkit-input-placeholder{
  opacity: 0;
  transition: opacity .2s ease-out;
}

.a-field__input::-moz-placeholder{
  opacity: 0;
  transition: opacity .2s ease-out;
}

.a-field__input:not(:placeholder-shown) ~ .a-field__label-wrap .a-field__label{
  opacity: 0;
  bottom: var(--uiFieldPaddingBottom);
}

.a-field__input:focus::-webkit-input-placeholder{
  opacity: 1;
  transition-delay: .2s;
}

.a-field__input:focus::-moz-placeholder{
  opacity: 1;
  transition-delay: .2s;
}

.a-field__label-wrap{
  box-sizing: border-box;
  width: 100%;
  height: var(--uiFieldHeight);	

  pointer-events: none;
  cursor: text;

  position: absolute;
  bottom: 0;
  left: 0;
}

.a-field__label{
  position: absolute;
  left: var(--uiFieldPaddingLeft);
  bottom: calc(60% - .5em);

  line-height: 1;
  font-size: var(--uiFieldHintFontSize);

  pointer-events: none;
  transition: bottom .2s cubic-bezier(0.9,-0.15, 0.1, 1.15), opacity .2s ease-out;
  will-change: bottom, opacity;
}

.a-field__input:focus ~ .a-field__label-wrap .a-field__label{
  opacity: 1;
  bottom: var(--uiFieldHeight);
}

/* a-field_a1 */

.a-field_a1 .a-field__input{
  transition: border-color .2s ease-out;
  will-change: border-color;
}

.a-field_a1 .a-field__input:focus{
  border-color: var(--fieldBorderColorActive);
}

/* a-field_a2 */

.a-field_a2 .a-field__label-wrap::after{
  content: "";
  box-sizing: border-box;
  width: 0;
  height: var(--uiFieldBorderWidth);
  background-color: var(--fieldBorderColorActive);

  position: absolute;
  bottom: 0;
  left: 0;  

  will-change: width;
  transition: width .285s ease-out;
}

.a-field_a2 .a-field__input:focus ~ .a-field__label-wrap::after{
  width: 100%;
}

/* a-field_a3 */

.a-field_a3{
  padding-top: 1.5em;
}

.a-field_a3 .a-field__label-wrap::after{
  content: "";
  box-sizing: border-box;
  width: 100%;
  height: 0;

  opacity: 0;
  border: var(--uiFieldBorderWidth) solid var(--fieldBorderColorActive);

  position: absolute;
  bottom: 0;
  left: 0;

  will-change: opacity, height;
  transition: height .2s ease-out, opacity .2s ease-out;
}

.a-field_a3 .a-field__input:focus ~ .a-field__label-wrap::after{
  height: 100%;
  opacity: 1;
}

.a-field_a3 .a-field__input:focus ~ .a-field__label-wrap .a-field__label{
  bottom: calc(var(--uiFieldHeight) + .5em);
}

/*
=====
LEVEL 4. SETTINGS
=====
*/

.field{
  --fieldBorderColor: #D1C4E9;
  --fieldBorderColorActive: #673AB7;
}

/*
=====
DEMO
=====
*/

body{
  font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Open Sans, Ubuntu, Fira Sans, Helvetica Neue, sans-serif;
  margin: 0;
  
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.page{
  position:center;
  top:0;left:0;bottom:0;right:0;
  height:80%;
  margin:15% auto;
  text-align:center;
  box-sizing: border-box;
  /*width: 100%;
  max-width: 1000px;
  margin: auto;
  padding: 15px;*/
  
  /*
  display: grid;
  grid-gap: 30px;
  align-items: flex-end;
  order: 1;
  */
}

@media (min-width: 481px){
  
  .page{
      grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  }
}


/*
=====
LinkedIn
=====
*/

.linkedin{
  width: 100%;
  background-color: #f0f0f0;
  text-align: center;
  
  position: absolute;
  top: 0;
  left: 0;
}

.linkedin__container{
  max-width: 1000px;
  padding: 10px;
  margin-left: auto;
  margin-right: auto;  
}

.linkedin__text{
  margin-top: 0;
  margin-bottom: 0;
}

.linkedin__link{
  color: #ff5c5c;
}
</style>
</head>
<body>
  <%@ include file = "sidemenubar.jsp" %>
        <!-- Intro -->
        <div id="about">
            <div class="light-wrapper">
                <div class="container inner">
					<br><br>
					<table width="100%">
						<tr>
							<td><p algn="left"><a href="/"><button type="button" class="btn1">before</button></a></p></td>
							<td><p align="right"><a href="/deleteCourses"><button type="button" class="btn1">next</button></a></p></td>
						</tr>
					</table>
					
					
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
                        <p>Copyright &copy; <a href="https://themewagon.com/">Themewagon</a>  2014</p>
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
