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
					<input type="text" name="order_name" id="order_name" class="need input_short" title="주문하신 분의 이름"
							value="${login_info.user_nickname }"/>&nbsp;
					<input type="text" name="order_phone" id="order_phone" class="need input_short" title="주문하신 분의 전화번호"
							value="${login_info.user_phone }"/><br/>
					<input type="text" name="order_email" id="order_email" class="need input_long" title="주문하신 분의 이메일"
							value="${login_info.user_email }"/><br/>
				</div>
			</c:if>
			<c:if test="${empty login_info }">
				<div>
					<h4>주문자</h4>
					<input type="text" name="order_name" id="order_name" class="need input_short" title="주문하신 분의 이름"
							placeholder="이름"/>&nbsp;
					<input type="text" name="order_phone" id="order_phone" class="need input_short" title="주문하신 분의 전화번호"
							placeholder="연락처 (ex 010-0000-0000)"/><br/>
					<input type="text" name="order_email" id="order_email" class="need input_long" title="주문하신 분의 이메일"
							placeholder="이메일"/><br/>
				</div>
			</c:if>
			<div>
				<h4>배송지 정보</h4>
				<input type="text" name="deliv_name" id="deliv_name" class="need input_short" title="받으시는 분의 이름"
						placeholder="이름" value="${login_info.user_nickname }"/>&nbsp;
				<input type="text" name="deliv_phone" id="deliv_phone" class="need input_short" title="받으시는 분의 전화번호"
						placeholder="연락처 (ex 010-0000-0000)" value="${login_info.user_phone }"/><br/>
				<label id="postcodify_search_button" style="float: left;">		
				<input type="text" name="deliv_zipcode" class="postcodify_postcode5 need input_short" title="받으시는 분의 주소"   
						placeholder="우편번호" value="${login_info.user_zipcode }" readonly="readonly" />
				<a class="btn-fill">우편번호 검색</a><br/></label>
				<input type="text" name="deliv_address" class="postcodify_address input_long"
						placeholder="주소" value="${login_info.user_address }" /><br/>
				<input type="text" name="detail_address" class="postcodify_details input_long" 
						value="${login_info.detail_address }" placeholder="상세주소" />
			</div>
			
			<div>
				<h4>배송메모</h4>
				<select id="delivMemo" name="deliv_memo" class="input_long">
					<option value="없음" selected>없음</option>
					<option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
					<option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요.</option>
					<option value="부재시 전화나 문자를 남겨주세요.">부재시 전화나 문자를 남겨주세요.</option>
					<option value="" >직접입력</option>
				</select><br/>
				<div id="memoInput" style="display: none;">
					<input type="text" id="input_memo" class="input_long" placeholder="배송메모를 입력해주세요"/>
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
							<option value="1" selected="selected">1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
						<select class="option" name="order_color">
							<option value="Black" selected="selected">Black</option>
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
				<input type="hidden" name="order_amount" value="12500"/>
			</div>
			
			<div id="buttons">
				<p class="button" onclick="go_payment('bank')">무통장 입금</p>
				<p class="button" onclick="go_payment('card')">신용카드 결제</p>
				<p class="button" onclick="go_payment('phone')">휴대폰 결제</p>
			</div>
		</div>
	</div>
</div>
</form>
<script type="text/javascript">
function check_input(){

	var kor = /^[가-힣]{2,5}$/;
	var phone = /^[0-9]{8,12}$/;
	var email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	
	if( !kor.test($('#order_name')) ){
		alert('이름은 한글로 2~5자만 입력가능합니다.');
		$('#order_name').val('');
		$('#order_name').focus();
		return false;
	}else if(!kor.test($('#deliv_name'))){
		alert('이름은 한글로 2~5자만 입력가능합니다.');
		$('#deliv_name').val('');
		$('#deliv_name').focus();
		return;
	}else if( !phone.test($('#order_phone')) ){
		alert('전화번호는 숫자로 8~12자만 입력가능합니다.');
		$('#order_phone').val('');
		$('#order_phone').focus();
		return;
	}else if( !phone.test($('#deliv_phone')) ){
		alert('전화번호는 숫자로 8~12자만 입력가능합니다.');
		$('#deliv_phone').val('');
		$('#deliv_phone').focus();
		return;
	}else if( !email.test($('#order_email')) ){
		alert('이메일 형식을 확인해주세요.');
		$('#order_email').focus();
		return;
	}		
	return true;
}
</script>
<script type="text/javascript">
$('select#delivMemo').on('change', function(){
	var state = $('#delivMemo option:selected').val();
	
	if(state == ''){
		$('#memoInput').css('display','block');
	}else{
		$('#memoInput').css('display','none');
		$('#input_memo').val('');
	}
});

$(document).on('change', '.quantity', function(){
	var total = $('.quantity').val() * 10000;
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

function go_payment(method){

	if($('#input_memo').val() != ''){
		var input_memo = $('#input_memo').val();
		$('select#delivMemo option:selected').val(input_memo);
	}
	
	if(method == 'bank'){
		if(necessary()){
			$('form').append('<input type="hidden" name="order_pay" value="bank"/>');
			$('form').submit();
		}
	} else if(method == 'card' || method == 'phone'){
		alert(method + ' 결제 방식은 가상으로 진행됩니다.');
		$('form').append('<input type="hidden" name="order_pay" value="'+ method +'"/>');
		$('form').submit();
	}
}
</script>
<script type="text/javascript" src="js/need_check.js"></script>
</body>
</html>
