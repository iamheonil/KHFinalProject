<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!-- 관리자 페이지 header -->   
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>

<style type="text/css">
.captionstyle{
	text-align: center;
	caption-side: top;
	font-weight: bold;
	font-size: large;
}

</style>

    <div id="title">게시판
    	<i class="fas fa-angle-right"></i>
    	<a href="<%=request.getContextPath()  %>/admin/notice/list">공지사항 </a>
   	</div>

 <div id="content">
 
	<!-- 공지사항 리스트 -->
	<table class="table table-striped table-hover table-condensed textcenter" >
	<caption  class="captionstyle">공지사항</caption>
	
	<!-- 테이블 th -->
	<tr style="background: #17B794;" >
		<th style="width: 10%">번호</th>
		<th style="width: 30%">제목</th>
		<th style="width: 50%">내용</th>
		<th style="width: 10%">날짜</th>
	</tr>
	
	<!-- 공지사항이 없을 때  -->
	<c:if  var="noticernone" test="${empty noticeList }">
	<tr>
	<td colspan="8" style="color:  #17B794; font-weight: bold;">공지사항이  없습니다</td>
	</tr>
	</c:if>
	
	<!--공지사항이 있을 때 -->
	<c:if  var="noticeok" test="${!empty noticeList }">
	<!-- 값 출력 -->
	<c:forEach items="${noticeList }" var="notice" >
	<tr>
		<td>${notice.noticeNo }</td>
		<td>${notice.noticeTitle }</td>
		<td>${notice.noticeContent }</td>
		<td>${notice.noticeDate }</td>
<%-- 		<td><fmt:formatDate value="${notice.noticeDate }" pattern="yyyy-MM-dd"/></td> --%>
	</tr>
	</c:forEach>
	</table>
	
	<!-- 페이징 -->
<%-- 	<c:import url="/WEB-INF/layout/paging/admin/noticeListpaging.jsp"></c:import> --%>
	</c:if>
	
</div>                
                
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  