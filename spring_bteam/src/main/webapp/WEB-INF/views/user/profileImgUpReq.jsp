<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
if (${result}) {
	alert("프로필 이미지가 변경되었습니다.");
} else {
	alert("변경에 실패했습니다. 잠시 후에 다시 시도해 주세요.");
}
opener.location.reload();
window.close();
</script>