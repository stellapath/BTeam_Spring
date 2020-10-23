<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지/제품관리</title>
<c:if test="${login_info.user_email ne 'admin'}">
<script>
alert("관리자전용 페이지입니다.");
location.href='login';
</script>
</c:if>
<style type="text/css">
#productAddInfo input, #updateInfo input{ text-align: center;}
#attach-defaultImage, #default-delete, #attach-detailImage, #detail-delete, #attach-up-defaultImage, #up-default-delete, #attach-up-detailImage, #up-detail-delete {display: none;}
.file_icon {width: 15px;}
</style>
</head>
<body>
<div class="myMenuBar">
<ul>
	<li><a href="userList" ${mypage eq 'userList' ? 'class="active"' : '' }>고객관리</a></li>
	<li>｜</li>
	<li><a href="orderList" ${mypage eq 'orderList' ? 'class="active"' : '' }>주문관리</a></li>
	<li>｜</li>
	<li><a href="productList" ${mypage eq 'productList' ? 'class="active"' : '' }>등록제품관리</a></li>
	<li>｜</li>
	<li><a href="qnaList" ${mypage eq 'qnaList' ? 'class="active"' : '' }>문의관리</a></li>
</ul>
</div>
<div class="pageName">
	<p class="subTitleName">등록제품관리</p>
	<div class="titleLine"></div>
</div>
<div id="productAdd">
	<div id="productAddInfo">
		<form action="productAdd" name="addForm" method="post" enctype="multipart/form-data">
		<table>
		<tr><th>제품번호</th><th>제품명</th><th>가격</th><th></th></tr>
		<tr><td><input type="text" name="p_num" class="need" title="제품번호"/></td>
			<td><input type="text" name="p_name" maxlength="20" class="need" title="제품명"/></td>
			<td><input type="number" name="p_price" class="need" title="제품가격"/></td>
			<td><div id="productAddBtn">
					<a class="btn_fill_s" onclick="go_add()">등록</a>
					<a class="btn_empty_s" id="addCancel">취소</a>
				</div>
			</td>
		</tr>
		<tr>
			<th style="text-align: center;">상품대표이미지<br/>상세설명이미지</th>
			<td colspan="3" style="text-align: left;">
				<div class="fileZone">
				<label class="fileUpload">
				<img alt="파일선택" src="img/attach.png" class="file_icon">
				<input type="file" name="p_defaultImage" id="attach-defaultImage" accept="image/*"/>
				</label>
				<span id="default-filename"></span>
				<span id="default-delete" style="color : red;"><i class="fas fa-times file_icon"></i></span>
				</div>
				<div class="fileZone">
				<label class="fileUpload">
				<img alt="파일선택" src="img/attach.png" class="file_icon">
				<input type="file" name="p_detailImage" id="attach-detailImage" accept="image/*"/>
				</label>
				<span id="detail-filename"></span>
				<span id="detail-delete" style="color : red;"><i class="fas fa-times file_icon"></i></span>
				</div>
			</td>
		</tr>	
		</table>
		</form>
	</div>
</div>
<div id="productList">
<h4>제 품 목 록</h4>
	<table>
		<tr><th>제품번호</th><th>제품명</th><th>가격</th><th>등록일</th><th>수정</th><th>삭제</th></tr>
		<c:forEach items="${product }" var="vo">
		<tr><td>${vo.p_num }</td>
			<td>${vo.p_name }</td>
			<td><fmt:formatNumber value="${vo.p_price }" pattern="#,###"/></td>
			<td>${vo.p_date }</td>
			<td><a onclick="go_update('${vo.p_num }')" class="btn_fill_s">수정</a></td>
			<td><a onclick="go_delete('${vo.p_num }', '${vo.p_name }', '${vo.p_price }', '${vo.p_date }')" class="btn_fill_s">삭제</a></td>
		</tr>
		</c:forEach>
	</table>
</div>
<div id="productUpdate" style="display: none;">
<h4>등 록 제 품 수 정</h4>
	<div id="productUpdateInfo">
		<form action="productUpdate" name="updateForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="attach_default"/>
			<input type="hidden" name="attach_detail"/>
		<table>
		<tr><th>제품번호</th><th>제품명</th><th>가격</th><th></th></tr>
		<tr id="updateInfo">
			<td><input type="text" name="p_num" readonly style="border: none;"/></td>
			<td><input type="text" name="p_name" maxlength="20" /></td>
			<td><input type="number" name="p_price"/></td>
			<td><div id="productUpdateBtn">
					<a class="btn_fill_s" onclick="update_submit()">수정</a>
					<a class="btn_empty_s" id="updateCancel">취소</a>
				</div>
			</td>
		</tr>	
		<tr>
			<th style="text-align: center;">상품대표이미지<br/>상세설명이미지</th>
			<td colspan="3" style="text-align: left;">
				<div class="fileZone">
					<label class="fileUpload">
					<img alt="파일선택" src="img/attach.png" class="file_icon">
					<input type="file" name="p_up_defaultImage" id="attach-up-defaultImage" accept="image/*"/>
					</label>
					<span id="up-default-filename"></span>
					<span id="up-default-delete" style="color : red;"><i class="fas fa-times file_icon"></i></span>
				</div>
				<div class="fileZone">
					<label class="fileUpload">
					<img alt="파일선택" src="img/attach.png" class="file_icon">
					<input type="file" name="p_up_detailImage" id="attach-up-detailImage" accept="image/*"/>
					</label>
					<span id="up-detail-filename"></span>
					<span id="up-detail-delete" style="color : red;"><i class="fas fa-times file_icon"></i></span>
				</div>
			</td>
		</tr>		
		</table>
		</form>
	</div>
