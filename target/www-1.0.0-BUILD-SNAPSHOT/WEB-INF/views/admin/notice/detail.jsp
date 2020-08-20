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
	color: #17B794;
}

#deletebtn{
	color: red;
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

    <div id="title">게시판
    	<i class="fas fa-angle-right"></i>
    	<a href="<%=request.getContextPath()  %>/admin/notice/list">공지사항 </a>
   	</div>

 <div id="content"> 
 
 	<!-- 제목 검색 -->
	<div id="serchbox" >
	<form action="${pageContext.request.contextPath}/admin/notice/search" method="post">
	
	<div class="row">
	  <div class="col-lg-6">
	    <div class="input-group">
	      <input type="text" class="form-control" placeholder="제목 검색" style="width: 180px;" name="artid">
	      <span class="input-group-btn">
	        <button class="btn btn-default" type="submit">Search</button>
	      </span>
	    </div><!-- /input-group -->
	  </div><!-- /.col-lg-6 -->
	</div><!-- /.row -->

	</form>
	</div>
	 <div class="clearfix"></div>
 
	<!-- 공지사항 리스트 -->
	<table class="table table-striped table-hover table-condensed textcenter" >
	<caption  class="captionstyle">공지사항</caption>  
	
	<!-- 테이블 th -->
	<tr style="background: #17B794;" >
		<th style="width: 10%">번호</th>
		<th style="width: 50%">제목</th>
		<th style="width: 20%">날짜</th>
	</tr>
	<tr>
		<td>${noticeone.noticeNo }</td>
		<td>${noticeone.noticeTitle }</td>
		<td>${noticeone.noticeDate }</td>
	</tr>
	
	<tr style="background: #17B794;" >
		<th colspan="3">내용</th>
	</tr>
	<tr>
		<td>${noticeone.noticeContent }</td>
	</tr>
	</table>
	
	<!-- 목록 글쓰기 삭제 버튼 -->
	<div id="divbtn">
		<a href="${pageContext.request.contextPath}/admin/notice/list" class="anone"><button type="button" class="btn btn-default" id="listbtn">목록</button></a>
		<a href="${pageContext.request.contextPath}/admin/notice/modify" class="anone"><button type="button" class="btn btn-default" id="writebtn">수정</button></a>
		<a href="${pageContext.request.contextPath}/admin/notice/delete" class="anone"><button type="button" class="btn btn-default" id="deletebtn">삭제</button></a>
	</div> 
	
</div>  

     
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  