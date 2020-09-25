<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용후기</title>
</head>
<body>
<div id="list-top">
<form action="reviewBoard" method="post">
<input type="hidden" name="curPage" value="1"/>
<input type="hidden" name="board_category" value="1"/>
<div>
<ul>
	<c:if test="${!empty login_info}">
	<li><a class="btn_fill right" href="reviewWrite">후기작성하기</a></li>
	</c:if>
</ul>
<ul>
	<li>
		<select name="viewType" class="w-px80" onchange="$('form').submit()">
		<option value="list" ${page.viewType eq 'list' ? 'selected' : '' }>전체리뷰</option>
		<option value="photo" ${page.viewType eq 'photo' ? 'selected' : '' }>포토리뷰</option>
		</select>
	</li>
	<li>
		<select name="recommend" class="w-px80" onchange="$('form').submit()">
		<option value="all" ${page.recommend eq 'all' ? 'selected' : '' }>추천여부</option>
		<option value="recommend" ${page.recommend eq 'recommend' ? 'selected' : '' }>추천후기</option>
		<option value="derecommend" ${page.recommend eq 'derecommend' ? 'selected' : '' }>비추천후기</option>
		</select>
	</li>
	<li>
		<select name="pageList" class="w-px80" onchange="$('[name=curPage]').val(1); $('form').submit()">
		<option value="10" ${page.pageList eq '10' ? 'selected' : '' }>10개씩</option>
		<option value="20" ${page.pageList eq '20' ? 'selected' : '' }>20개씩</option>
		<option value="30" ${page.pageList eq '30' ? 'selected' : '' }>30개씩</option>
		</select>
	</li>
</ul>
</div>
</form>
</div>
<div id="reviewList">
<c:if test="${page.viewType eq 'list' }">
<table>
<tr><th class="w-px80">글번호</th>
	<th>리뷰</th>
	<th class="w-px120">작성자</th>
	<th class="w-px120">작성일</th>
	<th class="w-px80">추천</th>
</tr>
<c:forEach items="${page.list}" var="vo">	
<tr><td>${vo.board_no }</td>
	<td class="left">
		<a class="board_title" >${vo.board_title }</a><br/>
		<div class="review_detail" style="display: none">
			<c:if test="${!empty vo.board_filename }">
			<img src="<c:url value='/' />${vo.board_filepath}" class="file-img"/><br/>
			</c:if>
			${vo.board_content }
		</div>
	</td>
	<td>${vo.board_nickname }</td>
	<td>${vo.board_date }</td>
	<td>
		<c:if test="${vo.board_recommend eq 'RECOMMEND' }">
		<i class="far fa-thumbs-up" style="color: green"></i>
		</c:if>
		<c:if test="${vo.board_recommend eq 'DERECOMMEND' }">
		<i class="far fa-thumbs-down" style="color: red"></i>
		</c:if>
	</td>
</tr>
</c:forEach>
</table>
</c:if>
<c:if test="${page.viewType eq 'photo' }">
<ul class="photoView" style="padding: 0">
<c:forEach items="${page.list }" var="vo">
<!-- 	<li><div><img src="https://image.aladin.co.kr/product/60/40/cover/scm3753351354.jpg" class="file-img"/></div> -->
	<li><div><img src="<c:url value='/' />${vo.board_filepath}" class="file-img"/></div>
		<div><a href="#">${vo.board_title }</a>
			 <c:if test="${vo.board_recommend eq 'RECOMMEND' }">
			 <i class="far fa-thumbs-up" style="color: green"></i>
			 </c:if>
			 <c:if test="${vo.board_recommend eq 'DERECOMMEND' }">
			 <i class="far fa-thumbs-down" style="color: red"></i>
			 </c:if>
		</div>
		<div>${vo.board_date }</div>
	</li>
</c:forEach>
</ul>
</c:if>
<div class="buttons">
<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>
</div>
<script type="text/javascript">
$('.board_title').click(function(){
//	$(this).siblings('.review_detail').toggle();

 	$('.review_detail').toggle();				//전부	
});

</script>
</body>
</html>