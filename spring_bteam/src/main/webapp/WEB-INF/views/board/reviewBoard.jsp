<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용후기</title>
</head>
<body>
<div id="reviewPhoto">
<p>포토리뷰</p>
<p>미완성입니다.</p>
<c:forEach items="${page.list}" var="bvo">	
<c:if test="${bvo.board_filename ne null }">
<img alt="리뷰사진" src="/ContextPath${bvo.board_filepath }/">
</c:if>
</c:forEach>
</div>
<div id="reviewList">
<p>전체리뷰</p>
<a class="btn_fill right" href="reviewWrite">후기작성하기</a>
<table>
<tr><th>작성자</th>
	<th>리뷰</th>
	<th>작성일</th>
	<th>좋아요</th>
</tr>
<c:forEach items="${page.list}" var="bvo">	
<tr><td>${bvo.board_nickname }</td>
	<td class="left">
		<a id="board_title" onclick="review_detail()">${bvo.board_title }</a>
		<div id="board_content" style="display: none; text-align: left" >
			${bvo.board_content }<br/>
			<a class="right" href="" onclick="">좋아요</a>
		</div>
	</td>
	<td>${bvo.board_date }</td>
	<td><i class="fas fa-heart" color="#ff0044"></i>${bvo.board_like }</td>
</tr>
</c:forEach>
</table>
<div class="btnSet">
<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>
</div>
<script type="text/javascript">
function review_detail(){
	$('#board_content').toggle();
}
</script>
</body>
</html>