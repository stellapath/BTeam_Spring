$(document).ready(() => {

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

		var getNickname = /^[가-힣]+$/;
		var getPw = /^[0-9a-z]{4,12}$/;
		var getEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var getPhone = /^[0-9]{9,11}$/;

		// 중복검사 유무
		if (isChecked == 0) {
			alert("이메일 인증을 완료해주세요.");
			return false;
		}

		//이메일 입력확인
		if ($("#user_email").val() == "") {
			alert("이메일을 입력하세요.");
			$("#user_email").focus();
			return false;
		}
		//이메일 유효성
		if (!getEmail.test($("#user_email").val())) {
			alert("이메일을 확인해주세요.");
			$("#user_email").val("");
			$("#user_email").focus();
			return false;
		}

		//비밀번호 입력확인
		if (!$("#user_pw").val()) {
			alert("비밀번호를 입력하세요.");
			$("#user_pw").focus();
			return false;
		}
		//비밀번호 유효성
		if (!getPw.test($("#user_pw").val())) {
			alert("비밀번호는 영문 또는 숫자를 사용하여 4~12자로 입력하세요.")
			$("#user_pw").val("");
			$("#user_pw").focus();
			return false;
		}

		//비밀번호확인여부
		if ($("#check_pw").val() == "") {
			alert("비밀번호를 확인하세요.");
			$("#check_pw").focus();
			return false;
		}

		//별명 입력확인
		if (!$("#user_nickname").val()) {
			alert("별명을 입력하세요.");
			$("#user_nickname").focus();
			return false;
		}

		//별명 유효성
		if (!getNickname.test($("#user_nickname").val())) {
			alert("별명은 한글 2~10자로 입력하세요.")
			$("#user_nickname").val("");
			$("#user_nickname").focus();
			return false;
		}
		
		//전화번호 유효성
		if ($("#user_phone").val() && !getPhone.test($("#user_phone").val())) {
			alert("전화번호는 숫자만 입력하세요.");
			$("#user_phone").val("");
			$("#user_phone").focus();
			return false;
		}
			
	};
	
});