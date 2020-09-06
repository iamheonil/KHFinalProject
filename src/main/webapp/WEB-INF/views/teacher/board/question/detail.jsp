<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>
<!-- 현위지 메뉴 -->
<style type="text/css">

#title{
	width: 100%;
	font-weight: bold;
}

#title a:hover { color: #777777; }

/* 최상위 메뉴만 청록색 */
#title a:last-child { color: #17B794; }

</style>


<style type="text/css">

.table { margin-top: 30px; }

.table th, td { 
	text-align: center; 
}

#info { 
	width: 25%; 
	background: #f3f3f3;
	vertical-align: middle;
}

#info2 { width: 25%; }

#info3 { 
	height: 250px; 
	overflow: scroll;
}

#info4 { text-align: left; }

#info4 p { 
	font-size: 16px; 
	color: #777777;
}

#info4 i { color: #777777; }

#fileBtn {
	margin-left:1%;
	background: none;
	border: none;
}

#fileBtn:hover {
	text-decoration: underline;
	color: #777777;
}


</style>

<style type="text/css">

#footerbtn { float: right; }
	
.button2 { /* 삭제버튼 */
	background-color: #17B794; 
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	padding: 4px;
	border-radius: 3px;
	cursor: pointer;
	width: 65px;
}

.button3 { /* 목록버튼 */
	background-color: #474747; 
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	padding: 4px;
	border-radius: 3px;
	cursor: pointer;
	width: 65px;
}

</style>


<script type="text/javascript">

$(document).ready(function(){
	
	//삭제버튼 동작
	$("#deletebtn").click(function(){
		
		location.href="<%=request.getContextPath()  %>/teacher/question/list"
	});
	
});
</script>



<div id="title">게시판
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="${pageContext.request.contextPath}/teacher/question/list">질문게시판</a>
	<i class="glyphicon glyphicon-menu-right"></i>
	<a>상세보기</a>
</div>



<div id="content"> 
 
 
 	<table class="table">
	
		<tr>
			<th id="info">글번호</th>
	        <td id="info2">${questionone.questionNo}</td>
	        <th id="info">작성일</th>
	        <td id="info2"> ${questionone.questionDate}</td>
	    </tr>
		
	    <tr>
	        <th id="info">제목</th>
	        <td id="info4" colspan="4">${questionone.questionTitle }</td>
		</tr>
		
		<tr id="info3">
			<th id="info">본문</th>
			<td id="info4" colspan="4">${questionone.questionContent }</td>
		</tr>
		
		
		
	</table>
 
 
 <!-- 댓글 테이블 -->	
<table class="commTable" >
	<tr>
		<th colspan="3" style="background: #ddd;" >댓글</th>
	</tr>
	<tr>
		<c:forEach var="commList" items="${commList}" varStatus="status">
                    <tr  reply_type="<c:if test="${commList.commClass == '0'}">main</c:if><c:if test="${commList.commClass == '1'}">sub</c:if>"><!-- 댓글의 commClass =0이면 부모댓글 -->
                        <td width="230px">
                            <c:if test="${commList.commClass == '1'}"> → </c:if>${commList.commContent}<!--자식 댓글 : →붙임 -->
                        </td>
                       	
                        <td  >
                            <a href="${pageContext.request.contextPath}/teacher/question/deleteComm?questionNo=${commList.questionNo }"><button class="minusbtn" name="reply_del" r_type = "<c:if test="${commList.commClass == '0'}">main</c:if><c:if test="${commList.commClass == '1'}">sub</c:if>" comm_No = "${commList.commNo}">-</button></a>
                        </td>
                    </tr>
                </c:forEach>
	</tr>
</table>		
 
 
 
 
 
 
 
 
	<!-- 목록/삭제 버튼 -->
	<div id="footerbtn">
		<div id="divbtn">
			<button type="button" class="button button3" id="writebtn">목록</button>
				<a href="${pageContext.request.contextPath}/teacher/question/delete?questionNo=${questionone.questionNo }" class="anone"> <button type="button" class="button2" id="deletebtn">삭제</button></a>
		</div> 
	</div>
	
	
</div><!--end content -->


<script type="text/javascript">
$(document).ready(function(){
	
	//목록 버튼 동작
	$("#writebtn").click(function(){
		history.go(-1);
	});
	
})
</script>





<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>