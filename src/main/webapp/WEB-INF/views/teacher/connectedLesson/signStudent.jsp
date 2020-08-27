<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
.listBox{
	width: 100%;
	text-align: center;
}

.list_title{
	text-align: left;
	font-family: 'Segoe UI',Arial,sans-serif";
	font-size: 12px;
	margin: 20px 0;
}
/* USER LIST TABLE */
.user-list tbody td > img {
    position: relative;
	max-width: 50px;
	float: left;
	margin-right: 15px;
}
.user-list tbody td .user-link {
	display: block;
	font-size: 1.25em;
	padding-top: 3px;
	margin-left: 60px;
}
.user-list tbody td .user-subhead {
	font-size: 0.875em;
	font-style: italic;
}

/* TABLES */
.table {
    border-collapse: separate;
}
.table-hover > tbody > tr:hover > td,
.table-hover > tbody > tr:hover > th {
	background-color: #eee;
}
.table thead > tr > th {
	border-bottom: 1px solid #C2C2C2;
	padding-bottom: 0;
}
.table tbody > tr > td {
	font-size: 0.875em;
	background: #f5f5f5;
	border-top: 10px solid #fff;
	vertical-align: middle;
	padding: 12px 8px;
}
.table tbody > tr > td:first-child,
.table thead > tr > th:first-child {
	padding-left: 20px;
}
.table thead > tr > th span {
	border-bottom: 2px solid #C2C2C2;
	display: inline-block;
	padding: 0 5px;
	padding-bottom: 5px;
	font-weight: normal;
}
.table thead > tr > th > a span {
	color: #344644;
}
.table thead > tr > th > a span:after {
	content: "\f0dc";
	font-family: FontAwesome;
	font-style: normal;
	font-weight: normal;
	text-decoration: inherit;
	margin-left: 5px;
	font-size: 0.75em;
}
.table thead > tr > th > a.asc span:after {
	content: "\f0dd";
}
.table thead > tr > th > a.desc span:after {
	content: "\f0de";
}
.table thead > tr > th > a:hover span {
	text-decoration: none;
	color: #2bb6a3;
	border-color: #2bb6a3;
}
.table.table-hover tbody > tr > td {
	-webkit-transition: background-color 0.15s ease-in-out 0s;
	transition: background-color 0.15s ease-in-out 0s;
}
.table tbody tr td .call-type {
	display: block;
	font-size: 0.75em;
	text-align: center;
}
.table tbody tr td .first-line {
	line-height: 1.5;
	font-weight: 400;
	font-size: 1.125em;
}
.table tbody tr td .first-line span {
	font-size: 0.875em;
	color: #969696;
	font-weight: 300;
}
.table tbody tr td .second-line {
	font-size: 0.875em;
	line-height: 1.2;
}
.table a.table-link {
	margin: 0 5px;
	font-size: 1.125em;
}


.table a.table-link.success {
	text-decoration: none;
	color: #4bb7a4;
}
.table a.table-link.success:hover {
	text-decoration: none;
	color: #2aa493;
}
.table a.table-link.danger {
	color: #fe635f;
}
.table a.table-link.danger:hover {
	color: #dd504c;
}

.table-products tbody > tr > td {
	background: none;
	border: none;
	border-bottom: 1px solid #ebebeb;
	-webkit-transition: background-color 0.15s ease-in-out 0s;
	transition: background-color 0.15s ease-in-out 0s;
	position: relative;
}
.table-products tbody > tr:hover > td {
	text-decoration: none;
	background-color: #f6f6f6;
}
.table-products .name {
	display: block;
	font-weight: 600;
	padding-bottom: 7px;
}
.table-products .price {
	display: block;
	text-decoration: none;
	width: 50%;
	float: left;
	font-size: 0.875em;
}
.table-products .price > i {
	color: #8dc859;
}
.table-products .warranty {
	display: block;
	text-decoration: none;
	width: 50%;
	float: left;
	font-size: 0.875em;
}
.table-products .warranty > i {
	color: #f1c40f;
}
.table tbody > tr.table-line-fb > td {
	background-color: #9daccb;
	color: #262525;
}
.table tbody > tr.table-line-twitter > td {
	background-color: #9fccff;
	color: #262525;
}
.table tbody > tr.table-line-plus > td {
	background-color: #eea59c;
	color: #262525;
}
.table-stats .status-social-icon {
	font-size: 1.9em;
	vertical-align: bottom;
}
.table-stats .table-line-fb .status-social-icon {
	color: #556484;
}
.table-stats .table-line-twitter .status-social-icon {
	color: #5885b8;
}
.table-stats .table-line-plus .status-social-icon {
	color: #a75d54;
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


</script>
	<div class="listBox">
			<div class="list_title">
				과외 연결 > 학생 신청 내역
			</div>
			
			<div class="row">
	<div class="col-lg-12">
		<div class="main-box clearfix">
			<div class="table-responsive">
				<table class="table user-list">
					<thead>
						<tr>
							<th class="text-center" style="width: 15%;"><span>신청자</span></th>
							<th class="text-center" style="width: 30%;"><span>과외명</span></th>
							<th class="text-center" style="width: 15;"><span>과목</span></th>
							<th class="text-center"><span>인원</span></th>
							<th class="text-center" style="width: 10%;"><span>신청 날짜</span></th>
							<th class="text-center"><span>승인</span></th>
						</tr>
					</thead>
					<tbody>
                       <c:forEach items="${list }" var="stu">
						<tr>
							<td>
								<a href="#">${stu.USER_NAME }</a>
							</td>
							<td>
								<a href="#">${stu.LESSON_TITLE }</a>
							</td>
							<td>
								${stu.LESSON_SUBJECT }
							</td>
							<td>
								<c:if test="${stu.MAX_PEOPLE eq 1 }">
									<span class="label label-warning">개인</span>
								</c:if>
								<c:if test="${stu.MAX_PEOPLE gt 1 }">
									<span class="label label-success">그룹</span>
								</c:if>
							</td>
							<td>
								${stu.LEG_DATE }
							</td>
							<td style="width: 20%;">
								<a href="javascript:void(0)" onclick="connectStu(${stu.CONN_LESSON_NO});" class="table-link success">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-check fa-stack-1x fa-inverse"></i>
									</span>
								</a>
								<a href="#" class="table-link danger" onclick="rejectStu(${stu.CONN_LESSON_NO});" >
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
									</span>
								</a>
							</td>
						</tr>
			          </c:forEach>
					</tbody>
				</table>
			</div>
			<c:if test="${not empty list }">
			<c:import url="/WEB-INF/paging/teacher/connectLesson/signStuPaging.jsp"></c:import>
			</c:if>
		</div>
	</div>
</div>
		</div>


<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>



