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

#footerbtn{
    position: absolute;
    right: 1.5%;
    top: 18%;
}

#listbtn{
	color: black;
}
.anone{
	text-decoration: none;
	color: black;
}
.anone:hover{
	text-decoration: none;
	color: black;
}

#detailTable{
padding: 25px;
}



</style>

<script type="text/javascript">

$(document).ready(function(){
	
	//삭제버튼 동작
	$("#deletebtn").click(function(){
		
		location.href="<%=request.getContextPath()  %>/admin/question/list"
	});
	
});


</script>

<div id="title">게시판
    	<i class="fas fa-angle-right"></i>
    	<a href="<%=request.getContextPath()  %>/admin/question/list">질문게시판 </a>
   	</div>

 
 
	<!--  리스트 -->
	<table class="table table-striped table-hover table-condensed textcenter" id="detailTable">
	<caption  class="captionstyle">질문게시판</caption>  
	
	<!-- 테이블 th -->
	<tr>
		<th style="width: 10%; ">번호</th>
		<th style="width: 50%">제목</th>
		<th style="width: 20%">날짜</th>
	</tr>
	<tr>
		<td>${questionone.questionNo }</td>
		<td>${questionone.questionTitle }</td>
		<td>${questionone.questionDate }</td>
	</tr>
	
	<tr>
		<th colspan="3">내용</th>
	</tr>
	<tr>
		<td colspan="3">${questionone.questionContent }</td>
	</tr>

	
	</table>
	
<!-- 댓글 테이블 -->	
<table class="table-condensed" >
	<tr>
		<th colspan="3" style="background: #ddd;width:400px;" >댓글</th>
	</tr>
	<tr>
		<c:forEach var="commList" items="${commList}" varStatus="status">
                    <tr  reply_type="<c:if test="${commList.commClass == '0'}">main</c:if><c:if test="${commList.commClass == '1'}">sub</c:if>"><!-- 댓글의 commClass =0이면 부모댓글 -->
                        <td>
                            <c:if test="${commList.commClass == '1'}"> → </c:if>${commList.commContent}<!--자식 댓글 : →붙임 -->
                        </td>
                       	
                        <td  >
                            <a href="${pageContext.request.contextPath}/admin/question/deleteComm?commNo=${commList.commNo }"><button class="btn btn-danger" name="reply_del" r_type = "<c:if test="${commList.commClass == '0'}">main</c:if><c:if test="${commList.commClass == '1'}">sub</c:if>" comm_No = "${commList.commNo}">-</button></a>
                        </td>
                    </tr>
                </c:forEach>
	</tr>
</table>		
	
	
 
	
	<!-- 목록  삭제 버튼 -->
	<div id="divbtn">
		<a href="${pageContext.request.contextPath}/admin/question/list" class="anone"><button type="button" class="btn btn-default" id="listbtn">목록</button></a>
		<a href="${pageContext.request.contextPath}/admin/question/delete?questionNo=${questionone.questionNo }" class="anone"> <button type="button" class="btn btn-default" id="deletebtn">삭제</button></a>
	</div> 
	
     
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>