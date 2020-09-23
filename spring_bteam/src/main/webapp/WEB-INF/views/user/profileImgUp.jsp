<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 이미지 변경</title>
<c:if test="${login_info eq null}">
<script>
	alert("로그인이 필요한 페이지 입니다.");
	self.close();
</script>
</c:if>
<script>
window.onload = () => {
	document.querySelector("#form").onsubmit = () => {
		if (!document.querySelector("#user_image").value) {
			alert("이미지를 선택해주세요.");
			return false;
		}
	};
};
</script>
</head>
<body>
<!-- 창 크기 400 x 300 입니다. -->
<form action="profileImgUpReq" method="post" enctype="multipart/form-data" id="form">
	<input type="file" name="file" id="attach-file" accept="image/*" id="user_image" />
	<input type="submit" value="저장" />
	<a id="delete-file" style="display: none;">삭제</a>
</form>
<div style="text-align: center;">
<span id="preview"></span>
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
			var img ="<img style='border-radius:50%; width:200px;' class='file-img' id='preview-img' src=''/>";
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
	$('#delete-file').css('display', 'inline');
});

$('#delete-file').on('click', function(){
	$('#attach-file').val('');
	$('#delete-file').css('display', 'none');
});
</script>
</body>
</html>