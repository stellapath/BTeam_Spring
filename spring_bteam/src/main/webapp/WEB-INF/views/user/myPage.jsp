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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 주소입력 -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
</head>
<body>
<form action="update" method="post">
<input type="hidden" name="user_email" value="${vo.user_email}"/>
<table>	
	<tr>
		<th class="w-px120">프로필 사진</th>
		<td>
			<img src="profileImgDn?user_email=${vo.user_email}" style="width:40px;" /><br />
			<button type="button" onclick="imageUpload()" >이미지 변경</button>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${vo.user_email}</td>
	</tr>
	<tr>
		<th>현재비밀번호</th>
		<td><input type="password" name="input_pw" />
			<a class="btn_fill" onclick="change_pw()">변경</a>
			<div class="change_pw" style="display: none;">
				<p>새 비밀번호</p>
				<input type="password" name="user_pw" value="${login_info.user_pw}"/>
				<p>비밀번호확인</p>
				<input type="password" id="check_pw"/><br/>
				<span class="check_msg"></span>
			</div>
		</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td><input type="text" name="user_nickname" id="user_nickname" required 
					value="${vo.user_nickname}"/></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="user_phone" id="user_phone" required 
					value="${vo.user_phone}"/></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="user_zipcode" class="postcodify_postcode5" 
						value="${vo.user_zipcode}" />
			<a class="btn_fill" id="postcodify_search_button">우편번호 검색</a><br/>
			<input type="text" name="user_address" class="postcodify_address" 
						value="${vo.user_address}" /><br/>
			<input type="text" name="detail_address" class="postcodify_details" 
						value="${vo.detail_address}" />
		</td>
	</tr>
	<tr>
		<th>생일</th>
		<td><input type="text" name="user_birth" value="${vo.user_birth}" readonly />
			<span id="delete" style="color : red; position: relative; right: 30px; display: none; float: left;"><i class="fas fa-eraser font-img"></i></span>
		</td>
	</tr>
</table>
</form>
<div class="buttons">
	<a class="btn_fill" onclick="$('form').submit()">저장</a>
	<a class="btn_empty" href="home">취소</a>
	<a class="btn_fill" style="float: right;" onclick="goodbye_member()">회원탈퇴</a>
</div>
<!-- jQuery DatePicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
//생년월일 입력시 삭제아이콘 활성화
$('[name=user_birth]').change(function(){
	$('#delete').css('display', 'inline-block');
});
$('#delete').click(function(){
	$('[name=user_birth]').val("");
	$('#delete').css('display', 'none');
});

//만 13세 이상부터 가입가능
var today = new Date();
var endDay = new Date(today.getFullYear() - 13, today.getMonth(), today.getDay() - 1);

//생년월일: jQuery DatePicker 사용
$('[name=user_birth]').datepicker({
	showMonthAfterYear: true,
	dateFormat: 'yy-mm-dd',
	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	changeMonth: true,
	changeYear: true,
	maxDate: endDay
});
</script>
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

	$('[name=user_pw]').val('');
	
	if(!$('[name=input_pw]').val()){
		alert('현재비밀번호를 입력하세요.');
 		$('[name=input_pw]').focus();
 		return false;
	}
	
 	if($('[name=input_pw]').val() == ${vo.user_pw}){
 		$('.change_pw').css('display', 'inline-block');
 	}else if($('[name=input_pw]').val() != ${vo.user_pw}){
		alert('현재 비밀번호가 틀렸습니다.\n비밀번호를 다시 입력하세요.');
 		$('[name=input_pw]').val('');
 		$('[name=input_pw]').focus();
 		return false;
 	}
}
</script>
<script type="text/javascript">
function goodbye_member(){
//	alert(user_email);
	var email = '${login_info.user_email}';
	var pw = '${login_info.user_pw}';
	var nickname = '${login_info.user_nickname}';

	//비밀번호 다시 확인
	var goodbye_pw = prompt("회원탈퇴를 위해 비밀번호를 확인합니다.\n회원님의 비밀번호를 입력하세요.");
	if(goodbye_pw == pw){
		alert('탈퇴를 진행합니다.');
// 		$.ajax({
// 			url: 'goodbye',
// 			data: { user_email:$("#user_email").val(), user_pw:$("#user_pw").val() },
// 			success: function(data){
// 				if(data == "1"){	
// //	 				alert("로그인 성공!!!");
// 					location.reload();
// 				}else{
// 					alert("아이디 또는 비밀번호가 일치하지 않습니다!!!");
// 				}
// 			},
// 			error: function(req, text){
// 				alert(text+':'+req.status);
// 			}		
// 		});	
	}else{
		alert('비밀번호가 일치하지 않아 탈퇴가 취소되었습니다.');
		return;
	}
}
</script>
</body>
</html>