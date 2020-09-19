<%@ page import="com.project.bteam.board.BoardVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
BoardVO bvo = (BoardVO) session.getAttribute("boardList");
pageContext.setAttribute("bvo", bvo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용후기</title>
</head>
<body>
<a class="btn_fill" href="reviewWrite">후기작성하기</a>
<div id="photoReview">
<p>포토리뷰</p>
</div>
<div id="lineReview">
<p>한줄리뷰</p>
<table>
<tr><th>작성자</th>
	<th>리뷰</th>
	<th>작성일</th>
	<th>좋아요</th>
</tr>
<c:forEach items="${list}" var="bvo">	
<tr><td>${bvo.board_nickname }</td>
	<td class="left">
		<a id="board_title">${bvo.board_title }</a>
		<div id="board_content" style="display: none;">
			${bvo.board_content }<br/>
			<a href="">좋아요</a>
		</div>
	</td>
	<td>${bvo.board_date }</td>
	<td><i class="fas fa-heart" color="#ff0044"></i>${bvo.board_like }</td>
</tr>
</c:forEach>
</table>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$(".board_title").click(function(){ 
		if($(this).next().is(":visible")){ 
			$(this).next().slideUp(); 
		}else{ 
			$(this).next().slideDown(); 
		} 
	});
});	
</script>
</body>
</html>