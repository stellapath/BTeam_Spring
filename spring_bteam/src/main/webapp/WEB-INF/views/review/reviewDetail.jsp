<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<table id="boardTable">
		<tr>
			<th class="w-px100">구매상품</th>
			<td>${order_product }</td>
			<th class="w-px100">추천여부</th>
			<td><c:if test="${vo.board_recommend == 'RECOMMEND' }">추천<i class="far fa-thumbs-up"></i></c:if>
				<c:if test="${vo.board_recommend == 'DERECOMMEND' }">비추천<i class="far fa-thumbs-down"></i></c:if>
			</td>
		</tr>
		<tr><th class="w-px100">제목</th><td colspan="3">${vo.board_title }</td></tr>
		<tr><th>내용</th><td colspan="3" class="contentBox">${fn:replace(vo.board_content, crlf, '<br/>')}</td></tr>
		<tr>
			<th>첨부파일</th>
			<td style="text-align: left;" colspan="3">
			<label>
				<img alt="파일선택" src="img/attach.png" class="file_icon">
				<input type="file" name="file" id="attach-file" accept="image/*"/>
			</label>
			<span id="board-filename">${vo.board_filename }</span>
			<span id="preview"></span>
			<span id="delete-file" style="color : red;"><i class="fas fa-times file_icon"></i></span>
			</td>
		</tr>
	</table>
</div>
<div id="btnSet">
	<a class="btn_fill" href="reviewUpdate?board_num=${vo.board_num }">수정</a>
	<a class="btn_empty" href="javascript:history.go(-1)">이전</a>
</div>
</body>
</html>