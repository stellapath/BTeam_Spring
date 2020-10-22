<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<link rel="stylesheet" href="css/qnaForm.css">
</head>
<body>
<div class="pageName">
	<p class="titleName">문의하기</p>
	<div class="titleLine"></div>
</div>
<div id="wrap">
	<h5>*답변은 본인 이메일로 전송됩니다</h5>
	<form action="qnaBoard" method="post">
	<input type="hidden" name="curPage" value='1'/>
	</form>
	<div align="center">
	<table>
		<tr><th class="w-px60">번호</th>
			<th class="w-px100">구분</th>
			<th>질문</th>
			<th class="w-px100">작성자</th>
			<th class="w-px100">등록일</th>
			<th class="w-px80">첨부파일</th>
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
				<c:if test="${!empty qvo.qna_filename }">
					<label>
						<i class="far fa-file-alt"></i>&nbsp;
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

<div class="myContent">
<c:if test="${login_info.user_email eq 'admin'}">
<a class="btn_fill" href="qnaList">답변작성</a>
</c:if>
<c:if test="${login_info.user_email ne 'admin'}">
<a class="btn_fill" href="qnaWrite">일대일 문의하기</a>
</c:if>
</div>

<script type="text/javascript">
$('.question').click(function(){
	$(this).parents('tr').next('.contents').toggle();
	$('tr.contents').not($(this).parents('tr').next()).hide();
});

</script>
</body>
</html>