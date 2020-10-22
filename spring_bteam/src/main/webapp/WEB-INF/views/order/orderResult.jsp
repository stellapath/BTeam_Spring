<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" /> 
<style type="text/css">
#orderResult { width: 100%;    margin: 0 auto;    padding: 30px;  }
.infoTitle {text-align: left;}
.infoTitle p{ font-size: 20px; font-weight: bold; margin-bottom: 10px; margin-top: 30px;}
#delivTable td{text-align: left; padding-left: 20px;}
#productInfo {overflow: hidden;}
#productInfo div {float: left;}
#productInfo img {width: 70px;}

</style> 
</head>
<body>
<div class="pageName">
	<p class="subTitleName">${vo.order_name}님의 주문내역</p>
	<div class="titleLine"></div>
</div>
<div id=orderResult>
	<div id="orderInfo">
		<div class="infoTitle"><p><i class="fas fa-poll-h"></i>주문정보</p></div>
		<div id="infoTable" class="infoTable">
			<table>
				<tr><th>주문번호</th><th>주문상품</th><th>결제금액</th><th>상태</th></tr>
				<tr><td>${vo.order_num }</td>
					<td id="productInfo">
						<div>
						<img src="<c:url value='/' />${vo.p_defaultimage_path}" class="defaultImage"/>
						</div>
						<div style="text-align: left;">
						옵션 : ${vo.order_product }<br/>
						색상 : ${vo.order_color }<br/>
						수량 : ${vo.order_count } 개
						</div>
					</td>
					<td><fmt:formatNumber value="${vo.order_amount }" pattern="#,###"/></td>
					<td><c:if test="${vo.order_date < today  }">배송완료</c:if>
						<c:if test="${vo.order_date >= today  }">배송준비중</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="payInfo">
		<div class="infoTitle"><p><i class="fas fa-poll-h"></i>결제정보</p></div>
		<div id="payTable" class="infoTable">
			<table>
				<tr><th>결제방식</th><th>결제일시</th><th>결제금액</th></tr>
				<tr><td>${vo.order_pay }</td>
					<td><c:if test="${vo.order_date < today  }">${vo.order_date}</c:if>
						<c:if test="${vo.order_date >= today  }">
							<c:if test="${vo.order_pay eq '무통장입금' }">입금대기중</c:if>
							<c:if test="${vo.order_pay ne '무통장입금' }">${ vo.order_date}</c:if>
						</c:if>
					</td>
					<td><fmt:formatNumber value="${vo.order_amount }" pattern="#,###"/></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="delivInfo">
		<div class="infoTitle"><p><i class="fas fa-poll-h"></i>배송정보</p></div>
		<div id="delivTable" class="infoTable">
			<table>
				<tr><th>이름</th><td>${vo.deliv_name }</td></tr>
				<tr><th>연락처</th><td>${vo.deliv_phone }</td></tr>
				<tr><th>주소</th><td>( ${vo.deliv_zipcode } ) ${vo.deliv_address } ${vo.deliv_detailaddress }</td></tr>
				<tr><th>배송메모</th><td>${vo.deliv_memo }</td></tr>
			</table>
		</div><br/>
		<c:if test="${!empty login_info}">
		<div>
			<a class="btn_fill" href="myOrder?user_email=${login_info.user_email }" ${mypage eq 'order' ? 'class="active"' : '' }>내 주문목록</a>
		</div>
		</c:if>
	</div>
</div>
</body>
</html>