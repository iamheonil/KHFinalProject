<!-- 이서연 200830 -->
<!-- 선생님페이지 > 과외 연결 > 자료실 (글보기) -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 선생님 마이페이지 헤더 -->
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



<div id="title">과외 연결
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="${pageContext.request.contextPath}/teacher/connectedlesson">연결된 과외</a>
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="javascript:history.back()">자료실</a>
</div>



<div id="content"> 
 
 
 	<table class="table">
	
		<tr>
			<th id="info">글번호</th>
	        <td id="info2">${webShareDetail.webshare.shareNo }</td>
	        <th id="info">작성일</th>
	        <td id="info2"><fmt:formatDate value="${webShareDetail.webshare.shareDate }" pattern="yyyy-MM-dd"/></td>
	    </tr>
		
	    <tr>
	        <th id="info">제목</th>
	        <td id="info4" colspan="4">${webShareDetail.webshare.shareTitle }</td>
		</tr>
		
		<tr id="info3">
			<th id="info">본문</th>
			<td id="info4" colspan="4">${webShareDetail.webshare.shareContent }</td>
		</tr>
		
		<tr style="height: auto;">
			<th id="info">첨부파일</th>
			<td id="info4" colspan="4">
				<c:forEach items="${webShareDetail.flist}" var="file">
					<button id ="fileBtn" type="button" onclick="downloadFile('${file.shareFileOrg}','${file.shareFileRename}')">
						${file.shareFileOrg}&nbsp;<i class="glyphicon glyphicon-save"></i>
					</button>
				</c:forEach>
			</td>
	    </tr>
		
	</table>
 
	<!-- 목록/삭제 버튼 -->
	<div id="footerbtn">
		<div id="divbtn">
			<button type="button" class="button button3" id="writebtn">목록</button>
			<button type="button" class="button button2" id="deletebtn" 
				onclick="deleteOne(${webShareDetail.webshare.shareNo }, ${webShareDetail.webshare.connLessonNo })">삭제</button>
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


<script type="text/javascript">
   
   //다운로드
	function downloadFile(ofname, rfname){
	     location.href = "${pageContext.request.contextPath}/teacher/webshare/download?"
	          +"ofname="+ofname
	          +"&rfname="+rfname
	}
   
   //글삭제
   function deleteOne(shareNo, connLessonNo){
	   
	   var sno = shareNo;
	   var cno = connLessonNo;
	   
// 	   console.log(sno);
// 	   console.log(cno);
	   
	   location.href = "${pageContext.request.contextPath}/teacher/webshare/deleteone?"
	          +"sno="+sno
	          +"&cno="+cno
   }

</script>

<!-- 선생님 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>
