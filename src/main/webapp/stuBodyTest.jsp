<!-- 이인주 20200818 : 학생 마이페이지 body test  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 학생 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/student/stuHeader.jsp"></c:import>


<style type="text/css">
#main {
	display: inline-block;
	float: right;
	width: 960px;
	padding: 0 20px;
}

#boardtitle {
    font-size: 16px;
    font-weight: bold;
}
</style>

<div id="main">
	<span id="boardtitle">제목</span>
	<hr>
	
	
	
	
	

</div>


<h6>내용</h6>


<!-- 학생 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/student/stuFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuFooter2.jsp"></c:import>
