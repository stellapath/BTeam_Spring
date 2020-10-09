<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지/제품관리</title>
<style type="text/css">
#productAddInfo input, #updateInfo input{ text-align: center;}
</style>
</head>
<body>
<div id="productAdd">
<h4>제 품 등 록</h4>
	<div id="productAddInfo">
		<form action="productAdd" method="post">
		<table>
		<tr><th>제품번호</th><th>제품명</th><th>가격</th><th></th></tr>
		<tr><td><input type="text" name="p_num" class="need" title="제품번호"/></td>
			<td><input type="text" name="p_name" maxlength="20" class="need" title="제품명"/></td>
			<td><input type="number" name="p_price" class="need" title="제품가격"/></td>
			<td><div id="productAddBtn">
					<a class="btn_fill_s" onclick="if(necessary()){$('form').submit()}">등록</a>
					<a class="btn_empty_s" id="addCancel">취소</a>
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
			<td>${vo.p_price }</td>
			<td>${vo.p_date }</td>
			<td><a onclick="go_update('${vo.p_num }', '${vo.p_name }', '${vo.p_price }')" class="btn_fill_s">수정</a></td>
			<td><a onclick="go_delete('${vo.p_num }', '${vo.p_name }', '${vo.p_price }', '${vo.p_date }')" class="btn_fill_s">삭제</a></td>
		</tr>
		</c:forEach>
	</table>
</div>
<div id="productUpdate" style="display: none;">
<h4>등 록 제 품 수 정</h4>
	<div id="productUpdateInfo">
		<form action="productUpdate" name="updateForm" method="post">
		<table>
		<tr><th>제품번호</th><th>제품명</th><th>가격</th><th></th></tr>
		<tr id="updateInfo">
			<td><input type="text" name="p_num" readonly style="border: none;"/></td>
			<td><input type="text" name="p_name" maxlength="20" class="need" title="수정할 제품명"/></td>
			<td><input type="number" name="p_price" class="need" title="수정할 제품가격"/></td>
			<td><div id="productUpdateBtn">
					<a class="btn_fill_s" onclick="$('form[name=updateForm]').submit()">수정</a>
					<a class="btn_empty_s" id="updateCancel">취소</a>
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
});

function go_delete( num, name, price, date ){
	alert( "제품번호: " + num + "\n제품명: " + name + "\n가격: " + price + "등록일: " + date + "\n\n제품을 삭제하시겠습니까??" );
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

function go_update( num, name, price ){
	$('#productUpdate').show();
	$('#updateInfo td:first-child input').attr('value', num );
	$('#updateInfo td:nth-child(2) input').attr('value', name );
	$('#updateInfo td:nth-child(3) input').attr('value', price );
}
</script>
<script type="text/javascript" src="js/need_check.js"></script>
</body>
</html>