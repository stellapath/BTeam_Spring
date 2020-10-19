<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/login.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="js/login.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	   
	   $(".reset").click(function(){
	      $("#user_id").val("");
	      $("#user_pw").val("");
	      $("#user_id").focus();
	      return true;
	   });//reset click
	   
	});//ready function

	function go_login(){
	   var user_email = document.querySelector("#user_id");
	   var user_pw = document.querySelector("#user_pw");
	   
	   if (!user_email.value) {
	      alert("이메일을 입력하세요.");
	      user_email.focus();
	      return false;
	   }

	   if (!user_pw.value) {
	      alert("비밀번호를 입력하세요.");
	      user_pw.focus();
	      return false;
	   }

	   $.ajax({
	      type: "POST",
	      url: "loginReq",
	      data: { user_email:user_email.value, user_pw:user_pw.value },
	      error: () => { alert("Error!"); }
	   }).done((data) => {
	      if (data == 1) {
	         alert("로그인 되었습니다.");
	         location.href = "home";
	      } else {
	         alert("존재하지 않는 이메일이거나, \n비밀번호를 잘못 입력하셨습니다.");
	      }
	   });
	   
	}

</script>
</head>
<body>
<div id="wrap">
   <h2 class="title">로그인</h2>
   <p class="inputline">
      <label for="user_id" class="email">Email</label><br>
      <input type="text" id="user_id" name="user_email" class="input" placeholder="이메일을 입력하세요"/>
   </p>
   <p class="inputline">
      <label for="user_pw" class="password">Password</label><br>
      <input onkeypress="if(event.keyCode==13){go_login()}" 
         type="password" id="user_pw" name="user_pw" class="input" placeholder="비밀번호">
<!--       <input type="password" id="user_pw" name="user_pw" class="input" placeholder="비밀번호를 입력하세요"/> -->
   </p>
   <p id="buttons">
      <input type="submit" value="로그인" class="button" onclick="go_login()"><br>
      <input type="reset" value="취소 " class="reset"/>
   </p>
<div>  
<p id="token-result"></p>
   </div>   
   <div id="signup">
      <ul>
         <li><a href="pwcheck" >비밀번호 찾기</a></li>
         <li><a>|</a></li>
         <li><a href="signup" >회원가입</a></li>
      </ul>
   </div>
</div>

</body>
</html>