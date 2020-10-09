<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${login_info eq null}">
<script>
	alert("로그인이 필요한 페이지 입니다.");
	location.href = "login";
</script>
</c:if>
</head>
<body>
<h3>${vo.order_name }님의 주문이 완료되었습니다.</h3>
<table id="order_info">
<tr><td colspan="2" class="left">주문정보</td></tr>
<tr><th class="w-px100">주문번호</th>
	<td>${vo.order_num }</td>
</tr>
<tr><th>제품명</th>
	<td>${vo.order_product }(${vo.order_color })</td>
</tr>	
<tr><th>구매수량</th>
	<td>${vo.order_count}</td>
</tr>	
<tr><th>구매금액</th>
	<td>${vo.order_amount}</td>
</tr>	
<tr><th>결제방법</th>
	<td>${vo.order_pay}</td>
</tr>	
<tr><td colspan="2" class="left">주문자정보</th></tr>	
<tr><th>이름</th>
	<td>${vo.order_name }</td>
</tr>	
<tr><th>전화번호</th>
	<td>${vo.order_phone }</td>
</tr>	
<tr><th>이메일</th>
	<td>${vo.order_email }</td>
</tr>	
<tr><td colspan="2" class="left">배송정보</th></tr>
<tr><th>이름</th>
	<td>${vo.deliv_name }</td>
</tr>			
<tr><th>전화번호</th>
	<td>${vo.deliv_phone }</td>
</tr>	
<tr><th>주소</th>
	<td>( ${vo.deliv_zipcode } ) ${vo.deliv_address } ${vo.deliv_detailaddress } 
	</td>
</tr>	
<tr><th>배송메모</th>
	<td>${vo.deliv_memo }</td>
</tr>	
</table>
</body>
</html>