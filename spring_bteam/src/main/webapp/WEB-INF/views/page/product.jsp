<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품소개</title>
<style type="text/css">
#btnOrder{
	width: 200px;
	padding: 20px;
 	position: absolute;
 	border-radius: 10px;
	right: 10%;
	bottom: 10%;
/* 	background-color: rgba( 255, 255, 255, 0.5 ); */
	background-color: rgba( 235, 64, 52, 0.5 );
}
</style>
</head>
<body>
<div>
<h3>제품소개해주세요</h3>
</div>
<div id="btnOrder">
	<c:if test="${login_info eq null}">
		<p>회원가입하시고 각종 쿠폰을 받으세요!!</p>
		<a class="btn_fill" href="signup">회원가입먼저하기</a><br/>
		<a class="btn_fill" href="orderPage">제품구매하러가기</a>
	</c:if>
	<c:if test="${login_info ne null}">
		<a class="btn_fill" href="orderPage">제품구매하러가기</a>
	</c:if>
</div>

</body>

</html>