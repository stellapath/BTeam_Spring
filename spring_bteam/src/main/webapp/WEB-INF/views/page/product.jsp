<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품소개</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
/* #btnOrder{ */
/* 	width: 200px; */
/* 	padding: 20px; */
/*  	position: absolute; */
/*  	border-radius: 10px; */
/* 	right: 10%; */
/* 	bottom: 10%; */
/* 	background-color: rgba( 235, 64, 52, 0.5 ); */
/* } */
</style>
</head>
<body>
<div>
<h3>제품소개해주세요</h3>
</div>
<div id="btnOrder">
	<a class="btn_fill" onclick="go_order()">제품구매하러가기</a>
</div>
<script type="text/javascript">
function go_order(){
	if('${login_info.user_email}' == ""){
		if(confirm('고객님은 현재 비로그인상태입니다.\n비회원 주문을 진행하시겠습니까?')){
			location.href="order";
		}else return;
	}else location.href="order";
}
</script>
</body>

</html>