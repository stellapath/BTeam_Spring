<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<c:if test="${login_info eq null}">
<script>
	alert("로그인이 필요한 페이지 입니다.");
	location.href = "login";
</script>
</c:if>

<script>
function imageUpload() {
	window.open("profileImgUp", "프로필 이미지 변경", 
		"width=400, height=300, scrollbars=0, status=0, toolbar=0"
	);
}
</script>
<!-- 주소입력 -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
</head>
<body>
<form action="update" method="post">
<input type="hidden" name="user_email" value="${login_info.user_email}"/>
<table>	
	<tr>
		<th class="w-px120">프로필 사진</th>
		<td>
			<img src="profileImgDn?user_email=${login_info.user_email}" style="width:40px;" /><br />
			<button type="button" onclick="imageUpload()" >이미지 변경</button>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${login_info.user_email}</td>
	</tr>
	<tr>
		<th>현재비밀번호</th>
		<td><input type="password" name="input_pw" value="${login_info.user_pw}"/>
			<a class="btn_fill" onclick="change_pw()">변경</a>
			<div class="change_pw" style="display: none;">
				<p>새 비밀번호</p>
				<input type="password" name="user_pw" />
				<p>비밀번호확인</p>
				<input type="password" id="check_pw"/><br/>
				<span class="check_msg"></span>
			</div>
		</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td><input type="text" name="user_nickname" id="user_nickname" required 
					value="${login_info.user_nickname}"/></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="user_phone" id="user_phone" required 
					value="${login_info.user_phone}"/></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="user_zipcode" class="postcodify_postcode5" 
						value="${login_info.user_zipcode}" />
			<a class="btn_fill" id="postcodify_search_button">우편번호 검색</a><br/>
			<input type="text" name="user_address" class="postcodify_address" 
						value="${login_info.user_address}" /><br/>
			<input type="text" name="detail_address" class="postcodify_details" 
						value="${login_info.detail_address}" />
		</td>
	</tr>
	<tr>
		<th>생일</th>
		<td><span id="user_birth">${login_info.user_birth}</span>
			<input type="date" name="user_birth" />
		</td>
	</tr>
</table>
</form>
<div class="buttons">
	<a class="btn_fill" onclick="$('form').submit()">저장</a>
	<a class="btn_empty" href="home">취소</a>
</div>
<script type="text/javascript">
$("[name=user_birth]").change(function(){
	$("#user_birth").text($('[name=user_birth]').val());
});

$(".check_pw").keyup(function(){
	var check_pw = $(".check_pw").val();
	var user_pw = $("[name=user_pw]").val();
		
	if(check_pw != user_pw){
		$(".check_msg").html("비밀번호를 확인하세요.").css("color", "red");
		return false;
	}else{
		$(".check_msg").html("비밀번호 일치").css("color", "green");
	}
});

function change_pw(){
	
	if(!$('[name=input_pw]').val()){
		alert('현재비밀번호를 입력하세요.');
 		$('[name=input_pw]').focus();
 		return false;
	}
	
 	if($('[name=input_pw]').val() == ${login_info.user_pw}){
 		$('.change_pw').css('display', 'inline-block');
 	}else if($('[name=input_pw]').val() != ${login_info.user_pw}){
		alert('현재 비밀번호가 틀렸습니다.\n비밀번호를 다시 입력하세요.');
 		$('[name=input_pw]').val('');
 		$('[name=input_pw]').focus();
 		return false;
 	}
}
</script>
</body>
</html>