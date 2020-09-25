<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form action="${url }" method="post">
<input type="text" name="board_num" value="${vo.board_num }"/>
<input type="text" name="board_category" value="1"/>
<input type="hidden" name="curPage" value="${page.curPage }"/>
<input type="hidden" name="pageList" value="${page.pageList }"/>
<input type="hidden" name="recommend" value="${page.recommend }"/>
<input type="hidden" name="viewType" value="${page.viewType }"/>
</form>
<script>$('form').submit()</script>