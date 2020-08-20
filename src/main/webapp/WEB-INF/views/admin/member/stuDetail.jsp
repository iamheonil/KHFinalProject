<!-- 200820 김성은-->
<!-- /admin/studetail -->
<!-- 관리자 > 회원 > 학생 관리 > 학생 조회-->

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


	<div id="title">회원 
		<i class="fas fa-angle-right"></i>
		<a href="">학생 관리</a>
	</div>
	
	
	<main>
	    <div id="content">
	    
			
			
			
			
			<c:if test="${empty stuData.stuQuestion }">
				<div>게시글이 없습니다</div>
			</c:if>


			<c:if test="${!empty stuData.stuQuestion }">

	           	<div class="container-fluid">
                        <h5 style="font-weight: bold;">질문게시판</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                   				<th style="width: 10%">번호</th>
												<th style="width: 50%">제목</th>
												<th style="width: 20%">작성자</th>
												<th style="width: 20%">작성일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
						                    <c:forEach items="${stuData.stuQuestion }" var="question" >
												<tr>
													<td>${question.questionNo}</td>
													<td><a href="">${question.questionTitle}</a></td> <!-- 추후추가 : 과외페이지로 연결 -->
													<td>${question.userNo}</td>
													<td>${question.questionDate}</td>
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    
                
            </c:if>
            
                


                    
	</main>
       
       
       
       
                
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  