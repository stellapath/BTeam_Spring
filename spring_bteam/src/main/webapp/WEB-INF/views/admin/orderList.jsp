<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리</title>
<c:if test="${login_info.user_email ne 'admin'}">
<script>
alert("관리자전용 페이지입니다.");
location.href='login';
</script>
</c:if>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
</head>
<body>
<div id="list-top">
<form action="orderList" method="post">
<input type="hidden" name="curPage" value="1"/>
<input type="hidden" name="order_num"/>
<div>
<ul>
	<li>
		<select>
		<option>진행상태</option>
		</select>
	</li>
	<li>
		<select>
		<option>상품명</option>
		</select>
	</li>
	<li>
		<select name="pageList" class="w-px80" onchange="$('[name=curPage]').val(1); $('form').submit()">
		<option value="10" ${page.pageList eq '10' ? 'selected' : '' }>10개씩</option>
		<option value="20" ${page.pageList eq '20' ? 'selected' : '' }>20개씩</option>
		<option value="30" ${page.pageList eq '30' ? 'selected' : '' }>30개씩</option>
		</select>
	</li>
</ul>
</div>
</form>
</div>
<table>
	<tr><th class="w-px120">주문번호</th><th>제품명</th><th class="w-px80">주문수량</th><th class="w-px80">주문금액</th><th class="w-px80">진행상태</th><th class="w-px80">사용후기</th><th class="w-px80">주문취소</th></tr>
	<c:if test="${page.list eq null }">
	<tr><td colspan="7">주문내역이 없습니다.</td></tr>
	</c:if>
	<c:if test="${page.list ne null }">
	<c:forEach items="${page.list}" var="vo">
	<tr><td><a onclick="go_detail(${vo.order_num })">${vo.order_num }</a></td>
		<td>${vo.order_product }</td>
		<td>${vo.order_count }</td>
		<td>${vo.order_amount }</td>
		<td><c:if test="${vo.order_date < today  }">배송완료</c:if>
			<c:if test="${vo.order_date >= today  }">배송준비중</c:if>	
		</td>
		<td>${vo.order_review }</td>
		<td><c:if test="${vo.order_date < today || !empty vo.order_review}">취소불가</c:if>
			<c:if test="${vo.order_date >= today && empty vo.order_review }">
			<a class="btn_fill_s" onclick="orderCancel('${vo.order_num }')">취소</a>
			</c:if>	
		</td>
	</tr>
	</c:forEach>
	</c:if>
</table>
	<div class="buttons" style="margin: 10px 0;">
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
	</div>
<script type="text/javascript">
function go_detail(order_num){
	$('[name=order_num]').val(order_num);
	$('form').attr('action', 'myOrderView');
	$('form').submit();
}

function orderCancel(order_num){
	var cancelReason = prompt('주문취소 사유를 적어주세요.'+'');
	if(cancelReason != ''){
	$.ajax({
		url: 'orderCancel',
		data: {	order_num : order_num,
				reason : cancelReason
		},
		success: function(){
			alert('주문이 취소되었습니다.\n주문취소 안내메일이 발송되었습니다.');
			location.reload();
		},
		error: function(text, req){
			alert(text + " : " + req.status);
		}
	});
	}else return false;
}
</script>
</body>
</html>