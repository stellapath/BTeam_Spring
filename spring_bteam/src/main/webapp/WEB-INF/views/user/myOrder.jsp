<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
</head>
<body>
<div class="myMenuBar">
<ul>
	<li><a href="myPage?user_email=${login_info.user_email }" ${mypage eq 'info' ? 'class="active"' : '' }>개인정보수정</a></li>
	<li>｜</li>
	<li><a href="myOrder?user_email=${login_info.user_email }" ${mypage eq 'order' ? 'class="active"' : '' }>나의 주문내역</a></li>
	<li>｜</li>
	<li><a href="myQna?user_email=${login_info.user_email }" ${mypage eq 'qna' ? 'class="active"' : '' }>나의 문의내역</a></li>
</ul>
</div>
<div class="pageName">
	<p class="subTitleName">${login_info.user_nickname}님의 주문내역</p>
	<div class="titleLine"></div>
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
	<tr><th class="w-px120">주문번호</th><th>제품명</th><th class="w-px80">주문수량</th><th class="w-px80">주문금액</th><th class="w-px80">진행상태</th><th class="w-px40">사용후기</th><th class="w-px40">주문취소</th><th class="w-px80">문의하기</th></tr>
	<c:if test="${empty page.list }">
		<tr><td colspan="8">주문내역이 없습니다.</td></tr>
	</c:if>
	<c:if test="${page.list ne null }">
		<c:forEach var="vo" items="${page.list }">
			<tr><td><a onclick="go_detail(${vo.order_num })">${vo.order_num }<br/>(${vo.order_date })</a></td>
				<td>${vo.order_product }</td>
				<td>${vo.order_count }</td>
				<td><fmt:formatNumber value="${vo.order_amount }" pattern="#,###"/></td>
				<td><c:if test="${vo.order_date < today || !empty vo.order_review}">배송완료</c:if>
			<c:if test="${vo.order_date >= today && empty vo.order_review  }">배송준비중</c:if>	
		</td>
				<td><c:if test="${empty vo.order_review }"><a class="btn_fill_s" onclick="review_write(${vo.order_num })">작성</a></c:if>
					<c:if test="${!empty vo.order_review }"><a class="btn_fill_s" onclick="review_detail(${vo.order_review })">조회</a></c:if>
				</td>
				<td><c:if test="${vo.order_date < today  }">-</c:if>
					<c:if test="${vo.order_date >= today  }"><a class="btn_fill_s" onclick="orderCancel(${vo.order_num })">취소</a></c:if>	
				</td>
				<td><a class="btn_fill_s" onclick="location.href='qnaWrite'">일대일문의</a></td>
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

function orderCancel(order_num){

	$.ajax({
		url: 'orderCancel',
		data: {	order_num : order_num,
				reason : '주문자의 취소요청'
		},
		success: function( result ){
			if(result)		alert('주문이 취소되었습니다.\n주문취소 안내메일이 발송되었습니다.');
			else			alert('주문취소에 실패했습니다. 잠시후에 다시 시도해주세요.');
			location.reload();
		},
		error: function(text, req){
			alert(text + " : " + req.status);
		}
	});

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