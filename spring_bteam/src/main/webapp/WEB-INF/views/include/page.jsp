<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.page_on, .page_off, .page_first, .page_prev, .page_next, .page_last {	display: inline-block; line-height: 30px; margin: 0; }
.page_on{	color: orange; font-weight: bold; font-size: 2em;}
.page_on, .page_off{ min-width: 22px; padding: 0 5px 2px; }
.page_first, .page_prev, .page_next, .page_last{ width:30px; border: 1px solid #000000; text-indent: -99999999px;}
.page_first {background: url('img/page_first.jpg') center no-repeat;}
.page_prev {background: url('img/page_prev.jpg') center no-repeat;}
.page_next {background: url('img/page_next.jpg') center no-repeat;}
.page_last {background: url('img/page_last.jpg') center no-repeat;}

</style>
<div class="page_list">
<!-- 이전블럭 -->
<c:if test="${page.curBlock gt 1 }">
<a class="page_first" href="javascript:go_page(1)">처음</a>
<a class="page_prev" href="javascript:go_page(${page.beginPage - page.blockPage })">이전</a>
</c:if>
<!-- 현재블럭 -->
<c:forEach var="no" begin="${page.beginPage }" end="${page.endPage }">
	<c:if test="${no eq page.curPage }">
		<span class="page_on">${no }</span>
	</c:if>
	<c:if test="${no ne page.curPage }">
		<span class="page_off"><a href="javascript:go_page(${no })">${no }</a></span>
	</c:if>
</c:forEach>
<!-- 다음블럭 -->
<c:if test="${page.curBlock lt page.totalBlock }">
<a class="page_next" href="javascript:go_page(${page.endPage + 1 })">다음</a>
<a class="page_last" href="javascript:go_page(${page.totalPage })">마지막</a>
</c:if>
</div>
<script type="text/javascript">
function go_page(no){
	$('[name=curPage]').val(no);
	$('form').submit();
}
</script>