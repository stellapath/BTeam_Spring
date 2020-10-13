<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="css/pwcheck.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(() => {

	document.querySelector(".button").onclick = () => {
		var user_email = document.querySelector("#user_id");
		var user_nickname = document.querySelector("#user_nickname");
		
		if (!user_email.value) {
			alert("이메일을 입력하세요.");
			user_email.focus();
			return false;
		}

		if (!user_nickname.value) {
			alert("닉네임을 입력하세요.");
			user_nickname.focus();
			return false;
		}

		$.ajax({
			type: "POST",
			url: "pwcheckReq",
			data: { user_email:user_email.value, user_nickname:user_nickname.value },
			success: function( data ){
				if (data != null) {
					alert("비밀번호는 " + data + "입니다.");
					location.href = "login";
				} else {
					alert("가입되지 않은 이메일이거나, \n닉네임을 잘못 입력하셨습니다.");
					user_email.focus();
				}
			}
			,error: () => { alert("Error!"); }
		});
	}

	$(".reset").click(function(){
		$("#user_id").val("");
		$("#user_nickname").val("");
		$("#user_id").focus();
		return true;
	});//reset click()
	
});//ready function
</script>
</head>
<body>
<div id="wrap">
	<h2 class="title">비밀번호 찾기</h2>
	
	<p class="inputline">
		<label for="user_id" class="email">Email</label><br>
		<input type="text" id="user_id" name="user_email" class="input" placeholder="이메일을 입력하세요"/>
	</p>
	<p class="inputline">
		<label for="user_nickname" class="nickname">Nickname</label><br>
		<input type="text" id="user_nickname" name="user_nickname" class="input" placeholder="닉네임을 입력하세요"/>
	</p>
	<p id="buttons">
		<input type="submit" value="검색하기" class="button"><br>
		<input type="reset" value="취소 " class="reset"/>
	</p>
	
	<div id="signup">
		<ul>
			<li><a href="#" onclick="location.href='login'">로그인</a></li>
			<li><a>|</a></li>
			<li><a href="#" onclick="location.href='signup'">회원가입</a></li>
		</ul>
	</div>

</div>
</body>
</html>