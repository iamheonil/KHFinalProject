
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 선생님 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>




<style type="text/css">

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

</style>

<style type="text/css">

#xicon {

	border: 2px solid #333;
	border-radius: 3px;
}

#xicon:hover { 

	text-decoration: none;
	color: #333;
}

.button2 { /* 자료실버튼 */
	background-color: #17B794; 
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	padding: 2px;
	border-radius: 3px;
	cursor: pointer;
}

</style>



<div id="title">과외 연결
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">연결된 과외</a>
</div>
<!-- <div id="title"> -->
<!-- 	<i class="glyphicon glyphicon-menu-right"></i> -->
<!-- 	<a href="">자료실</a> -->
<!-- </div> -->

	<br>

	<div class="container" style="width: 960px; height: 100%;">
	    <div class="row">
	        <div class="col-xl-12">
	            <div class="card">
	                <div class="card-body">
	                    <div class="table-responsive">
	                    
	                        <table class="table table-hover mb-0">
	                        
	                            <thead>
	                                <tr class="align-self-center">
	                                    <th style="width: 5%">번호</th>
	                                    <th style="width: 30%">과외명</th>
	                                    <th style="width: 10%">학생</th>
	                                    <th style="width: 15%">과목</th>
	                                    <th style="width: 10%">지역</th>
	                                    <th style="width: 10%">구분</th>
	                                    <th style="width: 10%">자료실</th>
	                                    <th style="width: 10%">종료</th>
	                                </tr>
	                            </thead>
	                            
	                            <tbody>
	                               	<c:forEach items="${connectedLessonList }" var="lesson" >
										<tr>
											<td>${lesson.LESSON_NO}</td>
											<td><a href="">${lesson.LESSON_TITLE}</a></td>
											<td>${lesson.USER_ID}</td>
											<td>${lesson.LESSON_SUBJECT}</td>
											<td>${lesson.LESSON_LOC}</td>
											<c:if test="${lesson.MAX_PEOPLE eq 1 }">
												<td>개인</td>
											</c:if>
											<c:if test="${lesson.MAX_PEOPLE > 1 }">
												<td>그룹</td>
											</c:if>
											<td><button onclick="webshareClick(${lesson.CONN_LESSON_NO});" id="webshare" name="webshare" class="button button2">자료실</button></td>
											<td><a id="xicon" href="" class="glyphicon glyphicon-remove"></a></td>
										</tr>
									</c:forEach>
	                            </tbody>
	                            
	                        </table>
	                        
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>





<!-- 선생님 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>


