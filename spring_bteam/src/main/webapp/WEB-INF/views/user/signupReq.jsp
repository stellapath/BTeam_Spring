<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
if(${result}) {
	alert("회원 가입이 완료되었습니다.");
	location.href = "login";
} else {
	alert("회원 가입에 실패했습니다. 잠시 후에 다시 시도해 주세요.");
	history.back();
}

</script>