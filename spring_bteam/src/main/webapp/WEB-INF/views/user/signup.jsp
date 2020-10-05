<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 유효성 검사 -->
<jsp:include page="/WEB-INF/views/user/signupcheck.jsp"></jsp:include>
<script type="text/javascript" src="js/signup.js?v=<%=new java.util.Date().getTime()%>"></script>
<!-- 주소입력 -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<!-- 회원가입폼.css -->
<link rel='stylesheet' type='text/css' href='css/signupForm.css?v=1<%= new java.util.Date().getTime()%>'>
<script type="text/javascript">
$(document).on('click', '#email_certification', function(){
	if($('#user_email').val() == ''){
		//이메일 미입력
		alert('이메일을 입력하세요.');
		$('#user_email').focus();
	}else{
		let isEmail = 0;
		let isChecked = 0;
		//이메일 중복확인
		$.ajax({
			url: 'emailCheck',
			data: { user_email: $('#user_email').val()	},
			error: function(req, text){
				alert(text+':'+req.status);
			}
		}).done((data) => {		
			if (data == 1) {
				alert("이미 사용중인 이메일 입니다.");
				$('#user_email').focus();
				isEmail = 1;
			} else {
				isEmail = 0;
				//인증 이메일 발송
				$.ajax({
					url: 'email_certification',
					data: { email: $('#user_email').val()	},
					success: function( email ){
						alert('이메일이 성공적으로 발송되었습니다.\n입력하신 이메일을 확인해주세요.');
					},
					error: function(req, text){
						alert(text+':'+req.status);
					}
				});
			}
			isChecked = 1;
		});
	}
}).on('click','#check_certification', function(){
	if($('#input_certification').val() == ''){
		//이메일 미입력
		alert('인증번호를 입력하세요.');
		$('#input_certification').focus();
	}else{
// 		var key = ;
// 		alert( "인증키: " + key );
// 		$.ajax({
// 			url: 'check_certification',
// 			data: { email_key: $('#input_certification').val()	},
// 			success: function( email_key ){
// 				alert('이메일 인증이 완료되었습니다.');
// 			},
// 			error: function(req, text){
// 				alert(text+':'+req.status);
// 			}
// 		});
	}	
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
					<a class="btn-fill" id="email_certification" >인증메일발송</a><br/>
					<input type="text" name="input_certification" placeholder="메일에 적힌 인증번호를 입력하세요."/><br/>
					<a class="btn-fill" id="check_certification" >인증확인</a>
				</td>
			</tr>
			<tr>
				<th><img alt="password" src="resources/img/icon_pw.png"></th>
				<td>
					<input type="password" name="user_pw" id="user_pw" required 
						placeholder="비밀번호를 입력하세요."/><br/>
					<input type="password" id="check_pw" required 
						placeholder="비밀번호를 다시 입력하세요."/><br/>
					<span id="check_msg"></span>
				</td>
			</tr>
			<tr>
				<th><img alt="nickname" src="resources/img/icon_nickname.png"></th>
				<td>
					<input type="text" name="user_nickname" id="user_nickname" required 
						placeholder="닉네임을 입력하세요."/></td>
			</tr>
			<tr>
				<th><img alt="tel" src="resources/img/icon_phone.png"></th>
				<td>
					<input type="tel" name="user_phone" id="user_phone"
						placeholder="전화번호를 입력하세요.(기호없이 숫자만 입력)"/></td>
			</tr>	
			<tr>
				<th><img alt="address" src="resources/img/icon_address.png"></th>
				<td>
					<input type="text" name="user_zipcode" class="postcodify_postcode5" 
						placeholder="우편번호" />
					<a class="btn_fill" id="postcodify_search_button">우편번호 검색</a><br/>
					<input type="text" name="user_address" class="postcodify_address" 
						placeholder="주소를 입력하세요." /><br/>
					<input type="text" name="detail_address" class="postcodify_details" 
						placeholder="상세주소를 입력하세요." />
				</td>
			</tr>
			<tr>
				<th><img alt="birth" src="resources/img/icon_birth.png"></th>
				<td><input type="date" name="user_birth"/></td>
			</tr>
		</table>
	<div id="buttons">
		<input type="submit" id="btn_submit" value="회원가입" /><br/>
		<input type="reset" value="가입취소" onclick="location.href='/bteam/home'" />
	</div>
	</form>
</div>
</body>
</html>
