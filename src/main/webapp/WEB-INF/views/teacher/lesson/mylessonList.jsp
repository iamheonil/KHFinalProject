
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signStudent.css" type="text/css">


<style type="text/css">
.menu-item#lessonM ul {
   height: 93px; 
}

#mylessonListM{
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
.button3{
	background-color: #ccc; 
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
<script>
function deletelesson(lessonNo){
	var chk = confirm("해당 게시물을 삭제하시겠습니까?");
	
	if(chk == true){
		var url = "<%=request.getContextPath() %>/teacher/deletelesson";
		
		$.ajax({
			type : "POST",
			url: url,
			data: {lessonNo : lessonNo},
			success : function(result) {
				if (result == 1) {
					alert("해당 게시물이 삭제되었습니다.");
					location.reload();
				}
			},
			error : function(){
				alert("연결되어 있는 과외가 존재하여 삭제할 수 없습니다.")
			}
		});
	}
	
}

// function deletelesson(url){
// 	var answer;
// 	answer = confirm('해당 게시물을 삭제하시겠습니까?');
	
// 	//확인 선택
// 	if(answer == true){
// 		console.log(url);
// 		location = url;
// 		alert('해당 게시물이 삭제되었습니다.');
// 	}
// }

function endlessonClick(no){
	
	var answer;
	answer = confirm('해당 과외를 마감하시겠습니까?');
	
	//확인 선택
	if(answer == true){
		location = no;
		alert('해당 과외가 마감되었습니다.');
	}
}

function lessonModal(lessonNo){
	var url = "<%=request.getContextPath() %>/teacher/mylessoninfo";
	
	$.ajax({
		type : "POST",
		url: url,
		data: {lessonNo : lessonNo},
		success : function(result) {
			var res = result;
			console.log(res);
			
			$("#lessonTitle").text(result.LESSON_TITLE);
			$("#lessonContent").text(result.LESSON_CONTENT);
			$("#lessonSub").text(result.LESSON_SUBJECT);
			$("#lessonTch").text(result.USER_NAME);
			$("#lessonLoc").text(result.LESSON_LOC);
			$("#lessonPrice").text(result.LESSON_PRICE + " 원");
			$("#lessonAge").text(result.LESSON_AGE);
			$("#lessonPeople").text(result.MAX_PEOPLE + " 명");
			
		},
		error : function(){
			alert("과외가 존재하지 않습니다.")
		}
		
	})
	
	$("#lessonModal").modal();
	
}

</script>
<!-- 모달창 -->
<div class="modal fade" id="lessonModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
  <div class="modal-dialog" role="document"  style="z-index: inherit;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h6 class="modal-title" id="lessonModalLabel">과외 정보</h6>
      </div>
      <div class="modal-body">
      	<section class="ng-scope ng-fadeInLeftShort" style="">
		<!-- uiView:  -->
		<div class="ng-fadeInLeftShort ng-scope" style="">
		<div class="container-overlap bg-blue-500 ng-scope">
		  <div class="media m0 pv">
		    <div class="media-body media-middle">
		      <h4 class="media-heading text-white" id="lessonTitle"></h4>
		    </div>
		  </div>
		</div>
		<div class="container-fluid ng-scope">
		  <div class="row">
		    <!-- Left column-->
		    <div class="col-md-7 col-lg-12">
		      <form class="card ng-pristine ng-valid">
		        <h5 class="card-heading pb0">
		            과외 내용
		        </h5>
		        <div class="card-body">
		          <p id="lessonContent" class="ng-scope ng-binding editable"></p>
		        </div>
		        <h5 class="card-heading pb0">상세 정보</h5>
		        <div class="card-body">
		          <table class="table table-striped">
		            <tbody>
		              <tr>
		                <td style="width: 30%;">과목</td>
		                <td class="ng-binding" id="lessonSub"></td>
		              </tr>
		              <tr>
		                <td>선생님</td>
		                <td><span class="ng-scope ng-binding editable" id="lessonTch"></span></td>
		              </tr>
		              <tr>
		                <td>위치</td>
		                <td><span class="ng-scope ng-binding editable" id="lessonLoc"></span></td>
		              </tr>
		              <tr>
		                <td>가격</td>
		                <td><span class="ng-scope ng-binding editable" id="lessonPrice"></span></td>
		              </tr>
		              <tr>
		                <td>연령</td>
		                <td><span class="ng-scope ng-binding editable" id="lessonAge"></span></td>
		              </tr>
		              <tr>
		                <td>인원</td>
		                <td><span class="ng-scope editable" id="lessonPeople"></span></td>
		              </tr>
		            </tbody>
		          </table>
		        </div>
		      </form>
		    </div>
		  </div>
		</div>
		</div>
		</section>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
       
      </div>
    </div>
  </div>
</div>

<div id="title">과외
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">내 과외 목록</a>
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
	                                    <th style="width: 29%">과외명</th>
	                                    <th style="width: 12%">과목</th>
	                                    <th style="width: 10%">지역</th>
	                                    <th style="width: 8%">구분</th>
	                                    <th style="width: 13%">작성일</th>
	                                    <th style="width: 8%">모집마감</th>
	                                    <th style="width: 10%">삭제</th>
	                                </tr>
	                            </thead>
	                            
	                            <tbody>
	                               	<c:forEach items="${list }" var="lesson" >
										<tr>
											<td>${lesson.LESSON_NO}</td>
											<td>
												<a href="#" title="과외 정보 보기" onclick="lessonModal(${lesson.LESSON_NO });">${lesson.LESSON_TITLE }</a>
											</td>
											<td>${lesson.LESSON_SUBJECT}</td>
											<td>${lesson.LESSON_LOC}</td>
											<c:if test="${lesson.MAX_PEOPLE eq 1 }">
												<td>개인</td>
											</c:if>
											<c:if test="${lesson.MAX_PEOPLE > 1 }">
												<td>그룹</td>
											</c:if>
											<td>${lesson.LESSON_DATE}</td>
											<c:if test="${lesson.LESSON_STATE eq 1 }">
												<td><a href="javascript:endlessonClick('${pageContext.request.contextPath}/teacher/endlesson?lessonNo=${lesson.LESSON_NO}')"><button id="endlesson" name="endlesson" class="button button2">마감</button></a></td>
											</c:if>
											<c:if test="${lesson.LESSON_STATE eq 0 }">
												<td><button id="endlesson" name="endlesson" class="button button3" disabled="disabled">마감</button></td>
											</c:if>
<!-- 											<td><a id="xicon"  -->
<%-- 												href="javascript:deletelesson('${pageContext.request.contextPath}/teacher/deletelesson?lessonNo=${lesson.LESSON_NO}')"  --%>
<!-- 												class="glyphicon glyphicon-remove"></a></td> -->
											<td><a id="xicon" href="javascript:void(0);"
												onclick="deletelesson(${lesson.LESSON_NO});" 
												class="glyphicon glyphicon-remove"></a></td>
												
										</tr>
									</c:forEach>
	                            </tbody>
	                            
	                        </table>
	                        
			    <c:if test="${not empty list}" >
					<c:import url="/WEB-INF/paging/teacher/lesson/myLessonPaging.jsp" />
				</c:if>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>





<!-- 선생님 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>


