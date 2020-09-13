<!-- 20200819 이인주 -->
<!-- notice list paging -->

<!-- 페이징 복붙 예시  -->
<!-- 1. 본인에게 맞는 url 작성 -->
<!-- 2. url에 쿼리스트링이 들어가야하는 경우 맞게 작성 필요 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="pt-3">
    <ul class="pagination justify-content-end mb-0">
   
	    <!-- 이전 페이지로 가기 -->
	   <c:if test="${paging2.curPage ne 1 }">
	   <li><a href="javascript:void(0);" onclick="marketCommPaging(${paging2.curPage - 1 });">&lt;</a></li>
	   </c:if>
	   <c:if test="${paging2.curPage eq 1 }">
	   <li><a href="javascript:void(0);">&lt;</a></li>
	   </c:if>
	   
   		<c:forEach begin="${paging2.startPage }" end="${paging2.endPage }" var="i">
   
	   <!-- 현재 페이지라면 강조(.active) -->
	   <c:if test="${paging2.curPage eq i }">
	   <li class="active"><a href="javascript:void(0);" onclick="marketCommPaging(${i });">${i }</a></li>
	   </c:if>
	   
	   <!-- 현재 페이지가 아니라면 평소 모습-->
	   <c:if test="${paging2.curPage ne i }">
	   <li><a href="javascript:void(0);" onclick="marketCommPaging(${i });">${i }</a></li>
	   </c:if>

   		</c:forEach>
   		
          <!-- 다음 페이지로 가기 -->
	  <c:if test="${paging2.curPage ne paging2.totalPage}">
	  <li><a href="javascript:void(0);" onclick="marketCommPaging(${paging2.curPage + 1 });">&gt;</a>
	  </c:if>
	   <c:if test="${paging2.curPage eq paging2.totalPage }">
	   <li><a href="javascript:void(0);">&gt;</a></li>
	   </c:if>

    </ul>
</div>

