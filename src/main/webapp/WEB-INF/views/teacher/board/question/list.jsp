<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>
<style type="text/css">
.menu-item#community ul {
   height: 93px; 
}

#questionM{
  background: #eee;
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
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="${pageContext.request.contextPath}/teacher/question/list">질문 게시판</a>
</div>



 <div id="content"> 
 
 
	<!-- 제목 검색 -->
	<div id="serchbox" >
		<form action="${pageContext.request.contextPath}/teacher/question/search" method="post">
			<div class="row">
				<div class="col-lg-6">
					<div class="input-group">
<%-- 					<input type="hidden" value="${no}" id="no" name="no"/> --%>
						<input type="text" class="form-control" placeholder="제목 검색" style="width: 180px;" name="keyword">
<!-- 						<span class="input-group-btn"> -->
							<button class="button button1" type="submit">검색</button>
<!-- 						</span> -->
					</div>
				</div>
			</div>
		</form>
	</div>
	
	
	<input type="hidden" value="${cno}"id="no" />
 
 	<!-- 체크박스 리스트 전송 -->
 	<form action="${pageContext.request.contextPath}/teacher/question/idxdelete" method="post" id="checkboxlist">
 	
 	
		<!-- 질문게시판 리스트 -->
		<table class="table table-hover textcenter" >

		
		<tr>
		    <th style="width: 5%"><input type="checkbox" name="th_checkAll" id="th_checkAll" onclick="checkAll();"/></th>
			<th style="width: 15%">작성한 글번호</th>
			<th style="width: 25%">제목</th>
			<th style="width: 45%">내용</th>
			<th style="width: 15%">작성일</th>
		</tr>
		<!-- 게시글이 없을 때  -->
		<c:if test="${empty questionList }" >
			<input type="hidden" value="${cno}"id="no" />
			
			<tr>
				<td colspan="8" style="color: #17B794; font-weight: bold;">게시글이  없습니다</td>
			</tr>
		
		</c:if>
		<!--게시글이 있을 때 -->
		<c:if test="${!empty questionList }" >
		
		
			<!-- 값 출력 -->
			<c:forEach items="${questionList }" var="questionList">
			<c:if test="${loginUser.userNo eq questionList.userNo }">
		 		<input type="hidden" value="${questionList.questionNo}" name="no" id="no" />
		 		
			<tr>
			    <td><input type="checkbox" name="checkRow" value="${questionList.questionNo}" id="checkRow"/></td>
				<td>${questionList.questionNo}</td>
				<td>
					<a href="${pageContext.request.contextPath}/teacher/question/detail?questionNo=${questionList.questionNo}">${questionList.questionTitle }
					</a>
				</td>
				<td>${questionList.questionContent }</td>
				<td>${questionList.questionDate }</td>
			</tr>
			
			</c:if>
			</c:forEach>
	</c:if>
		</table>
		
		
	</form>
	
		<!-- 페이징 -->
		<div class="pagingstyle">
			<c:import url="/WEB-INF/paging/teacher/board/teacherlistPaging.jsp"></c:import>
		</div>
	
	
	
	
	<!-- 글작성/삭제 버튼 -->
	<div id="footerbtn">
		<div id="divbtn">
		<!-- 수정부분은 유저페이지로 이동시켜야함 -->
			<button type="button" class="button button3" id="deletebtn">삭제</button>
		</div> 
	</div>
	
 
	
	
</div><!--end content -->

<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>