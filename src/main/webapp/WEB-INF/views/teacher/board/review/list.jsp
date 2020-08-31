<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>


<div id="title">게시판
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="${pageContext.request.contextPath}/teacher/review/list">후기 게시판</a>
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href=""></a>
</div>



 <div id="content"> 
 
 
	<!-- 제목 검색 -->
	<div id="serchbox" >
		<form action="${pageContext.request.contextPath}/teacher/review/search" method="post">
			<div class="row">
				<div class="col-lg-6">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="제목 검색" style="width: 180px;" name="keyword">
						<span class="input-group-btn">
							<button class="button button1" type="submit">검색</button>
						</span>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	
	<input type="hidden" value="${cno}"id="no" />
 
 	<!-- 체크박스 리스트 전송 -->
 	<form action="${pageContext.request.contextPath}/teacher/review/delete" method="post" id="checkboxlist">
 	
 	
		<!-- 질문게시판 리스트 -->
		<table class="table table-hover textcenter" >

		
		<tr>
		    <th style="width: 5%"><input type="checkbox" name="th_checkAll" id="th_checkAll" onclick="checkAll();"/></th>
			<th style="width: 15%">작성한 글번호</th>
			<th style="width: 10%">작성자</th>
			<th style="width: 45%">내용</th>
			<th style="width: 10%">별점</th>
			<th style="width: 15%">작성일</th>
		</tr>
		
		<!-- 게시글이 없을 때  -->
		<c:if test="${empty reviewList }" >
		
			<input type="hidden" value="${cno}"id="no" />
			
			<tr>
				<td colspan="8" style="color: #17B794; font-weight: bold;">게시글이  없습니다</td>
			</tr>
		
		</c:if>
		
		<!--게시글이 있을 때 -->
		<c:if test="${!empty reviewList }" >
		
		
			<!-- 값 출력 -->
			<c:forEach items="${reviewList }" var="reviewList">
			
		 		<input type="hidden" value="${reviewList.reviewNo}" name="no" id="no" />
		 		
			<tr>
			    <td><input type="checkbox" name="checkRow" value="${reviewList.reviewNo}" id="checkRow"/></td>
				<td>${reviewList.reviewNo}</td>
				<td>
					<a href="#">${reviewList.reviewContent }
					</a>
				</td>
				<td>${reviewList.starPoint }</td>
				<td>${reviewList.reviewDate }</td>
			</tr>
			</c:forEach>
	</c:if>
		</table>
		
		
	</form>
	
		<!-- 페이징 -->
		<div class="pagingstyle">
			<c:import url="/WEB-INF/paging/teacher/webShare/webShareListPaging.jsp"></c:import>
		</div>
	
	
	
	
	<!-- 글작성/삭제 버튼 -->
	<div id="footerbtn">
		<div id="divbtn">
			<button type="button" class="button button2" id="updatebtn">수정</button>
			<button type="button" class="button button3" id="deletebtn">삭제</button>
		</div> 
	</div>
	
 
	
	
</div><!--end content -->















<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>