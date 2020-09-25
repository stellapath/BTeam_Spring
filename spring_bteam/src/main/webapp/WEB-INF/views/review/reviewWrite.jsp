<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<c:if test="${empty login_info }">
<script type="text/javascript">
alert('구매후기는 구매자만 작성가능합니다.');
location.href="reviewBoard?board_category=1";
</script>
</c:if>
</head>
<body>
<h3>리뷰 작성화면</h3>
<div class="container">
<form action="reviewWriteReq" method="post" enctype="multipart/form-data">
	<input type="hidden" name="board_nickname" value="${login_info.user_nickname}" />
	<input type="hidden" name="board_email" value="${login_info.user_email}" />
	<input type="hidden" name="board_category" value="1" />
	<table>
		<tr>
			<th>구매상품</th>
			<td></td>
		</tr>
		<tr><th>추천여부</th>
			<td>
				<label><input type="radio" name="board_recommend" value="RECOMMEND"/>추천<i class="far fa-thumbs-up"></i></label>
				<label><input type="radio" name="board_recommend" value="DERECOMMEND"/>비추천<i class="far fa-thumbs-down"></i></label>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="board_title" required /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" cols="20" name="board_content"></textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td style="text-align: left;">
			<label>
				<img alt="파일선택" src="img/attach.png" class="file_icon">
				<input type="file" name="file" id="attach-file" accept="image/*"/>
			</label>
			<span id="preview"></span>
			<span id="board-filename"></span>
			<span id="delete-file" style="color : red;"><i class="fas fa-times file_icon"></i></span>
			</td>
		</tr>
	</table><br/>
</form>
	<div id="btnSet">
		<a class="btn_fill" onclick="$('form').submit()">등록</a>
		<a class="btn_empty" onclick="javascript:if( confirm('작성을 취소하시겠습니까?') ){href='noticeBoard?board_category=0'}">취소</a>
	</div>
</div>	
<script type="text/javascript">
function isImage(filename){
	//abc.txt, abc.png, abc.jpg, ...
	//파일의 확장자를 소문자처리
	var ext = filename.substring( filename.lastIndexOf('.')+1).toLowerCase();
	var imgs = ['jpg', 'jpeg', 'gif', 'png', 'bmp'];			//이미지확장자 배열
	if(imgs.indexOf(ext) > -1) return true;
	else return false;	
}

$('#attach-file').on('change', function(){
	//파일정보의 파일명이 이미지파일인 경우 미리보기
	var attach = this.files[0];
	if (attach){
// 		alert(isImage( attach.name));
		if(isImage( attach.name) ){
			var img ="<img style='border-radius:50%; width:100px;' class='file-img' id='preview-img' src=''/>";
			$('#preview').html(img);

			var reader = new FileReader();
			reader.onload = function(e){
				$('#preview-img').attr('src', e.target.result);
			}
			reader.readAsDataURL(attach);
		}else $('#preview').html('');
	}
});

$('#delete-file').on('click', function(){
	$('#preview').html('');
});

$('#attach-file').on('change', function(){
	if( this.files[0] ) $('#board-filename').text( this.files[0].name );
	$('#delete-file').css('display', 'inline');
});

$('#delete-file').on('click', function(){
	$('#board-filename').text('');
	$('#attach-file').val('');
	$('#delete-file').css('display', 'none');
});
</script>
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
</body>
</html>