<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="css/login.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="js/login.js"></script>
</head>
<body>
<div id="wrap">
	<p class="title">로그인</p>
	
	<p class="inputline">
		<label for="user_id" class="email">Email</label><br>
		<input type="text" id="user_id" name="user_email" class="input" placeholder="이메일을 입력하세요"/>
	</p>
	<p class="inputline">
		<label for="user_pw" class="password">Password</label><br>
		<input type="password" id="user_pw" name="user_pw" class="input" placeholder="비밀번호를 입력하세요"/>
	</p>
	<p id="buttons">
		<input type="button" value="로그인" class="button"><br>
		<span class="txt_or">또는</span><br>
		<input type="button" value="NAVER계정으로 로그인" class="naver"><br>
		<input type="button" value="카카오계정으로 로그인" class="kakao">
	</p>
	
	<div id="signup">
		<ul>
			<li><a href="#" onclick="location.href=''">아이디 찾기</a></li>
			<li><a>|</a></li>
			<li><a href="#" onclick="location.href=''">비밀번호 찾기</a></li>
			<li><a>|</a></li>
			<li><a href="#" onclick="location.href='signup'">회원가입</a></li>
		</ul>
	</div>

</div>
</body>
</html>