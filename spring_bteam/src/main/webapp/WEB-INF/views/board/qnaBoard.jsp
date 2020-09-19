<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
</head>
<body>
<div>
<h3>자주하는 질문</h3>
<table>
<tr><th>질문유형</th>
	<th>질문</th>
</tr>
<c:forEach items="${list }" var="bvo">

</c:forEach>
</table>
</div>
<a href="">나의 문의내역</a>
<a href="qnaWrite?user_email?${login_info.user_email }">일대일 문의하기</a>
</body>
</html>