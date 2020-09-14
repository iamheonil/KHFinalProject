<!-- 이서연 200827 -->
<!-- 선생님페이지 > 과외 연결 > 자료실 (글목록) -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 학생 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/student/stuHeader.jsp"></c:import>



<!-- 현위지 메뉴 -->
<style type="text/css">
.menu-item#four ul {
   height: 124px; 
}

#connectedlessonM{
  background: #eee;
}
#title{
	width: 100%;
	font-weight: bold;
}

#title a:hover { color: #777777; }

/* 최상위 메뉴만 청록색 */
#title a:last-child { color: #17B794; }

</style>


<style type="text/css">

.pagingstyle{
 	width: 50%; 
 	margin: 0 auto;
}

#footerbtn{
	float: right;
}

#serchbox{
    float: right;
    width: 270px;
    margin: 0 auto;
    padding: 20px;
}

.form-control { margin: 0 5px; }

.table th, td { 
	color: #262626;
	text-align: center; 
}

td a:hover{
	text-decoration: none;
	color: #262626;
}

.table th { background: #f3f3f3; }

</style>

<!-- 버튼 -->
<style type="text/css">

.button1 { /* 검색버튼 */
	background-color: #eee; 
	color: #666;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	padding: 4px;
	border: 1px solid #aaa;
	border-radius: 3px;
	cursor: pointer;
	width: 60px
}
.button1:hover { /* 검색버튼 */
	background-color: #dfdfdf; 
	
}
.button2 { /* 글작성버튼 */
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

.button3 { /* 삭제버튼 */
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

#selectCombo {
	float: left;
	width: 270px;
	margin: 0 auto;
	padding: 20px;
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
	
	//작성버튼 동작
	$("#writebtn").click(function(){
		
		var no = document.getElementById("no").value
		
// 		console.log(no)
		
		$(location).attr("href", "${pageContext.request.contextPath}/teacher/webshare/write?no="+no);
	
	});
	
	
});

function changelesson(lessonNo){
	console.log(lessonNo)
	var url="${pageContext.request.contextPath}/student/webshare?no="+lessonNo
	location.href=url;
}
</script>



<div id="title">
	과외 <i class="glyphicon glyphicon-menu-right"></i> <a href="${pageContext.request.contextPath}/student/connectedlesson">수강 중인 과외</a>
	<i class="glyphicon glyphicon-menu-right"></i> <a href="">자료실</a>
</div>



 <div id="content"> 
 
 	<div id="selectCombo">

		<!-- 자료실 이동  -->
		<div class="row">
			<div class="">
				<select class="form-control" id="lessonList"
					onchange="changelesson(this.value);">
					<c:forEach items="${connectedLessonList }" var="lesson">
						<c:choose>
							<c:when test="${lesson.CONN_LESSON_NO  eq no}">
								<option selected="selected" value="${lesson.CONN_LESSON_NO}">${lesson.LESSON_TITLE}</option>
							</c:when>
							<c:otherwise>
								<option value="${lesson.CONN_LESSON_NO}">${lesson.LESSON_TITLE}</option>
							</c:otherwise>
						</c:choose>

					</c:forEach>

				</select>
			</div>
		</div>

	</div>
 
 
	<!-- 제목 검색 -->
	<div id="serchbox" >
		<form action="${pageContext.request.contextPath}/teacher/webshare/search" method="post">
			<div class="row">
				<div class="col-lg-6">
					<div class="input-group">
						<input type="hidden" value="${no}" id="no" name="no"/>
						<input type="text" class="form-control" placeholder="제목 검색" style="width: 180px;" name="keyword">
						<span class="input-group-btn">
							<button class="button button1" type="submit">검색</button>
						</span>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	
	<input type="hidden" value="${no}" id="no" name="no"/>
 
 	<!-- 체크박스 리스트 전송 -->
 	<form action="${pageContext.request.contextPath}/teacher/webshare/delete" method="post" id="checkboxlist">
 	
 	
		<!-- 자료실 리스트 -->
		<table class="table table-hover textcenter" >

		
		<tr>
		    
			<th style="width: 10%">글번호</th>
			<th style="width: 45%">제목</th>
			<th style="width: 20%">작성자</th>
			<th style="width: 20%">작성일</th>
		</tr>
		
		<!-- 게시글이 없을 때  -->
		<c:if test="${empty webShareSearchList }" >
		
			<input type="hidden" value="${no}" id="no" name="no" />
			
			<tr>
				<td colspan="8" style="color: #17B794; font-weight: bold;">검색 결과가  없습니다</td>
			</tr>
		</table>
		
		</c:if>
		
		<!--게시글이 있을 때 -->
		<c:if test="${!empty webShareSearchList }" >
		
		
			<!-- 값 출력 -->
			<c:forEach items="${webShareSearchList }" var="wlist">
			
		 		<input type="hidden" value="${wlist.CONN_LESSON_NO}" name="no" id="no" />
		 		
			<tr>
			   
				<td>${wlist.SHARE_NO }</td>
				<td>
					<a href="${pageContext.request.contextPath}/student/webshare/detail?no=${wlist.SHARE_NO}">
						${wlist.SHARE_TITLE }
					</a>
				</td>
				<td>${wlist.USER_ID }</td>
				
				<td>
				<fmt:parseDate value="${wlist.SHARE_DATE }" var="parseShareDate" pattern="yy/MM/dd"/>
				<fmt:formatDate value="${parseShareDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			</c:forEach>
		</table>
		
		
	</form>
	
		<!-- 페이징 -->
		<div class="pagingstyle">
			<c:import url="/WEB-INF/paging/student/webShare/webShareSearchListPaging.jsp"></c:import>
		</div>
	
	</c:if>
	
	
	

	
 
	
	
</div><!--end content -->




<!-- 학생 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/student/stuFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuFooter2.jsp"></c:import>

