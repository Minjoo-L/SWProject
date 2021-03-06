<%@ page import="java.sql.*" %>
<jsp:useBean id="DB" class="beans.JavaBeans" scope="page"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Enjoy SEOUL</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Add custom CSS here -->
        <link href="css/style.css" rel="stylesheet">
 
    </head>

    <body>
       <%@ include file = "sidemenubar.jsp" %>
        <!-- Portfolio -->
	<section class="page-title bg-2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
					 <h1 class="main-title">서울시 축제</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
        <div id="places" class="places">
            <div class="container">
				<%
					
		  			final int ROWSIZE=8; // 한페이지에 보일 게시물 수
		  			final int BLOCK=5; // 아래에 보일 페이지 최대 개수 1~5 / 6~10 
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
		  		%>
				<div class="row">
				<%
					int id=0;
					int num=0;
					String name="", station="", img="", line="";
					Statement stmt=null;
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					String sql="";
					
					sql="select count(*) as cnt from festival";
					rs=DB.getResult(sql);
					while(rs.next()){
						total=rs.getInt("cnt");
					}
					rs.close();
					allPage=(int)Math.ceil(total/(double)ROWSIZE);
					if(endPage>allPage){
						endPage=allPage;
					}
	
					sql="select f.name, f.station, s.line, f.id, f.img, s_date, e_date from festival f, station2 s, subwayLine l where f.station=s.name and s.line=l.line_num and (id>= "+start+" and id <= "+end+") order by f.name";
					rs=DB.getResult(sql);
					if(rs==null){
						out.println("DB연동 오류");
					}
					else{
						while(rs.next()){
							name=rs.getString("name");
							station=rs.getString("station");
							img=rs.getString("img");
							line=rs.getString("line");
							String s_date=rs.getString("s_date");
							String e_date=rs.getString("e_date");
							id=Integer.parseInt(rs.getString("id"));
						%>				
							<!-- DB에서 불러오기 -->
							<div class="col-md-6 col-sm-12 col-xs-12">
		                        <div class="grid center-block">
		                        	<a href="festival_details.jsp?id=<%=id %>">
		                            <figure class="effect-zoe">
		                                <img src="<%=img %>" class="img-responsive center-block" style="width:800px;height:400px;">
		                                <figcaption>
		                                    <h2><%=name %></h2>
		                                    <p class="description">축제기간 : <%=s_date %>~<%=e_date %></p>
		                                </figcaption>           
		                            </figure>
		                            </a>
		                        </div>
		                    </div>
						<% } %>					
					<%} %>		
					<%if (num==0){%>
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
						  <tr><td colspan="4" height="5"></td></tr>
						  <tr>
							<td align="center">
								<%
									if(pg>BLOCK) {
								%>
									[<a href="festival.jsp?pg=1">◀◀</a>]
									[<a href="festival.jsp?pg=<%=startPage-1%>">◀</a>]
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
											<a href="festival.jsp?pg=<%=i %>">[<%=i %>]</a>
								<%
										}
									}
								%>
								
								<%
									if(endPage<allPage){
								%>
									[<a href="festival.jsp?pg=<%=endPage+1%>">▶</a>]
									[<a href="festival.jsp?pg=<%=allPage%>">▶▶</a>]
								<%
									}
								%>
								</td>
								</tr>
								  <tr align="center">
						  </tr> 
						</table>
					<%}else{ }%>			
				</div>
			</div>
		</div>
        <!-- JavaScript -->
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.parallax-1.1.3.js"></script>
    </body>
</html>
