
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signStudent.css" type="text/css">


<style type="text/css">
.menu-item#three ul {
   height: 93px; 
}

#questionM{
  background: #eee;
}
#title{

	width: 100%;
	font-weight: bold;
}

#title a {
	color: #17B794; /* 청록색 */
}

</style>


<style type="text/css">

body{
    background:#f5f5f5;
    margin-top:20px;
}
.card {
    border: none;
    -webkit-box-shadow: 1px 0 20px rgba(96,93,175,.05);
    box-shadow: 1px 0 20px rgba(96,93,175,.05);
    margin-bottom: 30px;
}
.table th {
    font-weight: 500;
    color: #262626;
    text-align: center;
}
.table thead {
    background-color: #f3f3f3cc;
}
.table>tbody>tr>td, .table>tfoot>tr>td, .table>thead>tr>td {
    padding: 14px 12px;
    vertical-align: middle;
}
.table tr td {
    color: #262626;
    text-align: center;
}
.thumb-sm {
    height: 32px;
    width: 32px;
}
.badge-soft-warning {
    background-color: rgba(248,201,85,.2);
    color: #f8c955;
}

.badge {
    font-weight: 500;
}
.badge-soft-primary {
    background-color: rgba(96,93,175,.2);
    color: #605daf;
}
#write{
	background: #d66;
	color: white;
}
.container a{
	text-decoration: none;
}
</style>


<div id="title">커뮤니티
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">질문 게시판</a>
</div>


<div class="tab-content" >
<!-- 탭메뉴 -->
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a onclick="location.href='<%= request.getContextPath() %>/teacher/question/list'" class="nav-link active" data-toggle="tab" >작성글</a>
  </li>
  <li class="nav-item">
    <a id="write" onclick="location.href='<%= request.getContextPath() %>/teacher/question/commlist'" class="nav-link" data-toggle="tab" >작성댓글</a>
  </li>
</ul>
  
   <div class="" id="first">
    	<div class="container" style="width: 960px; height: 100%;">
	    <div class="row">
	        <div class="col-xl-12">
	            <div class="card">
	                <div class="card-body">
	                    <div class="table-responsive">
	                    
	                        <table class="table table-hover mb-0">
	                        
	                            <thead>
	                                <tr class="align-self-center">
	                                    <th style="width: 10%">번호</th>
	                                    <th style="width: 70%">댓글</th>
	                                    <th style="width: 20%">작성일</th>
	                                </tr>
	                            </thead>
	                            
	                            <tbody>
	                            <c:if test="${empty Qcommlist}" >
	                            	<td colspan="3">게시글이 존재하지 않습니다.</td>
								</c:if>
	                               	<c:forEach items="${Qcommlist }" var="list" >
										<tr>
											<td>${list.COMM_NO}</td>
<!-- 											<td> -->
<%-- 												<a href="#" title="과외 정보 보기" onclick="lessonModal(${lesson.LESSON_NO });">${lesson.LESSON_TITLE }</a> --%>
<!-- 											</td> -->
											<td><a href="${pageContext.request.contextPath}/board/question/detail?questionNo=${list.QUESTION_NO}">${list.COMM_CONTENT}</a></td>
											<td>${list.COMM_DATE}</td>
										</tr>
									</c:forEach>
	                            </tbody>
	                            
	                        </table>
	                        
			    <c:if test="${not empty Qcommlist}" >
					<c:import url="/WEB-INF/paging/teacher/board/teacherQuestionCommPaging.jsp" />
				</c:if>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
  </div> 
  
  
</div>







<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/main/footer.jsp"></c:import>

