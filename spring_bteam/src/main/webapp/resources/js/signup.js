/**
 * 회원가입 시 유효성 체크
 */

	
$(document).on('click', '#email_certification', function(){
	var getEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if($('#user_email').val() == ''){
		//이메일 미입력
		alert('이메일을 입력하세요.');
		$('#user_email').focus();
	}else{
		//이메일 유효성
		if (!getEmail.test($("#user_email").val())) {
			alert("이메일 형식을 확인해주세요.");
			$("#user_email").val("");
			$("#user_email").focus();
			return false;
		}
		
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
					data: { email: $('#user_email').val() },
					success: function( email ){
 						alert('이메일이 성공적으로 발송되었습니다.\n발송된 메일을 확인해주세요.');
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
	//이메일 인증번호 확인
	$.ajax({
		url: 'emailConfirm',
		data: { input_key: $('input[name="input_certification"]').val() },
		success: function( input_key ){
			if( input_key ){
				alert('이메일 인증이 완료되었습니다.');
				$('#emailConfirmResult').children().attr('class', 'fas fa-check-circle');
				$('#emailConfirmResult').css('color', 'green');
				$('#email_confirm').attr('value', 1);
			}else{
		 		alert('이메일 인증에 실패했습니다.\n입력하신 인증번호를 확인하세요.');
		 		$('#emailConfirmResult').children().attr('class', 'fas fa-check-circle');
		 		$('#emailConfirmResult').css('color', 'red');
				$('#email_confirm').attr('value', 0);
			}
		},
		error: function(req, text){
			alert(text+':'+req.status);
		}
	});
	
}).on('change', '[name="user_email"]', function(){
	
	$('#emailConfirmResult').children().attr('class', 'far fa-check-circle');
	$('#emailConfirmResult').css('color', 'black');
	$('#email_confirm').attr('value', 0);
	
}).on('keyup', '#check_pw', function(){
	var check_pw = $("#check_pw").val();
	var user_pw = $("#user_pw").val();
	
	var getPw = /^[a-zA-Z0-9]/g, getUpper = /[A-Z]/g, getLower = /[a-z]/g, getDigit = /[0-9]/g;
	
	//비밀번호 입력확인
	if (!$("#user_pw").val()) {
		alert("비밀번호를 입력하세요.");
		$("#user_pw").focus();
		return false;
	}
	//비밀번호 유효성
	if (!getPw.test($("#user_pw").val()) || !getUpper.test($("#user_pw").val()) || !getLower.test($("#user_pw").val()) || !getDigit.test($("#user_pw").val())) {
		alert("비밀번호는 영대소문와 숫자를 조합하여 5~10자로 입력하세요.");
		$("#user_pw").val("");
		$("#user_pw").focus();
		return false;
	}	
	//비밀번호 확인	
	if(check_pw != user_pw){
		$("#check_msg").html("비밀번호를 확인하세요.").css("color", "red");
	 	$('#pwCheckResult').children().attr('class', 'fas fa-check-circle');
	 	$('#pwCheckResult').css('color', 'red');
		return false;
	}else{
		$("#check_msg").html("비밀번호 일치").css("color", "green");
	 	$('#pwCheckResult').children().attr('class', 'fas fa-check-circle');
	 	$('#pwCheckResult').css('color', 'green');
	}
	
}).on('input', '[name=user_nickname]', function(){
	
	var getNickname = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	//별명 유효성
	if (!getNickname.test($("#user_nickname").val())) {
		alert("별명은 한글로만 입력하세요.")
		$("#user_nickname").val("");
		$("#user_nickname").focus();
		return false;
	}
}).on('keyup', '[name=user_phone]', function(){
	
	//전화번호 하이픈 자동입력
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/([0-9]{2,3})+([0-9]{3,4})+([0-9]{4})/,"$1-$2-$3").replace("--", "-"));
	
}).on('click', '#btnSubmit', function(){
	var need = true;
	//필수입력칸 빈칸확인
	$('.need').each(function(){
		if($(this).val() == ''){
			alert($(this).attr('title') + '을 입력하세요!!');
			$(this).focus();
			need = false;
			return need;
		}
	});	
	
	//이메일 인증확인
	var email_comfirm = $('#email_confirm').val();
	if(email_comfirm != 1){
		alert('이메일 인증을 다시 진행하세요.');
	 	$('input[name="input_certification"]').focus();
	 	need = false;
		return need;
	}
	//확인후 회원가입처리 진행	
	if(need) {	$('form').submit();}
});
