<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
 .menubar{
       list-style-type:none;
       margin:0;
       padding:0;
       overflow:hidden;
       background-color:#1F5F61;
       
    }
  
   
    li.h a.h{
       display:block;
       color:white;
       text-align:center;
       padding:20px;
       text-decoration:none;
       float:left;
    }
   
   li.h a.h:hover{ background-color: rgba(75, 194, 184, 1);} // 마우스 올렸을때 색깔 변화
</style>
<body>
      <%
   		 String userid = (String)session.getAttribute("user_id");  // 현재 로그인한 사용자 아이디 가져오기 
    %>
        <!-- Side Menu -->
         <ul class="menubar">
     		 <li class="h"><a class="h" href="main.jsp"><b>FestivalMetro</b></a></li>
      		<li class="h"><a class="h" href="main.jsp">Home</a>
      		<li class="h"><a class="h" href="line.jsp">호선별 즐길거리</a></li>
      		 <li class="h"><a class="h" href="theme.jsp">테마별 즐길거리</a></li>
      		<li class="h"><a class="h" href="course.jsp">추천코스</a></li>
      		<li class="h"><a class="h" href="message.jsp">쪽지 보내기</a></li>
             <% if("admin".equals(userid) && userid != null){%>
             <li class = "h"><a class="h"  href="addCourses.jsp">코스 추가 </a></li>
             <li class = "h"><a class = "h" href="deleteReview.jsp">후기 삭제  </a></li>
             <% } 
                if(userid == null){%>
                	<li class = "h"><a class="h"  href="login.jsp">로그인  </a></li>
               <% 
                } else {
                %>
                <li class = "h"><a class="h"  href="logout.jsp"> 로그아웃 </a></li>
                <% } %>
            </ul>
        </body>
       