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
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
<style>
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
    footer{
	background-color:#E8F5FF;
	}
	
</style>
    </head>

    <body>
        
        <%@ include file = "sidemenubar.jsp" %>
        <%
		ResultSet rs =null;
    	ResultSet m = null;
		int i = 0;
	 	String c_name ="", c_theme ="", firplace_name ="", secplace_name="",thrplace_name="", forplace_name="";
	 	int id = 0;
	 	request.setCharacterEncoding("utf-8");
	 	//where조건을 이제는 게시글 제목으로 찾는걸로 바꾸기 
	 	String sql = "select firplace_name, secplace_name, thrplace_name, forplace_name from courses where id=6";
	 	rs = DB.getResult(sql);
	 	String[][] item = new String[4][13];
	%>
        <!-- Portfolio -->
        <div id="places" class="places">
            <div class="container">
				<table width="100%">
						<tr>
							<td><p algn="left"><a href="/theme"><button type="button" class="btn1">before</button></a></p></td>
							<td><p algn="right"><a href="/message"><button type="button" class="btn1">next</button></a></p></td>
						</tr>
				</table>
                <div class="row">
                    <div class="col-md-4 col-md-offset-4 text-center">
                        <h2 class="main-title">추천 코스</h2>
                        <hr>
                    </div>
                </div>
            </div>  
            <div class="divide50">
			</div>  
            <div class="container">
            <% 
            while(rs.next()){
				/* c_name = rs.getString(1);
				c_theme = rs.getString(2); */
				firplace_name = rs.getString(1);
				secplace_name = rs.getString(2);
				thrplace_name = rs.getString(3);
				forplace_name = rs.getString(4);
            }
           	String[] attractionName = new String[4];
            attractionName[0] = firplace_name;
            attractionName[1] = secplace_name;
            attractionName[2] = thrplace_name;
            attractionName[3] = forplace_name;
            
            
           		String extractAT = "";
           		i = 0;
		 		%>
            	<h3><%=c_name %></h3>
				<h4><%=c_theme %></h4>
				
				<table border = "5" width="90%" height="300px" algn="center">
           		
		 		<%
		 		 int x;
				String[] title = {"", "연락처", "주소", "가까운 역", "<hr>", "운영 시간", "휴무일", "이용 요금", "비고", "테마"};
           		for(i = 0; i < 4; i++){
           			
           			sql = "select * from attraction where name=\"";
           			extractAT = sql + attractionName[i] + "\"";
           			
           			System.out.println(extractAT);
               		m = DB.getResult(extractAT);
               		m.next();
               		System.out.println(m);
               		x = m.getInt(1);
					for(int j = 2; j < 15; j++){
						item[i][j-2] = m.getString(j);
					}

       			%>
				     <tr>
				 		<td>
						<img src="<%=item[i][10] %>" alt="error" height="400" width="400" align="middle"/>
						</td>
						
						<td >
						<%
						for(int j = 0; j < 10; j++){
							if (item[i][j] != null && !item[i][j].equals("없음")){
						%>
						<p>
							<%=title[j] %>
							<br>
							<%=item[i][j] %>
							</p>
						<%}
						}
						%>
						</td>
				 	</tr>          			
           		<%
           		}
           		%>
				 </table>
				 	
				<br>
				<br>
				
				<div class="map" id="map" style="height :300px;">
				</div>
				<div>
				<%-- <% 
					
				
					int id, ref=0;
					String name="", station="", img="";
					Connection conn=null;
					Statement stmt=null;
					ResultSet rs=null;
					
					String sql="select * from attraction";
					rs=DB.getResult(sql);
					if(rs==null){
						out.println("DB연동 오류");
					}
					while(rs.next()){
						name=rs.getString("name");
						station=rs.getString("station");
						img=rs.getString("img");
						System.out.println(name);
					}
				 %> --%>

				</div>
            </div>
        </div>

        <!-- /Portfolio -->

        <!-- Call to Action -->
        <div class="call-to-action">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 text-center">
                        <h3>We provide online booking</h3>
                        <a href="#" class="btn booking-btn text-center" data-toggle="modal" data-target="#booking">Click for Booking !</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Call to Action -->

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
                        <p>Copyright &copy; <a href="https://github.com/Minjoo-L/SWProject">software_project 세일러문조</a>  2019</p>
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
		
		<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyARcEHteaJgu_O31yzWXJsj_43ncEZaZcI&callback=initMap">
			</script>
		
		
        <!-- Custom JavaScript for the Side Menu and Smooth Scrolling -->
        <script>
        function initMap() {
			var locations = Array();
            
            locations.push(["<%=item[0][0]%>", <%=item[0][11]%>, <%=item[0][12]%>]);
            locations.push(["<%=item[1][0]%>", <%=item[1][11]%>, <%=item[1][12]%>]);
            locations.push(["<%=item[2][0]%>", <%=item[2][11]%>, <%=item[2][12]%>]);
            locations.push(["<%=item[3][0]%>", <%=item[3][11]%>, <%=item[3][12]%>]);
            var init_x_coord = (locations[0][1] + locations[1][1] + locations[2][1] + locations[3][1])/4;
            var init_y_coord = (locations[0][2] + locations[1][2] + locations[2][2] + locations[3][2])/4;
        	
            var init_coord = {lat: init_x_coord, lng: init_y_coord};
            
            var map = new google.maps.Map(
                document.getElementById('map'), {zoom: 14, center: init_coord});
             
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
        }</script>
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
