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
<title>공지사항</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<div class="container" align="center">
<table border="1px solid #ccc" style="text-align: center;">
	<tr>
		<th>글제목</th>
		<th>작성일</th>
		<th>작성자</th>
		<th>좋아요</th>
	</tr>
	<c:forEach items="${list}" var="bvo">
	<tr>
		<td><a href="boardView?board_num=${bvo.board_num }&board_category=0">${bvo.board_title}</a></td>
		<td>${bvo.board_date}</td>
		<td>${bvo.board_nickname}</td>
		<td>${bvo.board_like}</td>
	</tr>
	</c:forEach>
</table>
<c:if test="${login_info.user_email eq 'admin'}">
<a href="boardWrite?board_category=0">글작성</a>
</c:if>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>