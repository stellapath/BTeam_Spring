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
<h3>${login_info.user_nickname}님의 주문내역</h3>
<div class="myMenuBar">
<ul>
	<li><a href="myPage?user_email=${login_info.user_email }" ${mypage eq 'info' ? 'class="active"' : '' }>개인정보수정</a></li>
	<li><a href="myOrder?user_email=${login_info.user_email }" ${mypage eq 'order' ? 'class="active"' : '' }>나의 주문내역</a></li>
	<li><a href="myQna?user_email=${login_info.user_email }" ${mypage eq 'qna' ? 'class="active"' : '' }>나의 문의내역</a></li>
</ul>
</div>
<div id="list-top">
<form action="myOrder" method="post">
<input type="hidden" name="curPage" value="1"/>
<input type="hidden" name="user_email" value="${login_info.user_email }"/>
<input type="hidden" name="order_num"/>
<div>
<ul style="float: right;">
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
<tr><th class="w-px120">주문번호</th><th>제품명</th><th class="w-px80">주문수량</th><th class="w-px80">주문금액</th><th class="w-px80">진행상태</th><th class="w-px120">문의하기</th></tr>
<c:if test="${page.list eq null }">
<tr><td colspan="6">주문내역이 없습니다.</td></tr>
</c:if>
<c:if test="${page.list ne null }">
<c:forEach var="vo" items="${page.list }">
<tr><td><a onclick="go_detail(${vo.order_num })" style="float: none;">${vo.order_num }<br/>(${vo.order_date })</a></td>
	<td>${vo.order_option }</td>
	<td>${vo.order_count }</td>
	<td>${vo.order_amount }</td>
	<td>배송준비중</td>
	<td><a class="btn_fill" onclick="">일대일문의</a></td>
</tr>
</c:forEach>
</c:if>
</table>
<div class="buttons">
<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>
<script type="text/javascript">
function go_detail(order_num){
	$('[name=order_num]').val(order_num);
	$('form').attr('action', 'myOrderView');
	$('form').submit();
}
</script>
</body>
</html>