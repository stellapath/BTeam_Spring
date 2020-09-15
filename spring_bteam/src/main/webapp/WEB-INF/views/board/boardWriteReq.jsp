<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
if (${result}) {
	alert("공지사항이 등록되었습니다.");
} else {
	alert("공지사항 등록에 실패했습니다. 잠시 후에 다시 시도해 주세요.");
}
opener.location.reload();
window.close();
</script>