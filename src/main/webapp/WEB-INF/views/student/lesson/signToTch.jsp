
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuHeader.jsp"></c:import>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signStudent.css" type="text/css">


<style type="text/css">
.menu-item#four ul {
   height: 124px; 
}

#applylistM{
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
	background-color: #a2e; 
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
#th th{
	font-weight: bold;
}
.container a{
	text-decoration: none;
}
</style>
<script>

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
			alert("ajax 실패")
		}
		
	})
	
	$("#lessonModal").modal();
	
}

function StudentModal(teacherNo){
	var url = "<%=request.getContextPath() %>/student/teacherinfo";
	
	$.ajax({
		type : "POST",
		url: url,
		data: {teacherNo : teacherNo},
		success : function(result) {
			$("#stuInfoTabel #userName").text(result.USER_NAME);
			$("#stuInfoTabel #userId").text(result.USER_ID);
			
			if( result.USER_GENDER == 'm' ){
				$("#stuInfoTabel #userGender").text('남');
			}else if( result.USER_GENDER == 'w'){
				$("#stuInfoTabel #userGender").text('여');
			}
			
			$("#stuInfoTabel #userBirth").text(result.USER_BIRTH);
			$("#stuInfoTabel #userEmail").text(result.USER_EMAIL);
// 			var savePath = result.SAVE_PATH;
			var rename = result.TCH_FILE_RENAME;
			var path = '<%= request.getContextPath() %>/resources/upload/' + rename;
			if(result.TCH_FILE_RENAME == '' || result.TCH_FILE_RENAME == null){
				$("#stuInfoTabel #tchimg").html("<img id='tch' class='img-circle profile-avatar' alt='선생님프로필사진' src='${pageContext.request.contextPath}/resources/images/profile.png'>");
			}else{
				console.log(path);
				$("#stuInfoTabel #tchimg").html('<img id="tch" class="img-circle profile-avatar" alt="teacherFile" src="${pageContext.request.contextPath}/resources/upload/'+rename+' " />');
			}
		},
		error : function(){
			alert("ajax 실패")
		}
		
	})
	
	$("#StudentModal").modal();
	
}

function deletelesson(connLessonNo){
	var chk = confirm("과외 신청을 취소하시겠습니까?");
	
	if(chk == true){
		var url = "<%=request.getContextPath() %>/student/cancelapply";
		
		$.ajax({
			type : "POST",
			url: url,
			data: {connLessonNo : connLessonNo},
			success : function(result) {
				if (result == 1) {
					alert("과외 신청이 취소되었습니다.");
					location.reload();
				}
			},
			error : function(){
				alert("ajax 실패")
			}
		});
	}
	
}


</script>
<!-- 과외 정보 모달창 -->
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

<!-- 선생님 모달 -->
<div class="modal fade" id="StudentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
  <div class="modal-dialog" role="document"  style="z-index: inherit;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h6 class="modal-title" id="studentModalLabel">선생님 정보</h6>
      </div>
      <div class="modal-body">
            <div class="panel-body">
            
              <div class="row">
                  <table id="stuInfoTabel" class="table table-user-information" style="width: 70%">
                    <tbody>
                      <tr>
                        <td id="tchimg" colspan="2" style="text-align: center;"></td>
                      </tr>
                      <tr>
                        <td style="width: 50%; font-weight: bold;">이름</td>
                        <td style="width: 50%;" id="userName"></td>
                      </tr>
                      <tr>
                        <td style="font-weight: bold;">아이디</td>
                        <td id="userId"></td>
                      </tr>
                      <tr>
                        <td style="font-weight: bold;">생년월일</td>
                        <td id="userBirth"></td>
                      </tr>
                      <tr>
                        <td style="font-weight: bold;">성별</td>
                        <td id="userGender"></td>
                      </tr>
                        <tr>
                        <td style="font-weight: bold;">이메일</td>
                        <td id="userEmail"></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
       
      </div>
    </div>
  </div>
</div>
      






<div id="title">과외
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">과외 신청 내역</a>
</div>
<!-- <div id="title"> -->
<!-- 	<i class="glyphicon glyphicon-menu-right"></i> -->
<!-- 	<a href="">자료실</a> -->
<!-- </div> -->


	<div class="container" style="width: 960px; height: 100%;">
	    <div class="row">
	        <div class="col-xl-12">
	            <div class="card">
	                <div class="card-body">
	                    <div class="table-responsive">
	                    
	                        <table class="table table-hover mb-0">
	                        
	                            <thead>
	                                <tr class="align-self-center" id="th">
	                                    <th style="width: 10%">과외번호</th>
	                                    <th style="width: 15%">선생님</th>
	                                    <th style="width: 20%">과외명</th>
	                                    <th style="width: 15%">과목</th>
	                                    <th style="width: 10%">인원</th>
	                                    <th style="width: 10%">신청일</th>
	                                    <th style="width: 10%">승인여부</th>
	                                    <th style="width: 10%">취소</th>
	                                </tr>
	                            </thead>
	                            
	                            <tbody>
	                               	<c:forEach items="${list }" var="list" >
										<tr>
											<td>${list.LESSON_NO}</td>
											<td><a href="#" title="선생님 정보 보기" onclick="StudentModal(${list.TEACHER});">${list.USER_NAME }</a></td>
<%-- 											<td>${list.USER_NAME }</td> --%>
											<td>
												<a href="#" title="과외 정보 보기" onclick="lessonModal(${list.LESSON_NO });">${list.LESSON_TITLE }</a>
											</td>
											<td>${list.LESSON_SUBJECT}</td>
											<c:if test="${list.MAX_PEOPLE eq 1 }">
												<td>개인</td>
											</c:if>
											<c:if test="${list.MAX_PEOPLE > 1 }">
												<td>그룹</td>
											</c:if>
											<td>${list.LEG_DATE}</td>
											<c:if test="${list.IS_CONNECTED eq 0 }">
												<td><button id="endlesson" class="button button3" disabled="disabled">검토중</button></td>
											</c:if>
<%-- 											<c:if test="${list.IS_CONNECTED eq 1 }"> --%>
<!-- 												<td><button id="endlesson" class="button button2" disabled="disabled">승인</button></td> -->
<%-- 											</c:if> --%>
											<c:if test="${list.IS_CONNECTED eq 2 }">
												<td><button id="endlesson" class="button button2" disabled="disabled">거절</button></td>
											</c:if>
<!-- 											<td><a id="xicon"  -->
<%-- 												href="javascript:deletelesson('${pageContext.request.contextPath}/teacher/deletelesson?lessonNo=${lesson.LESSON_NO}')"  --%>
<!-- 												class="glyphicon glyphicon-remove"></a></td> -->
											<td><a id="xicon" href="javascript:void(0);"
												onclick="deletelesson(${list.CONN_LESSON_NO});" 
												class="glyphicon glyphicon-remove" ></a></td>
										</tr>
									</c:forEach>
	                            </tbody>
	                            
	                        </table>
	                        
			    <c:if test="${not empty list}" >
					<c:import url="/WEB-INF/paging/student/lesson/applyPaging.jsp" />
				</c:if>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>





<!-- 학생 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/student/stuFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuFooter2.jsp"></c:import>


