<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 문의내역</title>
<style type="text/css">
h5 {
	text-align: left;
	margin: 10px 0px;
	color: gray;
}
.menubar {
	padding: 0px
}
.contents td {
	padding : 0px;
	border: 0px;
}
.answers {
    background-color: #f0f0f0;
    text-align: left;
    padding: 10px 75px;
    height: 100%;
}
</style>
<c:if test="${login_info eq null}">
<script>
	alert("로그인이 필요한 페이지 입니다.");
	location.href = "login";
</script>
</c:if>
</head>
<body>
<div class="myMenuBar">
<ul class="menubar">
	<li><a href="myPage?user_email=${login_info.user_email }" ${mypage eq 'info' ? 'class="active"' : '' }>개인정보수정</a></li>
	<li>｜</li>
	<li><a href="myOrder?user_email=${login_info.user_email }" ${mypage eq 'order' ? 'class="active"' : '' }>나의 주문내역</a></li>
	<li>｜</li>
	<li><a href="myQna?user_email=${login_info.user_email }" ${mypage eq 'qna' ? 'class="active"' : '' }>나의 문의내역</a></li>
</ul>
</div>
<div class="pageName">
	<p class="subTitleName">${login_info.user_nickname}님의 문의내역</p>
	<div class="titleLine"></div>
</div>
<div id="list-top">
<form action="myQna" method="post">
<input type="hidden" name="curPage" value="1"/>
<input type="hidden" name="user_email" value="${login_info.user_email }"/>
<input type="hidden" name="qna_num"/>
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
		<tr><th class="w-px80">번호</th>
			<th class="w-px120">구분</th>
			<th>질문</th>
			<th class="w-px120">등록일</th>
			<th class="w-px160">첨부파일</th>
		</tr>
		
		<c:if test="${empty page.list }">
		<tr><td colspan="5">문의내역이 없습니다.</td></tr>
		</c:if>
		
		<c:if test="${!empty page.list }">
		<c:forEach var="qvo" items="${page.list }">

			<tr class="subject">
				<td>${qvo.qna_no}</td>
				<td>${qvo.qna_category}</td>
				<td class="left">
					<a class="question">${qvo.qna_question}</a>
				</td>
				<td>${qvo.qna_writedate}</td>
				<td>
					<c:if test="${!empty qvo.qna_filename }">
						<label>
							<img alt="첨부파일" src="img/attach.png" class="file_icon" >
							<a name="qna_filename" href="download.qo?qna_num=${qvo.qna_num }">${qvo.qna_filename }</a>
						</label>
					</c:if>
					<c:if test="${ empty qvo.qna_filename }">-</c:if>
				</td>
			</tr>

		<tr class="contents" style="display: none;">
			<td colspan="5">
				<div class="answers">
					<p>${fn:replace(qvo.qna_content, crlf, '<br/>')}</p>
				</div>
			</td>
		</tr>
		</c:forEach>
		</c:if>
	</table>
	<h5>*답변은 본인 이메일로 전송됩니다</h5>
	<div class="buttons">
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
	</div>
	
<script type="text/javascript">
$('.question').click(function(){
	$(this).parents('tr').next('.contents').toggle();
});
</script>
</body>
</html>