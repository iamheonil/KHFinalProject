<!-- 이인주 20200818 : 학생 마이페이지 body test  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 학생 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/student/stuHeader.jsp"></c:import>

<!-- 기본 css -->
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

<!-- list css -->
<style type="text/css">
.captionstyle{
	text-align: center;
	caption-side: top;
	font-weight: bold;
	font-size: large;
}

 #divbtn{ 
    padding: 10px; 
} 

.pagingstyle{
 	width: 100%; 
 	padding-left: 15%;
}

#footerbtn{
    position: absolute;
    right: 1.5%;
    top: 28.3%;
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

.txt_line_content { 
	width:300px; 
	padding:0 5px; 
	overflow:hidden; 
	text-overflow:ellipsis;
	white-space:nowrap;  
}

.txt_line_title { 
	width:150px; 
	padding:0 5px; 
	overflow:hidden; 
	text-overflow:ellipsis;
	white-space:nowrap; 
}
</style>
 

<script type="text/javascript">
$(document).ready(function(){
	
	//삭제버튼 동작
	$("#deletebtn").click(function(){
		
		//실제 <form>의 submit 수행
		$("#checkboxlist").submit();
		
	});
	

});

/* 체크박스 전체선택, 전체해제 */
function checkAll(){
      if( $("#th_checkAll").is(':checked') ){
        $("input[name=checkRow]").prop("checked", true);
      }else{
        $("input[name=checkRow]").prop("checked", false);
      }
}
</script>

<div id="main">
	<span id="boardtitle">학생 찾기</span>
	<hr>
	
	
	<!-- 제목 검색 -->
	<div id="serchbox" >
	<form action="${pageContext.request.contextPath}/student/findStu/search" method="post">
	
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
	
	<!-- 글쓰기 삭제 버튼 -->
	<div id="footerbtn">
	
	<div id="divbtn">
		<a href="${pageContext.request.contextPath}/student/findStu/write" class="anone"><button type="button" class="btn btn-default" id="writebtn">글쓰기</button></a>
		<button type="button" class="btn btn-default" id="deletebtn">삭제</button>
	</div> 
	</div>
 
 	<!-- 체크박스 리스트 전송 -->
 	<form action="${pageContext.request.contextPath}/student/findStu/chkdelete" method="post" id="checkboxlist">
 	
	<!-- 학생찾기 리스트 -->
	<table class="table table-striped table-hover table-condensed textcenter" >
	<caption  class="captionstyle">학생찾기</caption>  
	
	<!-- 테이블 th -->
	<tr>
	    <th style="width: 5%"><input type="checkbox" name="th_checkAll" id="th_checkAll" onclick="checkAll();"/></th>
		<th style="width: 5%">번호</th>
		<th style="width: 10%">제목</th>
		<th style="width: 15%">내용</th>
		<th style="width: 10%">지역</th>
		<th style="width: 10%">과목</th>
		<th style="width: 12%">날짜</th>
		<th style="width: 8%">상태</th>
	</tr>
	
	<!-- 게시글이 없을 때  -->
	<c:if  var="noticernone" test="${empty findStuList }">
	<tr>
	<td colspan="8" style="color:  #17B794; font-weight: bold; text-align: center;">게시글이  없습니다</td>
	</tr>
	</table>
	</c:if>
	
	<!--게시글이 있을 때 -->
	<c:if  var="noticeok" test="${!empty findStuList }">
	<!-- 값 출력 -->
	<c:forEach items="${findStuList }" var="findStu" >
	<tr>
	    <td><input type="checkbox" name="checkRow" value="${findStu.findStuNo}" id="checkRow"/></td>
		<td>${findStu.findStuNo }</td>
		<td>
			<div class="txt_line_title">
				<a href="${pageContext.request.contextPath}/student/findStu/detail?noticeNo=${findStu.findStuNo}" class="anone">${findStu.findStuTitle }</a>
			</div>
		</td>
		<td><div class="txt_line_content">${findStu.findStuContent }</div></td>
		<td>${findStu.findStuLoc }</td>
		<td>${findStu.findStuSubject }</td>
		<td>${findStu.findStuDate }</td>
		
		<c:if test="${findStu.findStuState eq 0}">
			<td>게시</td>
		</c:if>			
		<c:if test="${findStu.findStuState eq 1}">
			<td>마감</td>
		</c:if>			
	</tr>
	</c:forEach>
	</table>
	</form>
	
	<!-- 페이징 -->
	<div class="pagingstyle">
	<c:import url="/WEB-INF/paging/student/findStu/listPaging.jsp"></c:import>
	</div>
	</c:if>
	
	
	
	

</div>

<!-- 학생 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/student/stuFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuFooter2.jsp"></c:import>
