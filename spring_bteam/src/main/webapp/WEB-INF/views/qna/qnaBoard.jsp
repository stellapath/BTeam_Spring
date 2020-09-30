<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<link rel="stylesheet" href="css/qnaForm.css">
</head>
<body>
<div id="wrap">
	<h5>*답변은 해당 이메일로 전송됩니다</h5>
	<form action="qnaBoard" method="post">
	<input type="hidden" name="curPage" value='1'/>
	</form>
	<div align="center">
	<table>
		<tr><th class="w-px60">번호</th>
			<th class="w-px100">구분</th>
			<th class="w-px300">질문</th>
			<th class="w-px120">작성자</th>
			<th class="w-px120">등록일</th>
			<th class="w-px180">이메일</th>
			<th class="w-px160">첨부파일</th>
		</tr>
		<c:forEach items="${page.list}" var="qvo">
		<tr class="subject">
			<td>${qvo.qna_no}</td>
			<td>${qvo.qna_category}</td>
			<td class="left">
				<a class="question">${qvo.qna_question}</a>
			</td>
			<td>${qvo.qna_nickname}</td>
			<td>${qvo.qna_writedate}</td>
			<td>${qvo.qna_email}</td>
			<td>
				<c:if test="${!empty qvo.qna_filename }">
					<label>
						<img alt="첨부파일" src="img/attach.png" class="file_icon">
						<a name="qna_filename" href="download?qna_num=${qvo.qna_num }&qna_category=0">${qvo.qna_filename }</a>
					</label>
				</c:if>
			</td>
		</tr>
		<tr class="contents" style="display: none;">
			<td colspan="7">
				<div class="answers">
					<p>${qvo.qna_content}</p>
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
<a class="btn_fill" href="qnaWrite">글작성</a>
</c:if>
<c:if test="${login_info.user_email ne 'admin'}">
<a class="btn_fill" href="qnaWrite">일대일 문의하기</a>
</c:if>
</div>

<script type="text/javascript">
$('.question').click(function(){
	$(this).parents('tr').next('.contents').toggle();
});

</script>
</body>
</html>