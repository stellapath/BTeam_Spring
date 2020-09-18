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
<div class="container">
<form action="boardUpdateReq" method="get" enctype="multipart/form-data">
<input type="hidden" name="board_num" value="${bvo.board_num }"/>
<table>
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
			<c:if test="${empty bvo.board_filename }">
				<input type="file" name="board_filename" value=""/>
			</c:if>
			<c:if test="${not empty bvo.board_filename }">
				${bvo.board_filename }<input type="file" name="board_filename" value=""/>
			</c:if>
		</td>
	</tr>
</table><br/>
</form>
<div class="btnSet">
	<a class="btn_fill" onclick="$('form').submit()">수정</a>
	<a class="btn_empty" onclick="javascript:if( confirm('수정을 취소하시겠습니까?') ){href='boardView?board_num=${bvo.board_num}&board_category=0'}">취소</a>
</div>
</div>
</body>
</html>