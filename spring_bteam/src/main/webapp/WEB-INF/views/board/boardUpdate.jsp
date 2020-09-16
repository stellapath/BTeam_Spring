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
<div align="center">
<form action="boardUpdateReq" method="get" enctype="multipart/form-data">
<input type="hidden" name="board_num" value="${bvo.board_num }"/>
<table border="1px solid #ccc">
	<tr>
		<th>제목</th>
		<td><input type="text" name="board_title" value="${bvo.board_title }"/></td>
		<th>작성자</th>
		<td>${bvo.board_nickname }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="3">
			<textarea rows="5" cols="20" name="board_content" >${bvo.board_content}</textarea>
		</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td colspan="3">
			<c:if test="${empty bvo.board_file }">
				<input type="file" name="board_file" value=""/>
			</c:if>
			<c:if test="${not empty bvo.board_file }">
				${bvo.board_file }<input type="file" name="board_file" value=""/>
			</c:if>
		</td>
	</tr>
</table>
	<div id="buttons">
		<a class="btn-fill" onclick="$('form').submit()">수정</a>
		<a class="btn-fill" onclick="javascript:if( confirm('수정을 취소하시겠습니까?') ){href='boardView?board_num=${bvo.board_num}&board_category=0'}">취소</a>
	</div>
</form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>