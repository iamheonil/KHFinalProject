<!-- 이서연 200827 -->
<!-- 선생님페이지 > 과외 연결 > 연결된 과외 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!--학생 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/student/stuHeader.jsp"></c:import>


<!-- 현위지 메뉴 -->
<style type="text/css">
.menu-item#four ul {
   height: 124px; 
}

#endlessonM{
  background: #eee;
}
#title{

	width: 100%;
	font-weight: bold;
}

#title a:last-child {
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
    font-weight: bold;
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

.table td:hover a {

	text-decoration: none;
	color: #262626;
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
	background-color: #ececec;
    border: 1px solid #777777;
	color: black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	padding: 3px;
	border-radius: 3px;
	cursor: pointer;
}


#StudentModal .modal-dialog{
	overflow-y:initail !important;
   width: 500px;
}
#StudentModal .modal-body{
   overflow-y:auto; 
   background: #f5f5f5;
}
#StudentModal .user-row {
    margin-bottom: 14px;
}

#StudentModal .user-row:last-child {
    margin-bottom: 0;
}

#StudentModal .dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

#StudentModal .dropdown-user:hover {
    cursor: pointer;
}

#StudentModal .table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

#StudentModal .table-user-information > tbody > tr:first-child {
    border-top: 0;
}


#StudentModal .table-user-information > tbody > tr > td {
    border-top: 0;
}
#StudentModal .toppad
{margin-top:20px;
}

#StudentModal .panel-body{
	text-align: center;
}
#stuInfoTabel{
	width: 60%;
	margin: 0 auto;
	text-align: left;
}
#lessonModal{
	padding: 0;
}

#lessonModal ..modal-dialog{
   width: 700px;
}


/* 과외 정보 모달 */
#lessonModal .text-white{
color:#fff;    
}
#lessonModal .bg-blue-500 {
    background-color: #17B794;
}
#lessonModal .container-overlap {
    position: relative;
    padding: 32px 16px 64px;
}
#lessonModal .card .card-divider {
    display: block;
    margin-top: 10px;
    margin-bottom: 10px;
    border: 1px solid rgba(0,0,0,.12);
}
#lessonModal .image-list>a {
    margin-left: -8px;
}
#lessonModal .image-list>a:first-child {
    margin-left: 0;
}
#lessonModal .thumb32 {
    width: 32px!important;
    height: 32px!important;
}
#lessonModal .text-white{
    color:#fff;    
}

#lessonModal .container-fluid,
#lessonModal .container-lg,
#lessonModal .container-md,
#lessonModal .container-sm,
#lessonModal .container-xs {
    padding: 8px;
    width: auto;
}

@media only screen and (min-width:480px) {
    .container-fluid,
    .container-lg,
    .container-md,
    .container-sm,
    .container-xs {
        padding: 16px;
}

@media only screen and (min-width:992px) {
    .container-fluid,
    .container-lg,
    .container-md,
    .container-sm,
    .container-xs {
        padding: 24px;
    }
}

#lessonModal .container-lg {
    max-width: 1200px;
}

#lessonModal .container-md {
    max-width: 992px;
}

#lessonModal .container-sm {
    max-width: 768px;
}

.container-xs {
    max-width: 480px;
}

@media only screen and (max-width:1199px) {
    input[type=text],
    input[type=email],
    input[type=search],
    input[type=password] {
        -webkit-appearance: none;
    }
    .container-unwrap {
        padding: 0;
    }
    .container-unwrap>.row {
        margin: 0;
    }
    .container-unwrap>.row>[class*=col-] {
        padding-left: 0;
        padding-right: 0;
    }
    .container-unwrap .card {
        margin-bottom: 0;
    }
}

.container-overlap {
    position: relative;
    padding: 32px 16px 64px;
}

.container-overlap+.container-fluid,
.container-overlap+.container-lg,
.container-overlap+.container-md,
.container-overlap+.container-sm,
.container-overlap+.container-xs {
    padding-top: 0;
    margin-top: -32px;
}

