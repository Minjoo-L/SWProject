
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<div class="post-comments-form">
<h3 class="post-sub-heading">후기 작성</h3>
<%
request.setCharacterEncoding("utf-8");
int id = Integer.parseInt(request.getParameter("id"));
String c_name = request.getParameter("c_name");
String kind = request.getParameter("kind");
%>
<form method="post" action="reviewAction.jsp" id="form" role="form">
	<div class="row">
		<div class="col-md-6 form-group">
			<h3>
				평점 <select name="sortMtd" title="평점" class="optSelect2"
					onchange="$('#sortMethod').val(this.value);fnChgEvalMove(1)">
					<option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="1">1</option>
				</select>
			</h3>
		</div>
		<!-- Comment -->
		<div class="form-group col-md-12">
			<textarea name="review" id="review" class=" form-control" rows="6" placeholder="Comment" maxlength="400"></textarea>
		</div>

		<!-- Send Button -->
		<div class="form-group col-md-12">
			<input type="hidden" name="id" value="<%=id%>"> 
			<input	type="hidden" name="c_name" value="<%= c_name%>">
			<input type = "hidden" name ="kind" value = "<%=kind %>">
			<button type="submit" class="btn btn-main ">완료</button>
		</div>


	</div>

</form>
</div>
