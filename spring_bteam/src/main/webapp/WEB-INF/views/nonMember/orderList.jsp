<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#nonMemberOut { float: right; display: inline-block;}
.dataList:hover { background-color: #fffded; cursor: pointer; font-weight: bold;}
</style>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
</head>
<body>
<div class="pageName">
	<p class="subTitleName">비회원 전용페이지</p>
	<div class="titleLine"></div>
	<p class="miniTitleName">${nonMember.order_name }님 주문내역조회</p>
</div>
<div id="nonMemberZone">
	<div>
	<a id="nonMemberOut">비회원 로그아웃</a>
	<table>
		<tr><th>주문번호</th><th>주문제품</th><th>주문수량</th><th>주문금액</th><th>진행상태</th></tr>
		<c:if test="${order eq null }">	
			<tr><td colspan="6">주문내역이 존재하지 않습니다.</td></tr>
		</c:if>
		<c:if test="${order ne null }">	
			<c:forEach items="${order }" var="vo">
				<tr class="dataList" onclick="order_detail(${vo.order_num})">
					<td>${vo.order_num }</td>
					<td>${vo.order_product }</td>
					<td>${vo.order_count }</td>
					<td><fmt:formatNumber value="${vo.order_amount }" pattern="#,###"/></td>
					<td><c:if test="${vo.order_date < today  }">배송완료</c:if>
						<c:if test="${vo.order_date >= today  }">배송준비중</c:if>	
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</div>
</div>
<script type="text/javascript">
$(document).on('click', '#nonMemberOut', function(){

	$.ajax({
		url: 'nonMemberOut',
		success: function(){
			alert('비회원 로그아웃 처리가 완료되었습니다.');
			location.href="home";
		},
		error: function(req, text){
			alert(text+':'+req.status);
		}	
	});
	
});
function order_detail(order_num){
	location.href="myOrderView?order_num="+order_num;
}
function review_write(order_num){
	location.href="reviewWrite?order_num="+order_num;
}
function review_detail(board_num){
	location.href="reviewDetail?board_num="+board_num;	
}
</script>	
</body>
</html>