.container-overlap+.container-fluid .push-down,
.container-overlap+.container-lg .push-down,
.container-overlap+.container-md .push-down,
.container-overlap+.container-sm .push-down,
.container-overlap+.container-xs .push-down {
    display: block;
    height: 48px;
}
.bg-indigo-500 {
    background-color: #3f51b5;
}
.container-overlap {
    position: relative;
    padding: 32px 16px 64px;
}
.fw {
    width: 100%!important;
}
.thumb64 {
    width: 64px!important;
    height: 64px!important;
}
.thumb48 {
    width: 48px!important;
    height: 48px!important;
}

#lessonModal .card {
    position: relative;
    border-radius: 3px;
    background-color: #fff;
    color: #4F5256;
    border: 1px solid rgba(0, 0, 0, .12);
    margin-bottom: 8px
}

@media only screen and (min-width:480px) {
    .card {
        margin-bottom: 16px
    }
}

@media only screen and (min-width:992px) {
    .card {
        margin-bottom: 24px
    }
}

#lessonModal .card .card-heading {
    padding: 16px;
    margin: 0
}

#lessonModal .card .card-heading>.card-title {
    margin: 0;
    font-size: 18px
}

#lessonModal .card .card-heading>.card-icon {
    float: right;
    color: rgba(255, 255, 255, .87);
    font-size: 20px
}

#lessonModal .card .card-heading>small {
    color: rgba(162, 162, 162, .92);
    letter-spacing: .01em
}

#lessonModal .card .card-body {
    position: relative;
    padding: 16px
}

#lessonModal .card .card-footer {
    padding: 16px;
    border-top: 1px solid rgba(162, 162, 162, .12)
}

#lessonModal .card .card-item {
    position: relative;
    display: block;
    min-height: 120px
}

#lessonModal .card .card-item>.card-item-text {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: rgba(0, 0, 0, .35);
    margin: 0;
    color: #fff;
    padding: 8px
}

#lessonModal .card .card-item>.card-item-text a {
    color: inherit
}

#lessonModal .card .card-item>.card-item-image {
    display: block;
    width: 100%;
    height: 190px;
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover
}

#lessonModal .card .card-item.card-media {
    min-height: 280px;
    background-repeat: repeat;
    background-position: 50% 50%;
    background-attachment: scroll;
    background-origin: padding-box
}

#lessonModal .card .card-item.card-media .card-media-quote {
    padding: 16px;;
    font-size: 35px;
}

@media only screen and (min-width:768px) {
    .card .card-item.card-media .card-media-quote {
        font-size: 45px;
    }
}

#lessonModal .card .card-item.card-media .card-media-quote>a {
    color: inherit;
    text-decoration: none;
}

#lessonModal .card .card-item.card-media .card-media-quote:before {
    content: '“';
    display: block;
    font-size: 2em;
    line-height: 1;
    margin-top: .25em;
}

.btn-label:after,
.c-radio span:before,
.container-overlap:before,
.note-area.note-area-margin:after,
.switch span:after {
    content: "";
}

#lessonModal .card.card-transparent {
    background-color: transparent;
    border: 0;
    -webkit-box-shadow: 0 0 0 #000;
    box-shadow: 0 0 0 #000;
}

#lessonModal .card .card-offset {
    position: relative;
    padding-bottom: 36px;
    z-index: 10;
}

#lessonModal .card .card-offset>.card-offset-item {
    position: absolute;
    top: -24px;
    left: 15px;
    right: 15px;
}

#lessonModal .card .card-toolbar {
    position: relative;
    width: 100%;
    min-height: 64px;
    font-size: 18px;
    line-height: 64px;
    padding-left: 22px;
    z-index: 2;
}

#lessonModal .card .card-subheader {
    padding: 16px 0 16px 16px;
    line-height: .75em;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: .01em;
    color: rgba(0, 0, 0, .54);
}

#lessonModal .card .card-subheader+.mda-list>.mda-list-item:first-child>.mda-list-item-text,
#lessonModal .card>.btn {
    padding-top: 16px;
}

#lessonModal .card .card-subheader+.mda-list>.mda-list-item:first-child>.mda-list-item-icon,
#lessonModal .card .card-subheader+.mda-list>.mda-list-item:first-child>.mda-list-item-img,
#lessonModal .card .card-subheader+.mda-list>.mda-list-item:first-child>.mda-list-item-initial {
    margin-top: 10px;
}

