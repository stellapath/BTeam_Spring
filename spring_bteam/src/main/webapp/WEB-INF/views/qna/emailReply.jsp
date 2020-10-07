<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 답변 작성</title>
<style type="text/css">
#wrap {	margin: 0 auto;    width: 100%;    padding: 40px 0px;}
table {	margin: 0 auto;	width: 100%;}
textarea[name=qna_answer] {	height : 330px;}
.qna_content {	text-align: left;}
p {	margin: 10px;}
</style>
<script type="text/javascript">
$(document).on('click', '#mailAnswer', function(){
	if($('#replyWrite').val() == ''){
		//답변 작성 미입력
		alert('답변을 작성하세요.');
		$('#replyWrite').focus();	
	}else {
		$('form').submit();
		location.href="mailAnswer";
	}
});
</script>
</head>
<body>
<div id="wrap">
	<form action="mailAnswer" method="post">
	<input type="hidden" name="qna_email" value="${qvo.qna_email }"/>
	<input type="hidden" name="qna_num" value="${qvo.qna_num }"/>
	<input type="hidden" name="qna_content" value="${qvo.qna_content }"/>
	<div align="center">
	<table>
		<tr>
			<th class="w-px120">문의 내용</th>
			<td class="qna_content"><p>${fn:replace(qvo.qna_content, crlf, '<br/>')}</p></td>
		</tr>
		<tr>
			<th class="w-px120">답변 작성</th>
			<td><textarea id="replyWrite" name="qna_answer"></textarea></td>
		</tr>
	</table><br/><br/>
	</div>
	</form>
	
	<div id="btnSet">
		<a class="btn_fill" id="mailAnswer">이메일 답변 전송</a>
	</div>
	
</div>

</body>
</html>