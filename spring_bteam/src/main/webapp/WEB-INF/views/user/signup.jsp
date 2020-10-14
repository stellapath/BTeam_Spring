<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
#check_msg{position: absolute; margin-top: -50px; width:280px; text-align:right; font-size: 13px; font-weight: bold;}
#emailConfirmResult{ color: black; position: absolute; margin-left: -25px; margin-top: 7px;}
#pwCheckResult{   position: absolute;	margin-top: -30px;    margin-left: 284px;}
</style>
<!-- 회원가입폼.css -->
<link rel='stylesheet' type='text/css' href='css/signupForm.css?v=1<%= new java.util.Date().getTime()%>'>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<div id="wrap">
	<h2>회원가입</h2>
	<form action="signupReq" method="post" id="form">
	<input type="hidden" id="email_confirm" value="0"/> 
		<table>
			<tr>
				<th><img alt="email" src="resources/img/icon_email.png"></th>
				<td id="email">
					<input type="text" name="user_email" id="user_email" class="need" title="이메일" placeholder="이메일을 입력하세요." value="${user_email }" required/><br/>
					<a class="btn-fill msg" id="email_certification" >인증메일발송</a><br/>
					<input type="text" name="input_certification" class="need" title="이메일 인증번호" placeholder="메일에 적힌 인증번호를 입력하세요."/>
					<span id="emailConfirmResult" ><i class="far fa-check-circle"></i></span><br/>
					<a class="btn-fill msg" id="check_certification" >인증확인</a>
				</td>
			</tr>
			<tr>
				<th><img alt="password" src="resources/img/icon_pw.png"></th>
				<td>
					<input type="password" name="user_pw" id="user_pw" class="need" title="비밀번호" placeholder="비밀번호를 입력하세요." required/><br/>
					<input type="password" id="check_pw" class="need" title="비밀번호 확인" placeholder="비밀번호를 다시 입력하세요." required/><br/>
					<span id="pwCheckResult" ><i class="far fa-check-circle"></i></span><br/>
					<span id="check_msg"></span>
				</td>
			</tr>
			<tr>
				<th><img alt="nickname" src="resources/img/icon_nickname.png"></th>
				<td>
					<input type="text" name="user_nickname" id="user_nickname" class="need" title="닉네임" placeholder="닉네임을 입력하세요." required/></td>
			</tr>
			<tr>
				<th><img alt="tel" src="resources/img/icon_phone.png"></th>
				<td>
					<input type="tel" name="user_phone" id="user_phone" placeholder="전화번호를 입력하세요.(하이픈 자동생성)"/>
				</td>	
			</tr>	
			<tr>
				<th><img alt="address" src="resources/img/icon_address.png"></th>
				<td>
					<input type="text" name="user_zipcode" class="postcodify_postcode5" 
						placeholder="우편번호" />
					<a class="btn_fill msg" id="postcodify_search_button">우편번호 검색</a><br/>
					<input type="text" name="user_address" class="postcodify_address" 
						placeholder="주소를 입력하세요." /><br/>
					<input type="text" name="detail_address" class="postcodify_details" 
						placeholder="상세주소를 입력하세요." />
				</td>
			</tr>
			<tr>
				<th><img alt="birth" src="resources/img/icon_birth.png"></th>
				<td><input type="text" name="user_birth" readonly/>
					<span id="delete" style="color : red; position: absolute; margin-top:5px; margin-left:-25px; display: none;"><i class="fas fa-eraser font-img"></i></span>
				</td>
			</tr>
		</table>
	<div id="buttons">
<!-- 		<input type="submit" id="btn_submit" value="회원가입" /><br/> -->
		<a id="btnSubmit" class="button" style="margin-bottom: 15px;">회원가입</a>
		<a id="btnCancel" class="reset" onclick="$('form')[0].reset(); location.href='/bteam/home'">가입취소</a><br/>
	</div>
	</form>
</div>
<!-- 주소입력 -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<!-- jQuery DatePicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 유효성검사 -->
<script type="text/javascript" src="js/signup.js?v=<%=new java.util.Date().getTime()%>"></script>
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
</body>
</html>
