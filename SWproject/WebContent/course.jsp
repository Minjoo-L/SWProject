<%@ page import="java.sql.*" %>
<jsp:useBean id="DB" class="beans.JavaBeans" scope="page"/>
<jsp:useBean id="imgDB" class="beans.JavaBeans" scope="page"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Festival Metro</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Add custom CSS here -->
        <link href="css/style.css" rel="stylesheet">

</head>

    <body>
    <%
		ResultSet rs =null;
	 	String c_name ="", c_theme ="", firplace_name ="", secplace_name="";
	 	int id = 0;
	 	request.setCharacterEncoding("utf-8");
	 	//where조건을 이제는 게시글 제목으로 찾는걸로 바꾸기 
	 	String imgSql = "";	 	
	%>
    <%@ include file = "sidemenubar.jsp" %>

	<section class="page-title bg-2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
                        <h1 class="main-title">추천 코스</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
        <!-- Portfolio -->
        <div id="places" class="places"> 
            <div class="divide50">
			</div>  
			<%
					
		  			final int ROWSIZE=6; // 한페이지에 보일 게시물 수
		  			final int BLOCK=4; // 아래에 보일 페이지 최대 개수 1~5 / 6~10 
		  			int pg=1; // 기본 페이지 값
		  			if(request.getParameter("pg")!=null){ // 다른 페이지 일 때
		  				pg= Integer.parseInt(request.getParameter("pg"));
		  			}
		  			int start=(pg*ROWSIZE)-(ROWSIZE-1);
		  			int end=(pg*ROWSIZE);
		  			int allPage=0;
		  			int startPage = ((pg-1)/BLOCK*BLOCK)+1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6)
		  			int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)
		  			int total=0;
		  	
		  			String sql="select count(*) as cnt from courses";
					rs=DB.getResult(sql);
					while(rs.next()){
						total=rs.getInt("cnt");
					}
					rs.close();
					allPage=(int)Math.ceil(total/(double)ROWSIZE);
					if(endPage>allPage){
						endPage=allPage;
					}
			%>
            <div class="container">
                <div class="row">
                 <% 
         	 		String sql2 = "SELECT c.c_name, c.id,  a.img , c.firplace_name, c.secplace_name FROM courses c, attraction a where a.name=c.firplace_name and c.id >="+start+" and c.id <= "+end +" order by c_name";
                 	rs=DB.getResult(sql2);
         	 		while (rs.next()){
				 		c_name = rs.getString(1);
				 		System.out.println(c_name);
				 		String imgUrl=rs.getString(3);
				 		id = rs.getInt(2);
				 		firplace_name=rs.getString(4);
				 		secplace_name=rs.getString(5);
				 	%>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="grid center-block">
                        <a href="course_details.jsp?id=<%=id %>">
                            <figure class="effect-zoe">
                                <img src=<%=imgUrl %> class="img-responsive center-block"  style="width:800px;height:400px;">
                                <figcaption>
                                    <h2><%=c_name %></h2>
                                    <p class="description">
                                       	<%=firplace_name %>-<%=secplace_name %>...
                                    </p>
                                </figcaption>           
                            </figure>
                           </a>
                        </div>
                    </div>
                    <% } %>
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
	  <tr><td colspan="4" height="5"></td></tr>
	  <tr>
		<td align="center">
			<%
				if(pg>BLOCK) {
			%>
				[<a href="course.jsp?pg=1">◀◀</a>]
				[<a href="course.jsp?pg=<%=startPage-1%>">◀</a>]
			<%
				}
			%>
			
			<%
				for(int i=startPage; i<= endPage; i++){
					if(i==pg){
			%>
						<u><b>[<%=i %>]</b></u>
			<%
					}else{
			%>
						<a href="course.jsp?pg=<%=i %>">[<%=i %>]</a>
			<%
					}
				}
			%>
			
			<%
				if(endPage<allPage){
			%>
				[<a href="course.jsp?pg=<%=endPage+1%>">▶</a>]
				[<a href="course.jsp?pg=<%=allPage%>">▶▶</a>]
			<%
				}
			%>
			</td>
			</tr>
			  <tr align="center">
	  </tr> 
	</table>
                </div>
            </div>
        </div>
        <!-- JavaScript -->
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.parallax-1.1.3.js"></script>
    </body>
</html>
