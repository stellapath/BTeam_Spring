<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일대일 문의</title>
<style type="text/css">
input:focus::-webkit-input-placeholder, textarea:focus::-webkit-input-placeholder
	{	/*Webkit browser*/	color: transparent;}

input:focus:-moz-input-placeholder, textarea:focus::-moz-input-placeholder
	{	/*Mozila Firefox 4 to 18*/	color: transparent;}

input:focus::-moz-input-placeholder, textarea:focus::-moz-input-placeholder
	{	/*Mozila Firefox 19+*/	color: transparent;}

input:focus:-ms-input-placeholder, textarea:focus:-ms-input-placeholder
	{	/*Internet Explorer 10+*/	color: transparent;}

#wrap {	margin: 0 auto;	padding: 40px 0px;}

.btnSet {	margin: 0 auto;	width: 80%;	text-align: center;}
</style>
<script src="js/qna.js"></script>
</head>
<body>
	<!-- 
파일전송시
1. form의 전송방식은 반드시 post로 지정한다.
2. form enctype을 지정한다 enctype='multipart/form-data' 
 -->
	<form action='qnaWriteReq' method="post" enctype="multipart/form-data">
		<div id="wrap">
			<table>
				<tr>
					<th>구분</th>
					<td class='left'><select name="qna_category">
							<option value="제품기능">제품기능</option>
							<option value="주문">주문</option>
							<option value="A/S">A/S</option>
							<option value="기타">기타</option>
					</select></td>
				</tr>
				<tr>
					<th class="w-px120">질문</th>
					<td><input type="text" id="qna_question" name="qna_question" /></td>
				</tr>
				<c:if test="${login_info eq null }">
					<tr>
						<th class="w-px120">이메일</th>
						<td><input type="text" placeholder="답변을 받을 이메일을 작성하세요."
							id="qna_email" name="qna_email" /></td>
					</tr>
					<tr>
						<th>이름(닉네임)</th>
						<td><input type="text" id="qna_nickname" name="qna_nickname" /></td>
					</tr>
				</c:if>
				<c:if test="${login_info ne null }">
				<input type="hidden" name="qna_nickname" id="qna_nickname" value="${login_info.user_nickname }" />
				<input type="hidden" name="qna_email" id="qna_email" value="${login_info.user_email }" />
					<tr>
						<th class="w-px120">이메일</th>
						<td class="left">${login_info.user_email}</td>
					</tr>
					<tr>
						<th>이름(닉네임)</th>
						<td class="left">${login_info.user_nickname}</td>
					</tr>
				</c:if>
				<tr>
					<th class="w-px120">내용</th>
					<td><textarea id="qna_content" name="qna_content"></textarea></td>
				</tr>
				<tr>
					<th class="w-px120">첨부파일</th>
					<td class='left'>
						<label> 
							<input type="file" name="file" id="attach-file" /> 
							<img alt="파일선택" class="file_icon"src="img/attach.png">
						</label> 
						<span id='board-filename'></span>
						<span id="delete-file" style="color: red;"><i class="fas fa-times font-img"></i></span>
					</td>
				</tr>
			</table>
		</div>
	</form>
	<div class="btnSet">
		<a type="submit" id="button" class="btn_fill">등록</a>
		<a type="reset"	class="btn_fill" onclick="location.href='/bteam/qnaBoard'">취소</a>
	</div>
	<script type="text/javascript" src='js/file_attach.js'></script>
</body>
</html>