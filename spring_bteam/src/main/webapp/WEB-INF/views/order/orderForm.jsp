<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서 작성</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 주소입력 -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<link rel='stylesheet' type='text/css' href='css/orderForm.css?v=1<%= new java.util.Date().getTime()%>'>
</head>
<body>
<form action="orderReq" method="post">
<div>
	<h2>결제하기</h2>
	<div id="order">
		<div id="orderForm">
			<h4>주문/배송 정보</h4>
			<c:if test="${!empty login_info }">
				<div>
					<h4>주문자</h4>
					<input type="text" name="order_name" id="order_name" value="${login_info.user_nickname }" required="required"/>&nbsp;
					<input type="text" name="order_phone" id="order_phone" value="${login_info.user_phone }" required="required"/><br/>
					<input type="text" name="order_email" id="order_email" value="${login_info.user_email }" required="required"/><br/>
				</div>
			</c:if>
			<c:if test="${empty login_info }">
				<div>
					<h4>주문자</h4>
					<input type="text" name="order_name" id="order_name" placeholder="이름" required="required"/>&nbsp;
					<input type="text" name="order_phone" id="order_phone" placeholder="연락처 (ex 010-0000-0000)" required="required"/><br/>
					<input type="text" name="order_email" id="order_email" placeholder="이메일" required="required"/><br/>
				</div>
			</c:if>
			<div>
				<h4>배송지 정보</h4>
				<input type="text" name="deliv_name" id="deliv_name" placeholder="이름" required="required"/>&nbsp;
				<input type="text" name="deliv_phone" id="deliv_phone" placeholder="연락처 (ex 010-0000-0000)" value="${login_info.user_phone }" required="required"/><br/>
				<input type="text" name="deliv_zipcode" class="postcodify_postcode5" value="${login_info.user_zipcode }" placeholder="우편번호" />
				<a class="btn-fill" id="postcodify_search_button">우편번호 검색</a><br/>
				<input type="text" name="deliv_address" class="postcodify_address" value="${login_info.user_address }" placeholder="주소" /><br/>
				<input type="text" name="detail_address" class="postcodify_details" value="${login_info.detail_address }" placeholder="상세주소" />
			</div>
			
			<div>
				<h4>배송메모</h4>
				<select id="delivMemo" name="deliv_memo">
					<option value="없음">없음</option>
					<option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
					<option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요.</option>
					<option value="부재시 전화나 문자를 남겨주세요.">부재시 전화나 문자를 남겨주세요.</option>
					<option value="직접입력">직접입력</option>
				</select><br/>
				<div id="memoInput" style="display: none;">
					<input type="text" name="deliv_memo" class="deliv_memo" placeholder="배송메모를 입력해주세요"/>
				</div>
			</div>
		</div>
		<div id="payForm">
			<h4>주문 상품 정보</h4>
			<div id="detail">
				<ul>
					<li class="goods_img">
						<a href="productPage"><img src="img/pic_1.jpg"/></a>
					</li>
					<li class="goods_detail">
						<h4>★☆분실방지-스마트우산☆★</h4>
						<select class="quantity" name="order_count">
							<option value="1">1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
						<select class="option" name="order_color">
							<option value="Black">Black</option>
							<option value="Red">Red</option>
						</select>
					</li>
				</ul>
			</div><hr>
			
			<div id="goods_price">
				<label for="price">상품가격</label>&nbsp;&nbsp;
				<p class="price">10000</p>
			</div>
			
			<div id="goods_delivery">
				<label for="delivery">배송비</label>&nbsp;&nbsp;
				<p class="delivery">2,500</p>
				<p class="delivery_info"></p>
			</div><hr>
			
			<div id="totalPayment">
				<label for="payment">총 결제금액</label>&nbsp;&nbsp;
				<p class="payment">12500</p>
				<input type="hidden" name="order_amount"/>
			</div>
			
			<div id="buttons">
				<p class="button" onclick="pay_bank()">무통장 입금</p>
				<p href="#" class="button">신용카드 결제</p>
				<p href="#" class="button">휴대폰 결제</p>
			</div>
		</div>
	</div>
</div>
</form>
<script type="text/javascript">
// function addComma(value){
//     value = value.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
//     return value; 
// }

$(document).on('change', '.quantity', function(){
	var total = $('.quantity').val() * 10000;
// 	total = addComma(total);
//	alert(total);
  	$('p.price').text(total);
  	if(total >= 30000){
  	 	$('p.delivery').text('무료');
 	 	$('p.payment').text(total);
  	 	$('p.delivery_info').text('');
	  	$('input[name="order_amount"]').attr('value', total);
  	}else{
  	 	$('p.delivery').text('2,500');
  	 	$('p.delivery_info').text('* 3만원이상 배송비 무료');
 	 	$('p.payment').text(total + 2500);
 	 	
	  	$('input[name="order_amount"]').attr('value', total+2500);
  	}
});

function pay_bank(){
	$('form').append('<input type="hidden" name="order_pay" value="card"/>');
	$('form').submit();
	alert('주문이 완료되었습니다.');
}
</script>
</body>
</html>
