<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr><th>유형</th>
	<td>테이블을 새로 만들어야 하는건가아아아아아</td>
</tr>
<tr><th>제목</th>
	<td><input type="text" name="board_title"/></td>
</tr>
<tr><th>이메일</th>
	<c:if test="${login_info eq null }">
		<td><input type="text" placeholder="답변을 받을 이메일을 작성하세요."/></td>
	</c:if>
	<c:if test="${login_info ne null }">
		<td>사용자이메일</td>
	</c:if>
</tr>
<tr><th>내용</th>
	<td><textarea name="board_content"></textarea></td>
</tr>
<tr><th>첨부파일</th>
	<td>파일작업하기</td>
</tr>
</table>
<div class="btnSet">
	<a class="btn_fill" onclick="">등록</a>
	<a class="btn_fill" onclick="">취소</a>
</div>
</body>
</html>