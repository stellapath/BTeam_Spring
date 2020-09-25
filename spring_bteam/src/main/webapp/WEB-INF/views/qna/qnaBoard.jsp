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
	<h3>자주하는 질문</h3>
	<form action="qnaBoard" method="post">
	<input type="hidden" name="curPage" value='1'/>
	<div class="btnSet">
		<c:if test="${login_info.user_email eq 'admin'}">
		<a class="btn_fill" href="qnaWrite">글작성</a>
		</c:if>
	</div>
	</form>
	<div class="container" align="center">
	<table>
		<tr><th class="w-px60">번호</th>
			<th class="w-px100">질문유형</th>
			<th>질문</th>
			<th class="w-px100">작성자</th>
			<th class="w-px100">작성일자</th>
			<th class="w-px200">이메일</th>
		</tr>
		<c:forEach items="${page.list}" var="qvo">
		<tr><td>${qvo.qna_no}</td>
			<td>${qvo.qna_category}</td>
			<td class="left">${qvo.qna_question}</td>
			<td>${qvo.qna_nickname}</td>
			<td>${qvo.qna_writedate}</td>
			<td>${qvo.qna_email}</td>
		</tr>
		</c:forEach>
	</table><br/>
	
	<div class="btnSet">
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
	</div>
	</div>
</div>

<a href="">나의 문의내역</a>
<a href="qnaWrite?user_email=${login_info.user_email }">일대일 문의하기</a>
</body>
</html>