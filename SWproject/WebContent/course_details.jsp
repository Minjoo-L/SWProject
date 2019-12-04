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

        <title>Festival Metro</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Add custom CSS here -->
        <link href="css/style.css" rel="stylesheet">
       
    </head>

    <body>
        
        <%@ include file = "sidemenubar.jsp" %>
        <%
        String login_user = (String)session.getAttribute("user_id");  // 현재 로그인한 사용자 아이디 가져오기 
		ResultSet rs =null;
    	ResultSet m = null;
		int i = 0;
	 	String c_name ="", c_theme ="", firplace_name ="", secplace_name="",thrplace_name="", forplace_name="";
	 	String id = "";
	 	request.setCharacterEncoding("utf-8");
	 	//where조건을 이제는 게시글 제목으로 찾는걸로 바꾸기 
         id = request.getParameter("id");
	 	String sql = "select c_name, c_theme, firplace_name, secplace_name, thrplace_name, forplace_name from courses where id=";
         sql += id;
	 	rs = DB.getResult(sql);
	 	String[][] item = new String[4][13];
        while(rs.next()){
            c_name = rs.getString(1);
            c_theme = rs.getString(2);
            firplace_name = rs.getString(3);
            secplace_name = rs.getString(4);
            thrplace_name = rs.getString(5);
            forplace_name = rs.getString(6);
        }
        String[] attractionName = new String[4];
        attractionName[0] = firplace_name;
        attractionName[1] = secplace_name;
        attractionName[2] = thrplace_name;
        attractionName[3] = forplace_name;
        
        String extractAT = "";
        i = 0;
	%>
    <%-- header --%>
    <section class="page-title bg-2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h1><%= c_name %></h1>
						<p><%=c_theme%></p>
					</div>
				</div>
			</div>
		</div>
	</section>
    <section class="page-wrapper">
		<div class="container">
            <div class="row">
				<div class="col-md-12">
                    <div class="post-meta">    <%-- type --%>
                        <ul>
                            <li>
                                코스 >
                        <%for(i = 0; i < 4; i++){
                            %>
                            <a href="">&gt <%=attractionName[i]%></a>
                        <%
                        }
                        %>
                             </li>
                        </ul>
                    </div>
                    <%
                    int x;
                    String[] title = {"", "연락처", "주소", "가까운 역", "", "운영 시간", "휴무일", "이용 요금", "비고", "테마"};
                    for(i = 0; i < 4; i++){
                        sql = "select * from attraction where name=\"";
                        extractAT = sql + attractionName[i] + "\"";
                        
                        //System.out.println(extractAT);
                        m = DB.getResult(extractAT);
                        m.next();
                        //System.out.println(m);
                        x = m.getInt(1);
                        for(int j = 2; j < 15; j++){
                            item[i][j-2] = m.getString(j);
                        }
                    %>
					<div class="post post-single">
						<h2><%=item[i][0]%></h2>
						
						<div class="post-thumb">   <%-- img --%>
							<img class="img-responsive" src="<%=item[i][10] %>" alt="">
						</div>
						<div class="post-content post-excerpt">   <%-- content --%>
							<blockquote class="quote-post">
								<p>상세 설명</p>
							</blockquote>
							<p><%=item[i][4]%></p>
							<pre>
                            <%
						        for(int j = 1; j < 10; j++){
							        if (j != 4 && item[i][j] != null && !item[i][j].equals("없음")){
						            %>
							        <%=title[j] %>&nbsp&nbsp<%=item[i][j] %>
						            <%
                                    }
						        }
						    %>
							</pre>
                            <hr>
						</div>
					</div>
                    <%}%>
                    <div class="map" id="map" style="height :300px;">
			        </div>
                    <br><br>
                    <%-- review --%>
                    <div class="post-comments-form">   
                        <h3 class="post-sub-heading">후기</h3>
                        <div class="row">
                            <%
                            
                            sql = "select * from review_test where kind = 'courses' and posting_id = "+id;
                            rs =DB.getResult(sql);
                            if (!rs.isBeforeFirst()){
                            %>
                                <p>&nbsp&nbsp&nbsp후기가 없습니다 </p>
                            <% 
                            }
                            while (rs.next()){
                                String user_id = rs.getString("user_id");
                                String score = rs.getString("score");
                                String content = rs.getString("content");
                                String time = rs.getString("time");
                                
                                String date = time.substring(0,10);
                                String tt = time.substring(11,19);
                        %>
                            <!-- 	 for (let data of results){ -->
                            <div class="col-md-6 form-group">
                                <!-- Name -->
                                <div class=" from-group col-md-12">
                                <form method="post" action="reviewDeleteAction.jsp" id="form" role="form">

                                    <%
                                    if(login_user.equals(user_id) && login_user != ""){
                                    %>
                                    <button type="submit" class="btn btn-main "
                                        style="float: right;">삭제</button>
                                    <%
                                    }%>
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
                        <jsp:param name="c_name" value="<%=c_name %>" />
                        <jsp:param name="id" value="<%=id %>" />
                        <jsp:param name="kind" value="courses" />
                    </jsp:include>
                </div>
            </div>
		</div>
	</section>
        <!-- JavaScript -->
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.parallax-1.1.3.js"></script>
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
		<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyARcEHteaJgu_O31yzWXJsj_43ncEZaZcI&callback=initMap">
			</script>
        <script >
        function initMap() {
			var locations = Array();
            var Coordinates = [];
            var MarkersArray = [];
            var travelPathArray = [];
            var init_x_coord = 0;
            var init_y_coord = 0;

            locations = [
                ["<%=item[0][0]%>", <%=item[0][11]%>, <%=item[0][12]%>],
                ["<%=item[1][0]%>", <%=item[1][11]%>, <%=item[1][12]%>],
                ["<%=item[2][0]%>", <%=item[2][11]%>, <%=item[2][12]%>],
                ["<%=item[3][0]%>", <%=item[3][11]%>, <%=item[3][12]%>],
            ];
            for(var i = 0; i < locations.length; i++){
                init_x_coord += locations[i][1];
                init_y_coord += locations[i][2];
                Coordinates.push({lat: locations[i][1], lng: locations[i][2]});
            }
            init_x_coord /= 4;
            init_y_coord /= 4;
            var init_coord = {lat: init_x_coord, lng: init_y_coord};
            
            var map = new google.maps.Map(
                document.getElementById('map'), {
                    zoom: 14,
                    center: init_coord,
                    });
             
            var infowindow = new google.maps.InfoWindow();
            
            var marker, i;
            for(i = 0; i < locations.length; i++){
                marker = new google.maps.Marker({
                    id : i,
                    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                    map: map
                });
                
                google.maps.event.addListener(marker, 'click', (function(marker, i) {
                    return function() {
                        infowindow.setContent(locations[i][0]);
                        infowindow.open(map, marker);
                    }
                })(marker, i));
            }
            var flightPath = new google.maps.Polyline({
                path: Coordinates,
                geodesic: true,
                strokeColor: '#FF0000',
                strokeOpacity: 1.0,
                strokeWeight: 2
            });
            flightPath.setMap(map);

        }</script>
    </body>
</html>
