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

#writebtn{
/* 	color: #17B794; */
}

#deletebtn{
/* 	color: red; */
}

 #divbtn{ 
    padding: 10px; 
} 

.pagingstyle{
 	width: 100%; 
 	padding-left: 40%;
}

#footerbtn{
    position: absolute;
    right: 1.5%;
    top: 18%;
}

#listbtn{
	color: black;
}

#serchbox{
	width: 500px;
}

.anone{
	text-decoration: none;
	color: black;
}

.anone:hover{
	text-decoration: none;
	color: black;
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

 
	 <div class="clearfix"></div>
 
	<!-- 공지사항 리스트 -->
	<table class="table table-striped table-hover table-condensed textcenter" >
	<caption  class="captionstyle">질문게시판</caption>  
	
	<!-- 테이블 th -->
	<tr>
		<th style="width: 10%">번호</th>
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
	<tr>
		<th colspan="3">댓글</th>
	</tr>	
	<tr>
		<c:forEach var="commList" items="${commList}" varStatus="status">
                    <tr reply_type="<c:if test="${commList.commClass == '0'}">main</c:if><c:if test="${commList.commClass == '1'}">sub</c:if>"><!-- 댓글의 commClass =0이면 부모댓글 -->
                        <td width="820px">
                            <c:if test="${commList.commClass == '1'}"> → </c:if>${commList.commContent}<!--자식 댓글 : →붙임 -->
                        </td>
                       	
                        <td align="center">
<%--                             <c:if test="${commList.comm_Class != '1'}"> --%>
<%--                                 <button name="reply_reply" parent_id = "${replyList.reply_id}" reply_id = "${replyList.reply_id}">댓글</button><!-- 첫 댓글에만 댓글이 추가 대댓글 불가 --> --%>
<%--                             </c:if> --%>
<%--                             <button name="reply_modify" parent_id = "${replyList.parent_id}" r_type = "<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>" reply_id = "${replyList.reply_id}">수정</button> --%>
                            <a href="${pageContext.request.contextPath}/admin/question/deleteComm?questionNo=${commList.questionNo }"><button name="reply_del" r_type = "<c:if test="${commList.commClass == '0'}">main</c:if><c:if test="${commList.commClass == '1'}">sub</c:if>" comm_No = "${commList.commNo}">-</button></a>
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