</div>
<script type="text/javascript">
$(document).on('click', '#addCancel', function(){
	$('#productAddInfo input').val('');
	
}).on('click', '#updateCancel', function(){
	$('#updateInfo input').val('');
	$('#productUpdate').hide();
	
}).on('change', '#attach-defaultImage', function(){
	if( this.files[0] ) $('#default-filename').text( this.files[0].name );
	$('#default-delete').css('display', 'inline');
	
}).on('click', '#default-delete', function(){	
	$('#default-filename').text('');
	$('#attach-defaultImage').val('');
	$('#default-delete').css('display', 'none');
	
}).on('change', '#attach-detailImage', function(){
	if( this.files[0] ) $('#detail-filename').text( this.files[0].name );
	$('#detail-delete').css('display', 'inline');
	
}).on('click', '#detail-delete', function(){	
	$('#detail-filename').text('');
	$('#attach-detailImage').val('');
	$('#detail-delete').css('display', 'none');
	
}).on('change', '#attach-up-defaultImage', function(){
	if( this.files[0] ) $('#up-default-filename').text( this.files[0].name );
	$('#up-default-delete').css('display', 'inline');
	
}).on('click', '#up-default-delete', function(){	
	$('#up-default-filename').text('');
	$('#attach-up-defaultImage').val('');
	$('#up-default-delete').css('display', 'none');
	
}).on('change', '#attach-up-detailImage', function(){
	if( this.files[0] ) $('#up-detail-filename').text( this.files[0].name );
	$('#up-detail-delete').css('display', 'inline');
	
}).on('click', '#up-detail-delete', function(){	
	$('#up-detail-filename').text('');
	$('#attach-up-detailImage').val('');
	$('#up-detail-delete').css('display', 'none');
	
});

function go_add(){
	$('form[name=addForm]').submit();
// 	var num = $('[name=p_num]').val();
// 	var numRegExp = /^[A-Z]{3}[2020]\d{3}$/;
	
// 	if(necessary()){
// 		if( numRegExp.test(num)){
// 			alert(num+'\n제품번호는 영문대문자 세자리와 연도 4자리와 숫자3자리의 조합으로만 등록가능합니다.\n예) ###2020***');
// 			$('[name=p_num]').focus();
// 			return false;
// 		}else{ alert('통과');}
		
// 		$('form[name=addForm]').submit();
// 	}
	
}



function go_delete( num, name, price, date ){
	alert( "제품번호: " + num + "\n제품명: " + name + "\n가격: " + price + "\n등록일: " + date + "\n\n제품을 삭제하시겠습니까??" );
	$.ajax({
		url: 'productDelete',
		data: { p_num : num },
		success: function( p_num ){
			alert(num + ' 제품이 삭제되었습니다.');
			location.reload();
		},
		error: function(req, text){
			alert(text+':'+req.status);
		}
	});
}

function go_update( num ){
	
 	$.ajax({
		url: 'productUpdateInfo',
		data: { p_num : num },
		success: function( data ){
		 	$('#productUpdate').show();
		 	$('#updateInfo td:first-child input').attr('value', data.p_num );
		 	$('#updateInfo td:nth-child(2) input').attr('value', data.p_name );
 			$('#updateInfo td:nth-child(3) input').attr('value', data.p_price );
 			$('#up-default-filename').text(data.p_defaultimage_name);
 			$('#up-detail-filename').text(data.p_detailimage_name );
 			if($('#up-default-filename').text() != null){	$('#up-default-delete').css('display', 'inline');};
 			if($('#up-detail-filename').text() != null){	$('#up-detail-delete').css('display', 'inline');};
		},
		error: function(req, text){
			alert(text+':'+req.status);
		}
 	 });
}

function update_submit(){
	
	$('[name=attach-default]').val($('#up-default-filename').text());
	$('[name=attach_detail]').val($('#up-detail-filename').text());
	$('form[name=updateForm]').submit();
}
</script>
<script type="text/javascript" src="js/need_check.js"></script>
</body>
</html>