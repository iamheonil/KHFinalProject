<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<style type="text/css">

	#dataTable_length { float: left; }
	#dataTable_info { float: left; }
	#dataTable a:hover  { text-decoration: none; color: black; }
	#dataTable tr:hover { background: #f3f3f3cc; }
	table th,td { text-align: center; }
	table a:hover { cursor: pointer; }

</style>



<!-- 관리자 페이지 header -->   
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>



	<div id="title">과외 
		<i class="fas fa-angle-right"></i>
		<a href="">학생 찾기</a>
	</div>
	
	
	<main>
	    <div id="content">
	    
		
			<c:if test="${empty findStudent }">
				<div>학새찾기 게시글이 없습니다</div>
			</c:if>


			<c:if test="${!empty findStudent }">

	            <div class="container-fluid">
	            
	                <h5 style="font-weight: bold;">학생 찾기</h5><br>
	                
                	<div class="card mb-4">
	                    <div class="card-body">
	                        <div class="table-responsive">
	                        	
	                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                <thead>
	                                    <tr>
	                           				<th style="width: 10%">번호</th>
											<th style="width: 40%">제목</th>
											<th style="width: 10%">작성자</th>
											<th style="width: 10%">작성일</th>
											<th style="width: 10%">게시상태</th>
	                                    </tr>
	                                </thead>
	                                
	                                <!-- ** 추후 구현 : 제목 클릭 시 학생찾기 게시글 페이지로 연결 -->
	                                
	                                <tbody>
					                	<c:forEach items="${findStudent }" var="findStu" >
											<tr>
												<td>${findStu.FIND_STU_NO}</td>
												<td><a href="">${findStu.FIND_STU_TITLE}</a></td> 
												<td>${findStu.USER_ID}</td>
												<td>${findStu.FIND_STU_DATE}</td>
												<c:if test="${findStu.FIND_STU_STATE eq 0}">
													<td>Y</td>
												</c:if>			
												<c:if test="${findStu.FIND_STU_STATE eq 1}">
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
            
            
             
	    </div>
	</main>
        
                
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  