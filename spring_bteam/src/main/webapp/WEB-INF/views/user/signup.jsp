<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 유효성 검사 -->
<jsp:include page="/WEB-INF/views/user/signupcheck.jsp"></jsp:include>
<!-- 주소입력 -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<!-- 회원가입폼.css -->
<link rel='stylesheet' type='text/css' href='css/signupForm.css?v=1<%= new java.util.Date().getTime()%>'>
<script>
$(document).ready(() => {

	// 이메일 중복 확인
	let isEmail = 0;
	let isChecked = 0;
	$("#email_chkBtn").on("click", () => {
		let user_email = $("#user_email").val();
		if (!user_email) {
			alert("이메일을 입력해주세요.");
			return false;
		}
		// alert(user_email);
		$.ajax({
			url: "emailCheck?user_email=" + user_email,
			// success: (data) => { isEmail = data; },
			error: () => { alert("Error!"); }
		}).done((data) => {		
			// alert(data);
			if (data == 1) {
				alert("이미 사용중인 이메일 입니다.");
				isEmail = 1;
			} else {
				alert("사용가능한 이메일 입니다.");
				isEmail = 0;
			}
			isChecked = 1;
		});
	});

	//비밀번호 확인
	$("#check_pw").keyup(function(){

		var check_pw = $("#check_pw").val();
		var user_pw = $("#user_pw").val();
			
			if(check_pw != user_pw){
				$("#check_msg").html("비밀번호를 확인하세요.").css("color", "red");
				return false;
			}else{
				$("#check_msg").html("비밀번호 일치").css("color", "green");
			}
			
		
	});
	
	// 폼 유효성 검사
	document.querySelector("#form").onsubmit = () => {
		
		if (isChecked == 0) {
			alert("이메일 중복 확인을 해주세요.");
			return false;
		}
			
	};
	
});
</script>

</head>
<body>
<div id="signupForm">
	<h2>회원가입</h2>
	<form action="signupReq" method="post" id="form">
		<table>
			<tr>
				<th><img alt="email" src="resources/img/icon_email.png"></th>
				<td>
					<input type="text" name="user_email" id="user_email" required 
						placeholder="이메일을 입력하세요."/><br/>
					<a class="btn-fill" id="email_chkBtn">이메일 중복 확인</a>
				</td>
			</tr>
			<tr>
				<th><img alt="email" src="resources/img/icon_pw.png"></th>
				<td>
					<input type="password" name="user_pw" id="user_pw" required 
						placeholder="비밀번호를 입력하세요."/><br/>
					<input type="password" id="check_pw" required 
						placeholder="비밀번호를 다시 입력하세요."/>
					<span id="check_msg"></span>
				</td>
			</tr>
			<tr>
				<th><img alt="email" src="resources/img/icon_nickname.png"></th>
				<td>
					<input type="text" name="user_nickname" id="user_nickname" required 
						placeholder="닉네임을 입력하세요."/></td>
			</tr>
			<tr>
				<th><img alt="email" src="resources/img/icon_phone.png"></th>
				<td>
					<input type="tel" name="user_phone" id="user_phone"
						placeholder="전화번호를 입력하세요.(입력형식: 010-0000-0000)"/></td>
			</tr>	
			<tr>
				<th><img alt="email" src="resources/img/icon_address.png"></th>
				<td>
					<input type="text" name="user_zipcode" class="postcodify_postcode5" 
						placeholder="우편번호" />
					<a class="btn-fill" id="postcodify_search_button">우편번호 검색</a><br/>
					<input type="text" name="user_address" class="postcodify_address" 
						placeholder="주소를 입력하세요." /><br/>
					<input type="text" name="detail_address" class="postcodify_details" 
						placeholder="상세주소를 입력하세요." />
				</td>
			</tr>
			<tr>
				<th><img alt="email" src="resources/img/icon_birth.png"></th>
				<td>
					<input type="date" name="user_birth"/></td>
			</tr>
		</table>
	<div id="buttons">
		<input type="submit" id="btn_submit" value="회원가입" /><br/>
		<input type="reset" value="가입취소" onclick="location.href='/bteam/'" />
	</div>
	</form>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>
