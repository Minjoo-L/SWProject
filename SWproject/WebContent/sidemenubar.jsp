<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <%
   		 String userid = (String)session.getAttribute("user_id");  // 현재 로그인한 사용자 아이디 가져오기 
    %>
        <!-- Side Menu -->
        <a id="menu-toggle" href="#" class="btn btn-primary btn-lg toggle"><i class="fa fa-bars"></i></a>
        
        <div id="sidebar-wrapper">
        
            <ul class="sidebar-nav">
                <li>
                    <a id="menu-close" href="#" class="btn btn-default btn-lg pull-right toggle">
                        <i class="fa fa-times"></i>
                    </a>
                </li>
                <li class="sidebar-brand">
                    <a href="main.jsp">Festival Metro</a>
                    <hr>
                </li>
                <li>
                    <a href="main.jsp">Home</a>
                </li>
                <li>
                    <a href="line.jsp">호선별 즐길거리</a>
                </li>
                <li>
                    <a href="theme.jsp">테마별 즐길거리</a>
                </li>
                <li>
                    <a href="course.jsp">추천 코스</a>
                </li>
                <% if("admin".equals(userid) && userid != null){%>
                <li>
                    <a href="addCourses.jsp">코스 추가 </a>
                </li>
                <li>
                    <a href="deleteReview.jsp">후기 삭제  </a>
                </li>
                <%
                }else{
                %>
                <li>
                    <a href="contact.jsp">Contact</a>
                </li>
                <%} %>
            </ul>

        </div>
       