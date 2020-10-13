<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 답변 작성</title>
<style type="text/css">
#wrap {
	margin: 0 auto;
    width: 100%;
    padding: 40px 0px;
}

table {
	margin: 0 auto;
	width: 100%;
}

textarea[name=qna_answer] {
	height : 330px;
}

.qna_content {
	text-align: left;
}
</style>
<c:if test="${login_info.user_email ne 'admin'}">
<script>
alert("관리자전용 페이지입니다.");
history.back();
</script>
</c:if>
<script type="text/javascript">
$(document).on('click', '#mailAnswer', function(){
	if($('#replyWrite').val() == ''){
		//답변 작성 미입력
		alert('답변을 작성하세요.');
		$('#replyWrite').focus();	
	}else{
		$('form').submit();
		alert('이메일 답변이 성공적으로 전송되었습니다.');
	}
});
</script>
</head>
<body>
<div id="wrap">
	<h3>문의답변 작성하기</h3>
	<div align="center">
	<form action="mailAnswer" method="post">
	<input type="hidden" name="qna_email" value="${qvo.qna_email }"/>
	<input type="hidden" name="qna_num" value="${qvo.qna_num }"/>
	<input type="hidden" name="qna_content" value="${qvo.qna_content }"/>
	<table>
		<tr>
			<th class="w-px120">등록일</th>
			<td>${qvo.qna_writedate}</td>
			<th class="w-px120">작성자</th>
			<td>${qvo.qna_nickname}</td>
		</tr>
		<tr>
			<th class="w-px120">구분</th>
			<td colspan="3" class="left">${qvo.qna_category}</td>
		</tr>
		<tr>
			<th class="w-px120">질문</th>
			<td colspan="3" class="left">${qvo.qna_question}</td>
		</tr>
		<tr>
			<th class="w-px120">문의 내용</th>
			<td colspan="3" class="qna_content"><p>${fn:replace(qvo.qna_content, crlf, '<br/>')}</p></td>
		</tr>
		<tr>
			<th class="w-px120">답변 작성</th>
			<td colspan="3"><textarea id="replyWrite" name="qna_answer"></textarea></td>
		</tr>
	</table><br/><br/>
	</form>
	</div>
	
	<div id="btnSet">
		<a class="btn_fill" id="mailAnswer">이메일 답변 전송</a>
	</div>
</div>
</body>
</html>