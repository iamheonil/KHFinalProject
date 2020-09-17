<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>

<style type="text/css">
.menu-item#lessonM ul {
   height: 93px;  
}

#writeLessonM{
  background: #eee;
}


.border{
	border: 1px solid #ccc;
	text-align: center;
	padding: 40px;
}
.glyphicon i{
    font-size: 40px;
}
.caution p{
	font-size: 20px;
	display: inline-block;
}
div.button{
   margin: auto;
   width: 50%;
}
div.button input{
   padding: 5px;
   width: 100%;
   font-size: 18px;
}
#title{
	width: 100%;
	font-weight: bold;
}
#title a {
	color: #17B794; /* 청록색 */
}
</style>

<div id="title">과외
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">과외 등록</a>
</div>
<br>
<div class="border">
<h2 style="font-weight: bolder !important">과외 등록 시 주의사항</h2><br>
	<div class="caution">
<!-- 		<span class="glyphicon glyphicon-check btn-lg"></span> <p>작성 후 관리자의 검토를 받아야 합니다.</p><br><br> -->
		<span class="glyphicon glyphicon-check btn-lg"></span> <p>관리자 승인 후 등록하실 수 있습니다.</p><br><br>
		<span class="glyphicon glyphicon-check btn-lg"></span> <p>과외 등록 시 1000원의 수수료가 부과됩니다.</p><br><br>
		<span class="glyphicon glyphicon-check btn-lg"></span> <p>허위 사실 작성 시 법적 처벌을 받을 수 있습니다.</p><br><br>
	</div>
	<br>
	<div class="button"> 
    	<input type="button" value="과외 등록하러 가기" onclick="location.href='writelesson'"/><br/>
	</div>
</div>

<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>