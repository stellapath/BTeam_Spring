<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<c:if test="${login_info.user_email ne 'admin'}">
<script>
alert("관리자전용 페이지입니다.");
history.back();
</script>
</c:if>
</head>
<body>
<table>
<tr><th>회원번호</th>
	<th>닉네임</th>
	<th>이메일</th>
	<th>생일</th>
	<th>제품구매여부</th>
</tr>
<c:forEach items="${list}" var="vo">	
<tr><td>${vo.user_num }</td>
	<td>${vo.user_nickname }</td>
	<td>${vo.user_email }</td>
	<td>${vo.user_birth }</td>
	<td></td>
</tr>
</c:forEach>
</table>
</body>
</html>