<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의관리</title>
<c:if test="${login_info.user_email ne 'admin'}">
<script>
alert("관리자전용 페이지입니다.");
history.back();
</script>
</c:if>
<link rel="stylesheet" href="css/adminQna.css">
</head>
<body>
<div class="myMenuBar">
<ul>
	<li><a href="userList" ${mypage eq 'userList' ? 'class="active"' : '' }>고객관리</a></li>
	<li>｜</li>
	<li><a href="orderList" ${mypage eq 'orderList' ? 'class="active"' : '' }>주문관리</a></li>
	<li>｜</li>
	<li><a href="productList" ${mypage eq 'productList' ? 'class="active"' : '' }>등록제품관리</a></li>
	<li>｜</li>
	<li><a href="qnaList" ${mypage eq 'qnaList' ? 'class="active"' : '' }>문의관리</a></li>
</ul>
</div>
<div class="pageName">
	<p class="subTitleName">문의관리</p>
	<div class="titleLine"></div>
</div>
<div id="wrap">
	<form action="qnaList" method="post">
	<input type="hidden" name="curPage" value='1'/>
	</form>
	<div align="center">
	<table>
		<tr><th class="w-px80">번호</th>
			<th class="w-px120">구분</th>
			<th>질문</th>
			<th class="w-px120">작성자</th>
			<th class="w-px100">등록일</th>
			<th class="w-px180">이메일</th>
			<th class="w-px160">첨부파일</th>
		</tr>
		<c:forEach items="${page.list}" var="qvo">
		<tr class="subject">
			<td>${qvo.qna_no}</td>
			<td>${qvo.qna_category}</td>
			<td class="left">
				<a class="question">${qvo.qna_question}</a>
				<c:if test="${qvo.qna_answer ne null }">
				<i class="far fa-comment-dots"></i>
				</c:if>	
			</td>
			<td>${qvo.qna_nickname}</td>
			<td>${qvo.qna_writedate}</td>
			<td>
				<c:if test="${login_info.user_email eq 'admin'}">${qvo.qna_email}</c:if>
			</td>
			<td>
				<c:if test="${!empty qvo.qna_filename }">
					<label>
						<img alt="첨부파일" src="img/attach.png" class="file_icon">
						<a name="qna_filename" href="download.qo?qna_num=${qvo.qna_num }">${qvo.qna_filename }</a>
					</label>
				</c:if>
				<c:if test="${ empty qvo.qna_filename }">-</c:if>
			</td>
		</tr>
		<tr class="contents" style="display: none;">
			<td colspan="7">
				<div class="answers">
					<p>${fn:replace(qvo.qna_content, crlf, '<br/>')}</p>
					<hr>
					<c:if test="${qvo.qna_answer ne null }">
					<div>[답변]<br/><br/>${fn:replace(qvo.qna_answer, crlf, '<br/>')}
					</div>
					</c:if>
					<c:if test="${qvo.qna_answer eq null }">
					<div>[답변]<br/><br/>문의글 확인중입니다. 빠른시일내 답변해드리겠습니다.</div>
					</c:if>
					<a class="btn_fill" id="reply" href="emailReply?qna_num=${qvo.qna_num }">이메일 답변 작성</a>
				</div>
			</td>
		</tr>
		</c:forEach>
	</table><br/>
	
	<div class="btnSet">
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
	</div>
	</div>
</div>

<script type="text/javascript">
$('.question').click(function(){
	$(this).parents('tr').next('.contents').toggle();
	$('tr.contents').not($(this).parents('tr').next()).hide();
});

</script>
</body>
</html>