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
</head>
<body>
<div id="btnOrder">
	<a class="btn_fill" onclick="go_order()">제품구매하러가기</a>
</div>
<div id="product">
<img alt="제품소개" src="img/product01.jpg">
</div>
<script type="text/javascript">

$(document).ready(function(){

	//움직이는 버튼(주문페이지 이동)
	var floatPosition = parseInt($("#btnOrder").css('top'));

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		//애니메이션없음(위치고정)
		//$("#btnOrder").css('top', newPosition);
		//애니메이션있음(이동효과)
		$("#btnOrder").stop().animate({"top" : newPosition	}, 100);

	}).scroll();
});

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