<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<c:if test="${login_info.user_email ne 'admin'}">
<script>
alert("관리자전용 페이지입니다.");
location.href='login';
</script>
</c:if>
</head>
<body>
<div class="pageName">
	<p class="subTitleName">공지사항 수정</p>
	<div class="titleLine"></div>
</div>
<div class="container">
<form action="boardUpdateReq" method="post" enctype="multipart/form-data">
<input type="hidden" name="board_num" value="${bvo.board_num }"/>
<input type="hidden" name="board_category" value="0" />
<input type="hidden" name="attach"/>
<table id="boardTable">
	<tr>
		<th>제목</th>
		<td><input type="text" name="board_title" value="${bvo.board_title }" class="need" title="제목"/></td>
		<th>작성자</th>
		<td>${bvo.board_nickname }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="3">
			<textarea rows="5" cols="20" name="board_content" class="need" title="내용">${fn:replace(bvo.board_content, crlf, '<br/>')}</textarea>
		</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td style="text-align: left;" colspan="3">
			<label>
				<img alt="파일선택" src="img/attach.png" class="file_icon">
				<input type="file" name="file" id="attach-file" />
			</label>
			<span id="board-filename">${bvo.board_filename }</span>
			<span id="preview"></span>
			<span id="delete-file" style="color : red;"><i class="fas fa-times file_icon"></i></span>
		</td>
	</tr>
</table><br/>
</form>
<div class="btnSet">
	<a class="btn_fill" onclick="if(necessary()){ $('[name=attach]').val($('#board-filename').text()); $('form').submit()}">수정</a>
	<a class="btn_empty" href="javascript:history.go(-1)">취소</a>
</div>
</div>
<script type="text/javascript" src="js/image_preview.js"></script>
<script type="text/javascript" src="js/need_check.js"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
<script type="text/javascript">
if(${!empty bvo.board_filename}){
	$('#delete-file').css('display', 'inline');
	if(isImage('${bvo.board_filename}')){
		//filepath: /upload/board/2020/09/25/abde\.png
		var filepath = '${bvo.board_filepath}'.substring(1);
		var img = "<img src='"+ filepath +"' class='file-img' id='preview-img'/>";
		$('#preview').html(img);
	}
}
</script>
</body>
</html>