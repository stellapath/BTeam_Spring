/**
 * 
 */
 
$(document).ready(() => {

	document.querySelector("#button").onclick = () => {
		var qna_question = document.querySelector("#qna_question");
		var qna_email = document.querySelector("#qna_email");
		var qna_content = document.querySelector("#qna_content");
		var qna_nickname = document.querySelector("#qna_nickname");
		
		if (!qna_question.value) {
			alert("질문을 입력하세요.");
			qna_question.focus();
		}else
		
		if (!qna_email.value) {
			alert("이메일을 입력하세요.");
			qna_email.focus();
		}else
		
		if (!qna_nickname.value) {
			alert("이름(닉네임)을 입력하세요.");
			qna_nickname.focus();
		}else
		
		if (!qna_content.value) {
			alert("내용을 입력하세요.");
			qna_content.focus();
		}else
		$('form').submit();
	}
	
});