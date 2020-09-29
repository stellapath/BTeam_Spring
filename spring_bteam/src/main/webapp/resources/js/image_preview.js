/**
 * 첨부파일이 이미지인 경우 미리보기 기능
 */
//이미지인가요???
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
			var img ="<img class='preview-img' id='preview-img' src=''/>";
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
 