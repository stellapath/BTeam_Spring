<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<link rel="stylesheet" href="css/qnaForm.css">
</head>
<body>
<div id="wrap">
   <h3>자주하는 질문</h3>
   <form action="qnaBoard" method="post">
   <input type="hidden" name="curPage" value='1'/>
   <div class="btnSet">
      <c:if test="${login_info.user_email eq 'admin'}">
      <a class="btn_fill" href="qnaWrite">글작성</a>
      </c:if>
   </div>
   </form>
   <div align="center">
   <table>
      <tr><th class="w-px60">번호</th>
         <th class="w-px100">구분</th>
         <th>질문</th>
         <th class="w-px100">작성자</th>
         <th class="w-px100">등록일</th>
         <th class="w-px200">이메일</th>
      </tr>
      <c:forEach items="${page.list}" var="qvo">
      <tr class="subject">
         <td>${qvo.qna_no}</td>
         <td>${qvo.qna_category}</td>
         <td class="left">
            <a class="question">${qvo.qna_question}</a>
         </td>
         <td>${qvo.qna_nickname}</td>
         <td>${qvo.qna_writedate}</td>
         <td>${qvo.qna_email}</td>
      </tr>
      <tr class="contents" style="display: none;">
         <td colspan="6">
            <div class="answers">
               <p>A/S 접수(1577-5670) 및 사이트 A/S 접수 후 하자를 파악하여 2~4일 이내에 자재 또는 부품을 가지고 A/S기사가 방문해 드리고 있습니다.</p> 
               <p>자재수급기간이 오래 걸리는것은 지연될 수 있사오니 양해해 주십시오. 유상의 경우에는 먼저 조치금액을 안내 해 드리고 있습니다.</p>
               <p>또한 성수기인 1월-3월 사이에는 업무 과부하로 시일이 조금 더 소요될수 있으니 이점 양해바랍니다.</p>
            </div>
         </td>
      </tr>
      </c:forEach>
   </table><br/>
   
   <div class="btnSet">
   <jsp:include page="/WEB-INF/views/include/page.jsp"/>
   </div>
   </div>
</div>

<div id="myContent">
<a href="">나의 문의내역</a>
<a href="qnaWrite">일대일 문의하기</a>
</div>
<script type="text/javascript">
$('.question').click(function(){
   $(this).parents('tr').next('.contents').toggle();
});

</script>
</body>
</html>