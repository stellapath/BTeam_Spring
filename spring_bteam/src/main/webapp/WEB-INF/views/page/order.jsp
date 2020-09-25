<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<div>
	<h2>결제하기</h2>
	<div id="order">
		<div id="orderForm">
			<h4>주문/배송 정보</h4>
			<div>
				<h4>주문자</h4>
				<input type="text" name="user_name" id="user_name" placeholder="이름" required="required"/>&nbsp;
				<input type="text" name="user_phone" id="user_phone" placeholder="연락처 (ex 010-0000-0000)" required="required"/><br/>
				<input type="text" name="user_email" id="user_email" placeholder="이메일" required="required"/><br/>
			</div>
			
			<div>
				<h4>배송지 정보</h4>
				<input type="text" name="user_name" id="user_name" placeholder="이름" required="required"/>&nbsp;
				<input type="text" name="user_phone" id="user_phone" placeholder="연락처 (ex 010-0000-0000)" required="required"/><br/>
				<input type="text" name="user_zipcode" class="postcodify_postcode5" placeholder="우편번호" />
				<a class="btn-fill" id="postcodify_search_button">우편번호 검색</a><br/>
				<input type="text" name="user_address" class="postcodify_address" placeholder="주소" /><br/>
				<input type="text" name="detail_address" class="postcodify_details" placeholder="상세주소" />
			</div>
			
			<div>
				<h4>배송메모</h4>
				<select class="deliv_select">
					<option>없음</option>
					<option>배송 전에 미리 연락 바랍니다.</option>
					<option>부재시 경비실에 맡겨주세요.</option>
					<option>부재시 전화나 문자를 남겨주세요.</option>
					<option>직접입력</option>
				</select><br/>
				<input type="text" name="memo" class="deliv_memo" placeholder="배송메모를 입력해주세요"/>
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
						<select class="quantity">
							<option>1개</option>
							<option>2개</option>
							<option>3개</option>
							<option>4개</option>
							<option>5개</option>
						</select>
						<select class="option">
							<option>Black</option>
							<option>Red</option>
						</select>
					</li>
				</ul>
			</div><hr>
			
			<div id="goods_price">
				<label for="price">상품가격</label>&nbsp;&nbsp;
				<p class="price">50,000원</p>
			</div>
			
			<div id="goods_delivery">
				<label for="delivery">배송비</label>&nbsp;&nbsp;
				<p class="delivery">무료</p>
			</div><hr>
			
			<div id="totalPayment">
				<label for="delivery">총 결제금액</label>&nbsp;&nbsp;
				<p class="payment">50,000원</p>
			</div>
			
			<div id="buttons">
				<p href="#" class="button">무통장 입금</p>
				<p href="#" class="button">신용카드 결제</p>
				<p href="#" class="button">휴대폰 결제</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>
