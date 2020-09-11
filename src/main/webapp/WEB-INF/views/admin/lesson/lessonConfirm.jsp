<!-- 200820 이서연 -->
<!-- /admin/lesson/confirm -->
<!-- 관리자 페이지 > 과외 > 과외 검토 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 관리자 페이지 header -->   
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>



<script type="text/javascript">

function lessonDetail(LESSON_NO){                   

	var no = LESSON_NO; 
		
//  	console.log("클릭됨: "+ no); 
 	
	var url = "${pageContext.request.contextPath}/admin/lesson/confirm/detail?no="+no;
	var name = "lessonDetail";
	var option = "width=800, height=600, top=100, left=100";
	
	window.open(url, name, option);

}

/* 승인버튼 클릭 */
function admitClick(LESSON_NO){
	
	var no = LESSON_NO; 
	
	$(location).attr("href", "${pageContext.request.contextPath}/admin/lesson/confirm/admit?no="+no);
	
}

/* 반려버튼 클릭 */
function denyClick(LESSON_NO){
	
	var no = LESSON_NO; 
	
	$(location).attr("href", "${pageContext.request.contextPath}/admin/lesson/confirm/deny?no="+no);
	
}


</script>


<style type="text/css">

	#dataTable_length { float: left; }
	#dataTable_info { float: left; }
	#dataTable a:hover  { text-decoration: none; color: black; }
	#dataTable tr:hover   { background: #f3f3f3cc; }
	table th,td { text-align: center; }
	table a:hover { cursor: pointer; }
	
	.button2 { /* 승인버튼 */
		background-color: #17B794; 
		border: none;
		color: white;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 15px;
		border-radius: 4px;
		cursor: pointer;
	}
	.button5 { /* 반려버튼 */
		background-color: #555555;
	    border: none;
	    color: white;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 15px;
	    border-radius: 4px;
	    cursor: pointer;
	}

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
											<th style="width: 40%">과외명</th>
											<th style="width: 15%">선생님ID</th>
											<th style="width: 15%">선생님이름</th>
											<th style="width: 10%">작성일</th>
											<th style="width: 10%">검토</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
					                	<c:forEach items="${confirmList }" var="confirm" >
											<tr>
												<td>${confirm.LESSON_NO}</td>
												<td onclick="lessonDetail(${confirm.LESSON_NO});"><a>${confirm.LESSON_TITLE}</a></td> 
												<td>${confirm.USER_ID}</td>
												<td>${confirm.USER_NAME}</td>
												<td>${confirm.LESSON_DATE}</td>
												<td>
													<button onclick="admitClick(${confirm.LESSON_NO});" id="admit" name="admit" class="button button2">승인</button>
													<button onclick="denyClick(${confirm.LESSON_NO});"id="deny" name="deny" class="button button5">반려</button>
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
  