<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signStudent.css" type="text/css">
<style type="text/css">

<style type="text/css">
#StudentModal{
	padding: 0;
}

.modal-dialog{
	overflow-y:initail !important;
   width: 500px;
}

.modal-body{
   overflow-y:auto; 
   background: #f5f5f5;
}
.user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad
{margin-top:20px;
}

.panel-body{
	text-align: center;
}

#stuInfoTabel{
	width: 60%;
	margin: 0 auto;
	text-align: left;
}
</style>
<script type="text/javascript">
function connectStu(connNo){
	var chk = confirm("학생을 승인하시겠습니까?");
	
	if(chk == true){
		var url = "<%=request.getContextPath() %>/teacher/signstu";
		
		$.ajax({
			type : "POST",
			url: url,
			data: {connNo : connNo},
			success : function(result) {
				if (result == 1) {
					alert("승인되었습니다.");
					location.reload();
				}else if( result == 2){
					alert("인원이 초과되었습니다.");
				}
			},
			error : function(){
				alert("ajax 실패")
			}
		});
	}
	
}

function rejectStu(connNo){
	var chk = confirm("학생을 거절하시겠습니까?");
	
	if(chk == true){
		var url = "<%=request.getContextPath() %>/teacher/rejectstu";
		
		$.ajax({
			type : "POST",
			url: url,
			data: {connNo : connNo},
			success : function(result) {
				if (result == 1) {
					alert("거절하였습니다.");
					location.reload();
				}
			},
			error : function(){
				alert("ajax 실패")
			}
		});
	}
	
}

function lessonModal(lessonNo){
	var url = "<%=request.getContextPath() %>/teacher/lessoninfo";
	
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

function StudentModal(studentNo){
	var url = "<%=request.getContextPath() %>/teacher/studentinfo";
	
	$.ajax({
		type : "POST",
		url: url,
		data: {studentNo : studentNo},
		success : function(result) {
			$("#stuInfoTabel #userName").text(result.userName);
			$("#stuInfoTabel #userId").text(result.userId);
			
			if( result.userGender == 'm' ){
				$("#stuInfoTabel #userGender").text('남');
			}else if( result.userGender == 'w'){
				$("#stuInfoTabel #userGender").text('여');
			}
			
			$("#stuInfoTabel #userBirth").text(result.userBirth);
			$("#stuInfoTabel #userEmail").text(result.userEmail);
		},
		error : function(){
			alert("ajax 실패")
		}
		
	})
	
	$("#StudentModal").modal();
	
}

</script>

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

<!-- 학생 모달 -->
<div class="modal fade" id="StudentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
  <div class="modal-dialog" role="document"  style="z-index: inherit;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h6 class="modal-title" id="studentModalLabel">학생 정보</h6>
      </div>
      <div class="modal-body">
            <div class="panel-body">
            
              <div class="row">
                  <table id="stuInfoTabel" class="table table-user-information">
                    <tbody>
                      <tr>
                        <td colspan="2" style="text-align: center;"><img alt="선생님프로필사진" src="${pageContext.request.contextPath}/resources/images/profile.png" id="teaprofileimg"></td>
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
      

	<div class="listBox">
			<div id="title">과외
				<i class="glyphicon glyphicon-menu-right"></i>
				<a href="">과외 검토 & 결제</a>
			</div>
			
			<div class="row">
	<div class="col-lg-12">
		<div class="main-box clearfix">
			<div class="table-responsive">
				<table class="table user-list">
					<thead>
						<tr>
							<th class="text-center" style="width: 15%;"><span>번호</span></th>
							<th class="text-center" style="width: 30%;"><span>과외명</span></th>
							<th class="text-center" style="width: 12;"><span>과목</span></th>
							<th class="text-center"><span>인원</span></th>
							<th class="text-center" style="width: 13%;"><span>작성일</span></th>
							<th class="text-center"><span>관리자검토</span></th>
							<th class="text-center"><span>결제상태</span></th>
						</tr>
					</thead>
					<tbody>
                       <c:forEach items="${list }" var="pay">
						<tr>
							<td>${pay.LESSON_NO }</td>
							<td>
								<a href="#" title="과외 정보 보기" onclick="lessonModal(${pay.LESSON_NO });">${pay.LESSON_TITLE }</a>
							</td>
							<td>
								${pay.LESSON_SUBJECT }
							</td>
							<td>
								<c:if test="${pay.MAX_PEOPLE eq 1 }">
									<!-- <span class="label label-warning">개인</span> -->
									<span>개인</span>
								</c:if>
								<c:if test="${pay.MAX_PEOPLE gt 1 }">
									<!-- <span class="label label-success">그룹</span> -->
									<span>그룹</span>
								</c:if>
							</td>
							<td>
								${pay.LESSON_DATE }
<%-- 								<fmt:formatDate value="${date.to}" pattern="yy/MM/dd" /> --%>
							</td>
							<td>
								<c:if test="${pay.LESSON_CHK eq 0 }">
<!-- 									<span class="label label-warning">검토중</span> -->
									<span>검토중</span>
								</c:if>
								<c:if test="${pay.LESSON_CHK eq 1 }">
<!-- 									<span class="label label-success">검토완료</span> -->
									<span>검토완료</span>
								</c:if>
							</td>
							<td>
								<c:if test="${pay.LESSON_CHK eq 0 }">
									<span> - </span>
								</c:if>
								<c:if test="${pay.LESSON_CHK eq 1 }">
									<a href="${pageContext.request.contextPath}/teacher/paycheck?lessonNo=${pay.LESSON_NO}"><span class="label label-success" >결제하기</span></a>
								</c:if>
<%-- 								<c:if test="${pay.PAY_STATE eq 1 }"> --%>
<!-- 									<span class="label label-success">결제완료</span> -->
<%-- 								</c:if> --%>
							</td>
						</tr>
			          </c:forEach>
					</tbody>
				</table>
			</div>
			
			<c:if test="${not empty list }">
			<c:import url="/WEB-INF/paging/teacher/lesson/paymentlistPaging.jsp"></c:import>
			</c:if>
		</div>
	</div>
</div>
</div>


<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>



