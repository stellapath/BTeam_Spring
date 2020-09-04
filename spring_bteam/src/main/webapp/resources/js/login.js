$(document).ready(() => {

	document.querySelector(".button").onclick = () => {
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
	
});