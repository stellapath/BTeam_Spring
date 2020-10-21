<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="pageName">
	<p class="subTitleName">사용후기 상세보기</p>
	<div class="titleLine"></div>
</div>
<div>
	<table id="boardTable">
		<tr>
			<th class="w-px100">구매상품</th>
			<td>${order_product }</td>
			<th class="w-px100">추천여부</th>
			<td><c:if test="${vo.board_recommend == 'RECOMMEND' }">추천<i class="far fa-thumbs-up"></i></c:if>
				<c:if test="${vo.board_recommend == 'DERECOMMEND' }">비추천<i class="far fa-thumbs-down"></i></c:if>
			</td>
		</tr>
		<tr><th class="w-px100">제목</th><td colspan="3" style="text-align: left;">${vo.board_title }</td></tr>
		<tr><th>내용</th><td colspan="3" class="contentBox" style="text-align: left; height: 300px;">${fn:replace(vo.board_content, crlf, '<br/>')}</td></tr>
		<tr>
			<th>첨부파일</th>
			<td style="text-align: left;" colspan="3">
				<c:if test="${empty vo.board_filename }">
					첨부된 파일이 없습니다.
				</c:if>
				<c:if test="${!empty vo.board_filename }">
					<img src="<c:url value='/' />${vo.board_filepath}" class="file-img"/>
				</c:if>
			</td>
		</tr>
	</table>
</div><br/>
<div id="btnSet">
	<a class="btn_fill" href="reviewUpdate?board_num=${vo.board_num }">수정</a>
	<a class="btn_empty" href="javascript:history.go(-1)">이전</a>
</div>
</body>
</html>