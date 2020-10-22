<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용후기 작성</title>
<c:if test="${empty login_info }">
<script type="text/javascript">
alert('로그인 후 작성가능합니다.');
location.href="login";
</script>
</c:if>
</head>
<body>
<div class="pageName">
	<p class="subTitleName">사용후기 수정</p>
	<div class="titleLine"></div>
</div>
<div>
<form action="reviewUpdateReq" method="post" enctype="multipart/form-data">
	<input type="hidden" name="board_nickname" value="${vo.board_nickname}" />
	<input type="hidden" name="board_email" value="${vo.board_email}" />
	<input type="hidden" name="board_num" value="${vo.board_num }" />
	<input type="hidden" name="board_category" value="1" />
	<input type="hidden" name="attach"/>
	<table id="boardTable">
		<tr>
			<th>구매상품</th>
			<td>${vo.order_product }</td>
		</tr>
		<tr><th>추천여부</th>
			<td><c:if test="${vo.board_recommend == 'RECOMMEND' }">
				<label style="margin-right: 100px;"><input type="radio" name="board_recommend" value="RECOMMEND" checked="checked"/>추천<i class="far fa-thumbs-up"></i></label>
				<label><input type="radio" name="board_recommend" value="DERECOMMEND"/>비추천<i class="far fa-thumbs-down"></i></label>
				</c:if>
				<c:if test="${vo.board_recommend == 'DERECOMMEND' }">
				<label style="margin-right: 100px;"><input type="radio" name="board_recommend" value="RECOMMEND"/>추천<i class="far fa-thumbs-up"></i></label>
				<label><input type="radio" name="board_recommend" value="DERECOMMEND" checked="checked"/>비추천<i class="far fa-thumbs-down"></i></label>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="board_title" class="need" title="제목" value="${vo.board_title }"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" cols="20" name="board_content" class="need" title="내용">${fn:replace(vo.board_content, crlf, '<br/>')}</textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td style="text-align: left;">
			<label>
				<img alt="파일선택" src="img/attach.png" class="file_icon">
				<input type="file" name="file" id="attach-file" accept="image/*"/>
			</label>
			<span id="board-filename">${vo.board_filename }</span>
			<span id="preview"></span>
			<span id="delete-file" style="color : red;"><i class="fas fa-times file_icon"></i></span>
			</td>
		</tr>
	</table><br/>
</form>
	<div id="btnSet">
		<a class="btn_fill" onclick="if(necessary()){ $('[name=attach]').val($('#board-filename').text()); $('form').submit()}">수정</a>
		<a class="btn_empty" href="javascript:history.go(-1)">취소</a>
	</div>
</div>	
<script type="text/javascript">
var imageFile = $('#attach-file').val();
var imgType = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
var maxSize = 5 * 1024 * 1024;
var imgSize;

if(imageFile != "" && imageFile != null) {
	imgSize = document.getElementById("attach-file").files[0].size;
    
    if(!imageFile.match(imgType)) {
    	alert("이미지 파일만 업로드 가능");
        return;
    } else if(imgSize = maxSize) {
    	alert("파일 사이즈는 5MB까지 가능");
        return;
    }
}
</script>
<script type="text/javascript" src="js/image_preview.js"></script>
<script type="text/javascript" src="js/need_check.js"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
<script type="text/javascript">
if(${!empty bvo.board_filename}){
	$('#delete-file').css('display', 'inline');
	if(isImage('${bvo.board_filename}')){
		var filepath = '${bvo.board_filepath}'.substring(1);
		var img = "<img src='"+ filepath +"' class='file-img' id='preview-img'/>";
		$('#preview').html(img);
	}
}
</script>
</body>
</html>