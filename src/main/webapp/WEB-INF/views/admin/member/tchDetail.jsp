<!-- 200824 김성은-->
<!-- /admin/tchdetail -->
<!-- 관리자 > 회원 > 선생님 관리 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 페이지 header -->   
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/>  -->
<!-- <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script> -->
<script src="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>





<!-- 하나의 페이징에 보여질 게시글 수 -->
<script type="text/javascript">
$(document).ready(function($){ 
	$("#table1").DataTable({
		lengthMenu: [ 5, 10, 20, 30, 40 ]
	}); 
	$("#table2").DataTable({ 
		lengthMenu: [ 5, 10, 20, 30, 40 ]
	});
	$("#table3").DataTable({ 
		pagingType: "simple_numbers",
		lengthMenu: [ 5, 10, 20, 30, 40 ],
	});
	
}); 



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

<style type="text/css">

	#table1_length { float: left; }
	#table1_info { float: left; }
	#table1 a:hover  { text-decoration: none; color: black; }
	#table1 td:nth-child(2):hover { background: #f3f3f3cc; }

	#table2_length { float: left; }
	#table2_info { float: left; }
/* 	#table2 a:hover  { text-decoration: none; color: black; } */
/* 	#table2 td:nth-child(2):hover { background: #f3f3f3cc; } */

	#table3_length { float: left; }
	#table3_info { float: left; }
	#table3 a:hover  { text-decoration: none; color: black; }
	#table3 td:nth-child(2):hover { background: #f3f3f3cc; }
</style>
<body>	
	<div id="title">회원 
		<i class="fas fa-angle-right"></i>
		<a href="">선생님 관리</a>
	</div>
	
	
	<main>
	
	
	    <div id="content">
	    <button type="button" class="btn btn-info" onclick="location.href='tchList'" style="margin-left: 88%">목록</button>


	           	<div class="container-fluid">
                        <h5 style="font-weight: bold;">질문게시판</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="table1" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                   				<th style="width: 15%">게시글 번호</th>
												<th style="width: 45%">제목</th>
												<th style="width: 20%">작성자</th>
												<th style="width: 20%">작성일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
						                    <c:forEach items="${tchData.tchQuestion }" var="question" >
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
                    
                



	           	<div class="container-fluid">
                        <h5 style="font-weight: bold;">후기게시판</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="table2" class="table table-bordered">
									    <thead>
									        <tr>
									            <th style="width: 15%">별점</th> <!-- 평점 -->
									            <th style="width: 65%">내용</th>
									            <th style="width: 10%">작성자ID</th>
									        </tr>
									    </thead>
									    <tbody>
									    	<c:set var="flag" value ="true"/>
									        <c:forEach var="review" items="${ tchData.tchReview }" varStatus="status">
									            <c:if test="${flag eq 'true'}">
									            <!-- 평점 기준 별표시 출력 -->
									            <tr>
									                <td><c:forEach var="rating" items="${ ratingOptions }" varStatus="status" begin="1" end="${ review.STAR_POINT }">★</c:forEach></td>
									                <td>${ review.REVIEW_CONTENT}</td>
									                <td>${review.USER_ID}</td>
									            </tr>
									            
												</c:if>
									        </c:forEach>
									        
									    </tbody>
									</table>
                                </div>
                            </div>
                        </div>
                    
            
            <!-- 중고장터 -->

	           	<div class="container-fluid">
                        <h5 style="font-weight: bold;">중고장터</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="table3" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                   				<th style="width: 15%">게시글 번호</th>
												<th style="width: 40%">제목</th>
												<th style="width: 15%">작성자</th>
												<th style="width: 15%">작성일</th>
												<th style="width: 15%">판매상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
						                    <c:forEach items="${tchData.tchMarket }" var="market" >
												<tr>
													<td>${market.mkNo}</td>
													<td><a href="">${market.mkTitle}</a></td> <!-- 추후추가 : 과외페이지로 연결 -->
													<td>${market.mkWriter}</td>
													<td>${market.mkDate}</td>
													<c:if test="${market.mkState == 0}">
														<td>판매중</td>
													</c:if>
													<c:if test="${market.mkState == 1}">
														<td>판매완료</td>
													</c:if>
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    
            
		</div>
		
		
		
	</main>
       
       
  </body>     
       
                
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  