<!-- 200819 이서연 -->
<!-- /admin/lesson/view -->
<!-- 관리자 페이지 > 과외 > 과외 조회 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 페이지 header -->   
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>


<style type="text/css">

	#dataTable_length { float: left; }
	#dataTable_info { float: left; }
	#dataTable a:hover  { text-decoration: none; color: black; }
	#dataTable td:nth-child(2):hover { background: #f3f3f3cc; }

</style>


	<div id="title">과외 
		<i class="fas fa-angle-right"></i>
		<a href="">과외 조회</a>
	</div>
	
	
	<main>
	    <div id="content">
	    

			<c:if test="${empty lessonList }">
				<div>과외가 없습니다</div>
			</c:if>


			<c:if test="${!empty lessonList }">

	            <div class="container-fluid">
	            
	                <h5 style="font-weight: bold;">전체 과외 조회</h5><br>
	                
                	<div class="card mb-4">
	                    <div class="card-body">
	                        <div class="table-responsive">
	                        	
	                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                <thead>
	                                    <tr>
	                           				<th style="width: 10%">번호</th>
											<th style="width: 50%">과외명</th>
											<th style="width: 15%">작성자</th>
											<th style="width: 15%">작성일</th>
											<th style="width: 10%">게시상태</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
					                	<c:forEach items="${lessonList }" var="lessonList" >
											<tr>
												<td>${lessonList.LESSON_NO}</td>
												<td><a href="">${lessonList.LESSON_TITLE}</a></td> <!-- 추후추가 : 과외페이지로 연결 -->
												<td>${lessonList.USER_ID}</td>
												<td>${lessonList.LESSON_DATE}</td>
												<c:if test="${lessonList.LESSON_STATE eq 1}">
													<td>Y</td>
												</c:if>
												<c:if test="${lessonList.LESSON_STATE eq 0}">
													<td>N</td>
												</c:if>
											</tr>
										</c:forEach>
	                                </tbody>
	                            </table>
	                            
	                        </div>
	                    </div>
	                </div>
                </div>  
                
            </c:if>
            
                


                    <div class="container-fluid">
                        <h5 style="font-weight: bold;">과외 조회</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                   				<th style="width: 10%">번호</th>
												<th style="width: 50%">과외명</th>
												<th style="width: 20%">작성자</th>
												<th style="width: 20%">작성일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
						                    <c:forEach items="${lessonList }" var="lessonList" >
												<tr>
													<td>${lessonList.LESSON_NO}</td>
													<td><a href="">${lessonList.LESSON_TITLE}</a></td> <!-- 추후추가 : 과외페이지로 연결 -->
													<td>${lessonList.USER_ID}</td>
													<td>${lessonList.LESSON_DATE}</td>
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    
>>>>>>> 89a060d6795f5cfc80c65ebf9d3ee36500375a1b
	    </div>
	</main>
       
       
       
       
                
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  