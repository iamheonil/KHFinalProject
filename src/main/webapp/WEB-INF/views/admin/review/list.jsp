<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 이인주 : 관리자 > 공지사항 > 목록 jsp -->

<!-- 관리자 페이지 header -->   
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>

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
 	width: 0px; 
 	/* padding-left: 830px; */
 	
 	margin: 0 auto;
}

#footerbtn{
    position: absolute;
    right: 1.5%;
    top: 18%;
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
    	<a href="<%=request.getContextPath()  %>/admin/review/list">후기게시판 </a>
   	</div>

 <div id="content"> 
<!-- 제목 검색 -->
	<div id="serchbox" >
	<form action="${pageContext.request.contextPath}/admin/review/search" method="post">
	
	<div class="row">
	  <div class="col-lg-6">
	    <div class="input-group">
	      <input type="text" class="form-control" placeholder="내용 검색" style="width: 180px;" name="keyword">
	      <span class="input-group-btn">
	        <button class="btn btn-default" type="submit">Search</button>
	      
	      </span>
	    </div><!-- /input-group -->
	  </div><!-- /.col-lg-6 -->
	</div><!-- /.row -->

	</form>
	</div>






	
	<!-- 체크박스 리스트 전송 -->
 	<form action="${pageContext.request.contextPath}/admin/review/idxdelete" method="post" id="checkboxlist">

	<!-- 글쓰기 삭제 버튼 -->
	<div id="footerbtn">
	
	<div id="divbtn">
		<button type="button" class="btn btn-default" id="deletebtn">삭제</button>
	</div> 
	</div>
	<!-- 질문게시판 리스트 -->
	<table class="table table-striped table-hover table-condensed textcenter" >
	<caption  class="captionstyle">후기게시판</caption>  
	
	<!-- 테이블 th -->
	<tr>
	    <th style="width: 5%"><input type="checkbox" name="th_checkAll" id="th_checkAll"  onclick="checkAll();"/></th>
		<th style="width: 10%">번호</th>
		<th style="width: 10%">작성자</th>
		<th style="width: 50%;">후기내용</th>
		<th style="width: 15%">별점</th>
		
		<th style="width: 10%">날짜</th>
	</tr>
	
	
	<!-- 값 출력 -->
	<c:forEach items="${reviewList }" var="review" >
	<tr>
	    <td style="width: 5%"><input type="checkbox" name="checkRow" value="${review.REVIEW_NO}" id="checkRow"/></td>
		<td style="width: 10%">${review.REVIEW_NO }</td>
		<td style="width: 10%"><div class="">${review.USER_ID }</div></td>
		<td style="width: 50%;">
				${review.REVIEW_CONTENT }
		</td>
<%-- 		<td><div class="txt_line_content">${review.starPoint}</div></td> --%>
		
		<td style="width: 15%"><div><c:forEach var="rating" items="${ ratingOptions }" varStatus="status" begin="1" end="${ review.STAR_POINT }">★</c:forEach></div></td>
		
		
		<td style="width: 10%">${review.REVIEW_DATE }</td>
	</tr>
	</c:forEach>
	</table>
	</form>
	<!-- 페이징 -->
	<div class="pagingstyle">
	<c:import url="/WEB-INF/paging/admin/review/reviewlistPaging.jsp"></c:import>
	</div>

</div>
     
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  