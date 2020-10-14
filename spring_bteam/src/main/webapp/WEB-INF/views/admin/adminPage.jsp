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
location.href='login';
</script>
</c:if>
</head>
<body>
<div class="pageName">
	<p class="titleName">관리자 페이지</p>
	<div class="titleLine"></div>
</div>
<div id="boxZone">
	<div id="overBox">
		<div class="boxSet overBox leftBox">		
		<a class="lineBox" href="userList"><i class="fas fa-angle-double-right"></i> 고객관리</a><br/>
		</div>
		<div class="boxSet overBox rightBox" style="background-color: #ededed;">
		<a class="lineBox" href="productList"><i class="fas fa-angle-double-right"></i> 제품등록 및 관리</a><br/>
		</div>	
	</div>
	<div id="underBox">
		<div class="boxSet underBox leftBox" style="background-color: #ededed;">
		<a class="lineBox" href="orderList"><i class="fas fa-angle-double-right"></i> 주문관리</a><br/>
		</div>
		<div class="boxSet underBox rightBox">
		<a class="lineBox" href="qnaList"><i class="fas fa-angle-double-right"></i> 문의관리</a>
		</div>
	</div>
</div>
</body>
</html>