<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<table>
	<tr>
		<th>글제목</th>
		<th>작성일</th>
		<th>작성자</th>
		<th>좋아요 수</th>
	</tr>
	<c:forEach items="${list}" var="vo">
	<tr>
		<td>${vo.board_title}</td>
		<td>${vo.board_date}</td>
		<td>${vo.board_nickname}</td>
		<td>${vo.board_like}</td>
	</tr>
	</c:forEach>
</table>
<c:if test="${login_info.user_email eq 'admin'}">
<a href="boardWrite?category=0">글작성</a>
</c:if>
</body>
</html>