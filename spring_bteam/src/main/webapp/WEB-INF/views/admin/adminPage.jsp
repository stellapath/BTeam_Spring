<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<c:if test="${login_info.user_email ne 'admin'}">
<script>
alert("관리자전용 페이지입니다.");
history.back();
</script>
</c:if>
</head>
<body>
<div class="bigBtn">
	<a href="userList">고객관리</a><br/>
	<a href="productList">제품등록 및 관리</a><br/>
	<a href="orderList">주문관리</a><br/>
	<a href="qnaList">문의관리</a>
</div>
</body>
</html>