#lessonModal .card .card-divider {
    display: block;
    margin-top: 10px;
    margin-bottom: 10px;
    border: 1px solid rgba(0, 0, 0, .12);
}

#lessonModal .card .card-divider+.card-offset {
    margin-top: -10px;
}

#lessonModal .card>.ui-datepicker,
#lessonModal .card>.ui-datepicker-responsive>.ui-datepicker {
    width: 100%;
    -webkit-box-shadow: 0 0 0 #000;
    box-shadow: 0 0 0 #000;
    margin: 0;
}

#lessonModal .card .editable-wrap,
#lessonModal .card>.ui-datepicker-responsive>.ui-datepicker>table,
#lessonModal .card>.ui-datepicker>table {
    width: 100%;
}

#lessonModal .card>.list-group>.list-group-item {
    border-left: 0;
    border-right: 0;
}

#lessonModal .card>.list-group>.list-group-item:first-child {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}

#lessonModal .card>.list-group>.list-group-item:last-child {
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
    border-bottom: 0;
}

#lessonModal .card>.table,
#lessonModal .card>.table-responsive>.table {
    margin-bottom: 0;
}

#lessonModal .card>.table-responsive {
    border: 0;
}

#lessonModal .card>.btn {
    border-radius: 0;
    width: 100%;
    padding-bottom: 16px;
    text-align: center;
}

#lessonModal .card>.btn:last-child {
    border-bottom-right-radius: 2px;
    border-bottom-left-radius: 2px;
}

#lessonModal .card.card-map {
    min-height: 280px;
}

#lessonModal .modal.modal-left .modal-dialog>.modal-content,
#lessonModal .modal.modal-right .modal-dialog>.modal-content {
    min-height: 100%;
}

#lessonModal .card.card-map .card-footer {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    border: 0;
    background-color: transparent;
}


#lessonModal .mda-list {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

#lessonModal .mda-list>.mda-list-item {
    padding: 0 22px;
}

#lessonModal .mda-list>.mda-list-item:after,
.mda-list>.mda-list-item:before {
    content: " ";
    display: table;
}

</style>


<script type="text/javascript">

<!-- 자료실 버튼 눌렀을 때 -->
function webshareClick(CONN_LESSON_NO){
	
	var no = CONN_LESSON_NO;
	
	$(location).attr("href", "${pageContext.request.contextPath}/teacher/webshare?no="+no);
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

function lessonEnd(connLessonNo){
	
	var chk = confirm("학생과의 과외를 끝내시겠습니까?");
	
	if(chk == true){
		var url = "<%=request.getContextPath() %>/teacher/lessonend";
		
		$.ajax({
			type : "POST",
			url: url,
			data: {connLessonNo : connLessonNo},
			success : function(result) {
				
				if( result = 1 ){
					location.reload();	
				}
			},
			error : function(){
				alert("ajax 실패")
			}
			
		})
		
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

</script>
<!-- 과외정보모달 -->
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


<div id="title">과외 연결
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">수강완료 과외</a>
</div>

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
	                                    <th style="width: 10%">과외번호</th>
	                                    <th style="width: 20%">과외명</th>
	                                    <th style="width: 15%">선생님</th>
	                                    <th style="width: 15%">과목</th>
	                                    <th style="width: 15%">지역</th>
	                                    <th style="width: 15%">후기작성</th>
	                                </tr>
	                            </thead>
	                            
	                            <tbody>
	                               	<c:forEach items="${list }" var="list" >
										<tr>
											<td>${list.LESSON_NO}</td>
											<td><a href="#"  onclick="lessonModal(${list.LESSON_NO});" title="과외 상세 보기">${list.LESSON_TITLE}</a></td>
											<td><a href="#" onclick="StudentModal(${list.TEACHER });" title="선생님 프로필 보기">${list.USER_ID}</a></td>
											<td>${list.LESSON_SUBJECT}</td>
											<td>${list.LESSON_LOC}</td>
											<td><a href="${pageContext.request.contextPath}/board/review"><button>작성하기</button></a></td>
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





<!-- 학생 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/student/stuFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuFooter2.jsp"></c:import>


