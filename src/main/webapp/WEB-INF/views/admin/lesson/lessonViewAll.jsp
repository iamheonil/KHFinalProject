<!-- 200819 이서연 -->
<!-- /admin/lesson/view -->
<!-- 관리자 페이지 > 과외 > 과외 조회 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 페이지 header -->   
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>


	<div id="title">과외 
		<i class="fas fa-angle-right"></i>
		<a href="">과외 조회</a>
	</div>
	
	
	<main>
	    <div id="content">
	    
			<table class="table table-hover table-condensed textcenter" >
			
				
				<!-- 테이블 th -->
				<tr style="background: #17B794;" >
					<th style="width: 10%">번호</th>
					<th style="width: 40%">과외명</th>
					<th style="width: 20%">작성자</th>
					<th style="width: 20%">작성일</th>
				</tr>
				
				<!-- 과외가 없을 때  -->
				<c:if test="${empty lessonList }">
					과외가 없습니다
				</c:if>
				
				<!--과외가 있을 때 -->
				<c:if test="${!empty noticeList }">
				
					<!-- 값 출력 -->
					<c:forEach items="${lessonList }" var="lessonList" >
						<tr>
							<td>${lessonList.LESSON_NO}</td>
							<td><a href="">${lessonList.LESSON_TITLE}</a></td> <!-- 추후추가 : 과외페이지로 연결 -->
							<td>${lessonList.USER_ID}</td>
							<td>${lessonList.LESSON_DATE}</td>
						</tr>
					</c:forEach>
					
				</c:if>
				
			</table>
			
			
			<c:import url="/WEB-INF/paging/admin/lessonViewPaging.jsp"/>
					
	       	
	    </div>
	</main>
       
       
       
       
       
                
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  