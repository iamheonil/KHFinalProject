<!-- 200820 이서연 -->
<!-- /admin/lesson/confirm -->
<!-- 관리자 페이지 > 과외 > 과외 검토 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 페이지 header -->   
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>


<script>
	function lessonDetail(){  
	
	// 모달
	// 	    var url = "/dog/detailView?dogno="+dogno;
	// 	    var name = "";
	// 	    var option = "width = 1200, height = 800, top = 100, left = 100 "
	// 	    window.open(url, name, option);
	
		var no = $('#lessonNo').val();
	
		console.log("클릭됨: "+ no);
	}
</script>



<style type="text/css">

	#dataTable_length { float: left; }
	#dataTable_info { float: left; }
	#dataTable a:hover  { text-decoration: none; color: black; }
	#dataTable tr:hover   { background: #f3f3f3cc; }

</style>


	<div id="title">과외 
		<i class="fas fa-angle-right"></i>
		<a href="">과외 검토</a>
	</div>
	
	
	<main>
	    <div id="content">
	    

			<c:if test="${empty confirmList }">
				<div>검토할 과외가 없습니다</div>
			</c:if>


			<c:if test="${!empty confirmList }">

	            <div class="container-fluid">
	            
	                <h5 style="font-weight: bold;">과외 검토</h5><br>
	                
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
											<th style="width: 10%">검토</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
					                	<c:forEach items="${confirmList }" var="confirmList" >
					                		<input type="hidden" value="${confirmList.LESSON_NO}" id="lessonNo"/>
											<tr>
												<td>${confirmList.LESSON_NO}</td>
												<td onclick="lessonDetail()">${confirmList.LESSON_TITLE}</td> 
												<td>${confirmList.USER_ID}</td>
												<td>${confirmList.LESSON_DATE}</td>
												<td>
													<input type="button" value="승인">
													<input type="button" value="반려">
												</td>
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
  