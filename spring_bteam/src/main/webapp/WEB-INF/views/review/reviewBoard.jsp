<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용후기</title>
<style type="text/css">
#content{display: table;}
#popup{ position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); height: 500px; width:500px; border: 2px solid #666; display: none;}
#popup img{width: 500px; height: 500px;}
</style>
</head>
<body>
<div id="list-top">
<form action="reviewBoard" method="post">
<input type="hidden" name="curPage" value="1"/>
<input type="hidden" name="board_category" value="1"/>
<div>
<ul><li><a class="btn_fill right" onclick="reviewWrite()">후기작성</a></li></ul>
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
	<table id="boardTable">
	<tr><th class="w-px80">글번호</th>
		<th>리뷰</th>
		<th class="w-px120">작성자</th>
		<th class="w-px120">작성일</th>
		<th class="w-px80">추천</th>
	</tr>
	<c:forEach items="${page.list}" var="vo">	
		<tr><td>${vo.board_no }</td>
			<td class="left">
				<a class="board_title">${vo.board_title }</a>
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
		<tr class="review_detail" style="display: none; background-color: #f0f0f0;">	
			<td colspan="5" >	
				<c:if test="${!empty vo.board_filename }">
				<div class="detail_p" style="width: 200px;">
					<a onclick="popupPhoto('${vo.board_filepath}')"><img src="<c:url value='/' />${vo.board_filepath}" class="file-img"/></a>
				</div>
				</c:if>
				<div class="detail_c" style="text-align: left;">${fn:replace(vo.board_content, crlf, '<br/>')}</div>
				<c:if test="${login_info.user_email eq vo.board_email }">
				<div class="buttons" style="float: right;">
					<a class="btn_empty_s" href="reviewUpdate?board_num=${vo.board_num}">수정</a>
					<a class="btn_fill_s" onclick="go_delete(${vo.board_num})">삭제</a>
				</div>
				</c:if>
			</td>
		</tr>
	</c:forEach>
	</table>
	<div class="buttons" style="margin: 10px 0;">
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
	</div>
</c:if>
<c:if test="${page.viewType eq 'photo' }">
	<ul class="photoView" style="padding: 0">
	<c:forEach items="${page.list }" var="vo">
		<li><div><a onclick="popupPhoto('${vo.board_filepath}')"><img src="<c:url value='/' />${vo.board_filepath}" class="file-img"/></a></div>
			<div class="reviewContent">
				<div><c:if test="${vo.board_recommend eq 'RECOMMEND' }">
					<i class="far fa-thumbs-up" style="color: green"></i>${vo.board_title }
					</c:if>
					<c:if test="${vo.board_recommend eq 'DERECOMMEND' }">
					<i class="far fa-thumbs-down" style="color: red"></i>${vo.board_title }
					</c:if>
				</div>
				<div>${fn:replace(vo.board_content, crlf, '<br/>')}</div>
				<div>${vo.board_date }</div>
				<c:if test="${login_info.user_email eq vo.board_email }">
				<div class="buttons" style="float: right;">
					<a class="btn_empty_s" href="reviewUpdate?board_num=${vo.board_num}">수정</a>
					<a class="btn_fill_s" onclick="go_delete(${vo.board_num})">삭제</a>
				</div>
				</c:if>
			</div>
		</li>
	</c:forEach>
	</ul>
</c:if>
<div id="popup-background" 
		onclick="$('#popup, #popup-background').css('display', 'none');"></div>
<div id="popup">
</div>

</div>
<script type="text/javascript">
$('.board_title').click(function(){
	$(this).parents('tr').next().toggle();
});

function popupPhoto(data){
	var imgpath = '<img src = "/bteam//' + data.substring(1) + '" class="file-img"/>';
	$('#popup, #popup-background').css('display', 'block');
	$('#popup').html(imgpath);
}

function go_delete(board_num){
	var result = confirm('정말 삭제하시겠습니까?');
	if(result) { location.href="reviewDelete?board_num="+board_num;	
				 alert('리뷰가 삭제되었습니다.');	}
}

function reviewWrite( ){
	if( '${login_info.user_email}' != '' ){
		alert('후기작성은 나의 주문내역에서 가능합니다.');
		location.href="myOrder?user_email=${login_info.user_email }";
	}else {
		alert('후기작성은 비회원로그인후 작성가능합니다.');
		location.href="login";
	}
}
</script>
</body>
</html>