<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<div>
<form action="boardUpdate" method="post">
<input type="hidden" name="board_email" value="${bvo.board_email }"/>
<table border="1px solid #ccc">
	<tr>
		<th>제목</th>
		<td><input type="text" value="${bvo.board_title }"/></td>
		<th>작성자</th>
		<td>${bvo.board_nickname }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="3">
			<textarea rows="5" cols="20" >${bvo.board_content}</textarea>
		</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td colspan="3">
			<c:if test="${empty bvo.board_file }">
				<input type="file" name="board_file" value=""/>
			</c:if>
			<c:if test="${not empty bvo.board_file }">
				<a href="">${bvo.board_file }</a><input type="file" name="board_file" value="변경"/>
			</c:if>
		</td>
	</tr>
	<tr align="center">
		<td colspan="4">
			<a onclick="$('form').submit">수정</a>
			<a onclick="history.go(-1)">취소</a>
		</td>
	</tr>
</table>
</form>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>