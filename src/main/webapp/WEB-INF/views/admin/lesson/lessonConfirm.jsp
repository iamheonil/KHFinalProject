<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 페이지 header -->   
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>

            
            
            
	<div id="title">과외 
		<i class="fas fa-angle-right"></i>
		<a href="">과외 검토</a>
	</div>
	
	
	
	<main>
	    <div id="content">
	    
			<table class="table table-striped table-hover table-condensed textcenter" >
			
				
				<!-- 테이블 th -->
				<tr style="background: #17B794;" >
					<th style="width: 10%">번호</th>
					<th style="width: 40%">제목</th>
					<th style="width: 20%">작성자</th>
					<th style="width: 20%">작성일</th>
					<th style="width: 10%">검토</th>
				</tr>
				
				<!-- 공지사항이 없을 때  -->
<%-- 				<c:if  var="noticernone" test="${empty noticeList }"> --%>
<!-- 					<tr> -->
<!-- 						<td colspan="8" style="color:  #17B794; font-weight: bold;">검토할 과외가 없습니다</td> -->
<!-- 					</tr> -->
<%-- 				</c:if> --%>
				
				<!--공지사항이 있을 때 -->
<%-- 				<c:if var="noticeok" test="${!empty noticeList }"> --%>
				
					<!-- 값 출력 -->
<%-- 					<c:forEach items="${noticeList }" var="notice" > --%>
					<tr>
<%-- 					    <td><input type="checkbox" name="checkRow" value="${notice.noticeNo}" /></td> --%>
						<td>ㄱㄱㄱ</td>
						<td><a href="">ㄴㄴㄴ</a></td>
						<td>ㄷㄷㄷ</td>
						<td>ㄹㄹㄹ</td>
					    <td><input type="button" name="confirm" value="검토"/></td>
					</tr>
<%-- 					</c:forEach> --%>
<%-- 				</c:if> --%>
				
			</table>
					
	       	
	    </div>
	    
	</main>
       
       
       
       
       
                
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  