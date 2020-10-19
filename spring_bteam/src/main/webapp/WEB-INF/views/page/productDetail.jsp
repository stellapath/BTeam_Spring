<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.listBar {display: inline-block; width: 100%; margin-top: 50px; margin-bottom: 20px;}
.listBar ul {overflow: hidden; width: max-content; margin: 0 auto;}
.listBar ul li {float: left; margin-left: -2px;}
.listBar ul li:first-child {margin-left: 0px;}
a.productName { display:inline-block; padding: 10px 20px; border: 2px solid #F8AA34; font-weight: bold;}
a.productName:hover, a.clicked { background-color: #F8AA34; }

.productBox, .productOverZone {display: inline-block; width: 100%; min-width: max-content;}
.productOverZone {overflow: hidden;}
.productMainImage, .productInfo {display: block; width: 50%; min-width: 300px; min-height:300px; box-sizing: border-box; float: left;}
.productMainImage { vertical-align: middle;}
.productInfo ul li:first-child{ text-align: left;}

.noImage {width: 300px; margin: 0 auto; vertical-align: middle;}
.productDetailImage { min-height: 500px; vertical-align: middle;}
.detailImage{ width: 100%;}
.defaultImage{height: 300px; width: 300px; box-sizing: border-box;}

#btnGoPage { margin: 20px 0px; width: 100%; }
.goPage{ display:inline-block; width: 300px; margin: 5px 0 auto; padding: 10px 0; border: 2px solid #F8AA34; border-radius: 5px; font-weight: bold;}

</style>
</head>
<body>
<div class="pageName">
	<p class="titleName">제품상세정보</p>
	<div class="titleLine"></div>
</div>
<div class="listBar">
	<ul><c:forEach items="${product }" var="vo">
		<li><a class="productName">${vo.p_name }</a></li>
		</c:forEach>
	</ul>
</div>
<c:forEach items="${product }" var="vo">
<div class="productBox">
	<div class="productOverZone">
		<div class="productMainImage">
			<c:if test="${!empty vo.p_defaultimage_path}">
			<img src="<c:url value='/' />${vo.p_defaultimage_path}" class="defaultImage"/>
			</c:if>
			<c:if test="${empty vo.p_defaultimage_path}">
			<img alt="상품준비중" src="img/product_noimage.png" class="noImage"/>
			</c:if>
		</div>
		<div class="productInfo">
			<ul>
				<li style="font-weight: bold;"><p>${vo.p_name }</p></li>
				<li><hr></li>
				<li style="text-align: right; padding-right: 10px; "><p><i class="fas fa-won-sign"></i><fmt:formatNumber value="${vo.p_price }" pattern="#,###"/></p></li>
			</ul>
		</div>
	</div>
	<div class="productUnderZone">
		<p class="subTitleName">상세정보</p>
		<hr/>
		<div class="productDetailImage">
		<c:if test="${!empty vo.p_detailimage_path}">
			<img src="<c:url value='/' />${vo.p_detailimage_path}" class="detailImage"/>
			</c:if>
			<c:if test="${empty vo.p_detailimage_path}">
			<img alt="상품준비중" src="img/product_noimage.png" class="noImage"/>
			</c:if>
		</div>
	</div>
</div>
</c:forEach>
<div id="btnGoPage">
	<a class="goPage" href="order"><i class="fas fa-shopping-cart"></i> 주문서작성 바로가기</a>
	<a class="goPage" href="reviewBoard"><i class="fas fa-umbrella"></i> 사용후기 바로가기</a>
</div>
<script type="text/javascript">
$(function(){
	$('.productName:eq(0)').addClass('clicked');
	$('.productBox:not(:eq(0))').hide();
});

$(document).on('click', '.productName', function(){
	var index = $('.productName').index(this);
//	alert(index);
	
  	$('.productName:eq('+index+')').addClass('clicked');
  	$('.productName:not(:eq('+index+'))').removeClass('clicked');
  	$('.productBox:eq('+index+')').show();
  	$('.productBox:not(:eq('+index+'))').hide();
});
</script>
</body>
</html>