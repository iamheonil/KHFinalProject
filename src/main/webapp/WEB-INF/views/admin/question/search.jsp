<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

#serchbox{
	width: 500px;
/* 	margin:0 ; */
/* 	padding: 0; */
    position: absolute;
    top: 18%;
    right: -4.5%;
}

.anone{
	text-decoration: none;
	color: black;
}

.anone:hover{
	text-decoration: none;
	color: black;
}

.txt_line_content { 
	width:600px; 
	padding:0 5px; 
	overflow:hidden; 
	text-overflow:ellipsis;
	white-space:nowrap;  
}

.txt_line_title { 
	width:200px; 
	padding:0 5px; 
	overflow:hidden; 
	text-overflow:ellipsis;
	white-space:nowrap; 
}

</style>

<script type="text/javascript">
/* 체크박스 전체선택, 전체해제 */
function checkAll(){
      if( $("#th_checkAll").is(':checked') ){
        $("input[name=checkRow]").prop("checked", true);
      }else{
        $("input[name=checkRow]").prop("checked", false);
      }
}
</script> 

<script type="text/javascript">
$(document).ready(function(){
	
	//삭제버튼 동작
	$("#deletebtn").click(function(){
		
		//실제 <form>의 submit 수행
		$("#checkboxlist").submit();
		
	});
	
});
</script>

    <div id="title">게시판
    	<i class="fas fa-angle-right"></i>
    	<a href="<%=request.getContextPath()  %>/admin/question/list">질문게시판 </a>
   	</div>

 <div id="content"> 
 
 	<!-- 제목 검색 -->
	<div id="serchbox" >
	<form action="${pageContext.request.contextPath}/admin/question/search" method="post">
	
	<div class="row">
	  <div class="col-lg-6">
	    <div class="input-group">
	      <input type="text" class="form-control" placeholder="제목 검색" style="width: 180px;" name="keyword">
	      <span class="input-group-btn">
	        <button class="btn btn-default" type="submit">Search</button>
	      </span>
	    </div><!-- /input-group -->
	  </div><!-- /.col-lg-6 -->
	</div><!-- /.row -->

	</form>
	</div>
	
	<!--  삭제 버튼 -->
	<div id="footerbtn">
	
	<div id="divbtn">
		<button type="button" class="btn btn-default" id="deletebtn">삭제</button>
	</div> 
	</div>
 
 	<!-- 체크박스 리스트 전송 -->
 	<form action="${pageContext.request.contextPath}/admin/question/idxdelete" method="post" id="checkboxlist">
 	
	<!--질문게시판 리스트 -->
	<table class="table table-striped table-hover table-condensed textcenter" >
	
	<c:if test="${not empty keyword}">
	<caption  class="captionstyle">질문게시판</caption>  
	<caption  class="captionstyle">검색어 >> ${keyword }</caption>  
	</c:if>
	
	<!-- 테이블 th -->
	<tr>
	    <th style="width: 5%"><input type="checkbox" name="th_checkAll" id="th_checkAll" onclick="checkAll();"/></th>
		<th style="width: 5%">번호</th>
		<th style="width: 20%">제목</th>
		<th style="width: 50%">내용</th>
		<th style="width: 10%">날짜</th>
	</tr>
	
	<!-- 검색 결과가 없을 때  -->
	<c:if  var="questionone" test="${empty questionSearchList }">
	<tr>
	<td colspan="8" style="font-weight: bold;">검색 결과가  없습니다</td>
	</tr>
	</c:if>
	
	<!-- 값 출력 -->
	<c:forEach items="${questionSearchList }" var="question" >
	<tr>
	    <td><input type="checkbox" name="checkRow" value="${question.questionNo}" id="checkRow"/></td>
		<td>${question.questionNo }</td>
		<td>
			<div class="txt_line_title">
				<a href="${pageContext.request.contextPath}/board/question/detail?questionNo=${question.questionNo}" class="anone">${question.questionTitle }</a>
			</div>
		</td>
		<td><div class="txt_line_content">${question.questionContent }</div></td>
		<td>${question.questionDate }</td>
	</tr>
	</c:forEach>
	</table>
	</form>
	
	<!-- 페이징 -->
	<div class="pagingstyle">
	<c:import url="/WEB-INF/paging/admin/question/questionSearchPaging.jsp"></c:import>
	</div>
	
</div>  

     
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  