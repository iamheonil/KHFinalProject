<!-- 20200907 이인주 : user > find_student > datail -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb3ded0da7c6502b3c00a1cd11c62c07"></script>

<style type="text/css">
@import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');

.banner h1,.banner h2{
	font-family: 'NanumSquareRound', sans-serif !important;
    font-weight: bolder !important;
}
.banner h1{
margin-top:20px;
}

.banner{
	margin-top:120px;
}

</style>

<style type="text/css">
body{
    margin-top:20px;
    background-color: #edf0f0;    
}
.btn-primary, 
.btn-primary:hover, 
.btn-primary:focus, 
.btn-primary:active, 
.btn-primary.active, 
.btn-primary.focus, 
.btn-primary:active, 
.btn-primary:focus, 
.btn-primary:hover, 
.open>.dropdown-toggle.btn-primary {
    background-color: #3bc0c3;
    border: 1px solid #3bc0c3;
}
.p-t-10 {
/*     padding-top: 10px !important; */
}
.media-main a.pull-left {
    width: 100px;
}
.thumb-lg {
    height: 84px;
    width: 84px;
}
.media-main .info {
    overflow: hidden;
    color: #000;
}
.media-main .info h4 {
    padding-top: 10px;
    margin-bottom: 5px;
}
.social-links li a {
    background: #EFF0F4;
    width: 30px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    display: inline-block;
    border-radius: 50%;
    -webkit-border-radius: 50%;
    color: #7A7676;
}

.panel{
	margin-left : 5px;
	margin-right : 5px;
	border: 1px solid #ccc;
	border-radius: 10px;
	height: 230px;
	width: 520px;
}

#findtitle{
	width: auto;
	text-align: center;
	line-height: 4;
	font-weight: bold;
}

#noneboard{
	color: #17B794;
	font-weight: bold;
	text-align: center;
}

#noneboarder{
	height: 250px;
	border: 2px solid #999;
	border-radius: 10px;
	vertical-align: middle;
	
	color: #17B794;
	font-weight: bold;
	text-align: center;
	font-size: large;
	line-height: 14;
}

.txt_line_content { 
	/* 한 줄 자르기 */
	display: inline-block;
	width: 470px; 
	white-space: nowrap; 
	overflow: hidden; 
	text-overflow: ellipsis;
	  
	/* 여러 줄 자르기 추가 스타일 */
	white-space: normal; 
	line-height: 1.4; 
	height: 3.6em; 
	text-align: left; 
	word-wrap: break-word; 
	display: -webkit-box; 
	-webkit-line-clamp: 3; 
	-webkit-box-orient: vertical;
	
}

.txt_line_title { 
	width:470px; 
	padding:0; 
	overflow:hidden; 
	text-overflow:ellipsis;
	white-space:nowrap; 
	font-size: 15px;
	font-weight: bold;
}

#writebtn{
	color: white;
	text-decoration: none;
}

#writebtn:hover{
	color: tomato;
	text-decoration: none;
}

#detailboard{
	width: 1140px;
	height: auto;
	margin: 0 auto;
}

.floating { 
	position: fixed;
	right: 60%;
	top: 600px;
	margin-right: -720px;
	text-align: center;
	width: 300px;
	height :auto;
	
	border: 1px solid #ccc;
	border-radius: 10%;
	padding: 10px;
}

#MessageSt{
	font-size: 27px;
}
</style>

<script type="text/javascript">
$(function(){
	 $("a[data-toggle='tooltip']").tooltip();
});

</script>

<!-- ajax -->
<script type="text/javascript">
function XMLDeleteClick(findStuNo){
	var chk = confirm("삭제 하시겠습니까?");
	
	if(chk == true){
		var url = "<%=request.getContextPath()%>/lesson/findStu/delete";
		
		$.ajax({
			type : "POST",
			url: url,
			data : { findStuNo: findStuNo },
			success : function(result) {
				if (result == "") {
					alert("삭제되었습니다");
					location.reload();
				}else if(result != ""){
					alert(result);
				}
			},
			error : function(){
				alert("ajax 실패")
			}
		});
	}
	
}
</script>

<!-- 지도 api -->
<script type="text/javascript">
$(document).ready(function(){
	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	
// 	var options = { //지도를 생성할 때 필요한 기본 옵션
// 			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도 중심 좌표
// 		level: 3 //지도의 레벨(확대, 축소 정도)
// 	};
	
	if(${findStudentOne.FIND_STU_LOC == '무관' }){
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.49918068071734, 127.03453719246758), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};	
	}else if (${findStudentOne.FIND_STU_LOC == '서울' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.56682420267543, 126.978652258823), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '경기' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.74758417314842, 127.07161930245083), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '부산' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(35.17973973483032, 129.0750678885004), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '대구' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng( 35.87138338827759, 128.60180776829148), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '인천' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.45602927841067, 126.7052721005639), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '대전' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(36.3614132220919, 127.38501929723603 ), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '울산' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(35.53948464172323, 129.31146521625075), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '광주' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(35.16010874369142, 126.8516491542269), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '세종' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(36.480078831893714, 127.28921490454427 ), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '강원' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.885320852157896, 127.72982555144148), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '경북' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(36.576001575294924, 128.50576807876243), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '경남' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(35.237677583297774,  128.69194321409773), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '충북' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(36.63532357728611, 127.49143921673218), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '충남' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(36.65883058654879, 126.67276947738326), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '전북' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(35.82018869322392, 127.10898776739516), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '전남' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(34.81606814290444, 126.46278077345552), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}else if (${findStudentOne.FIND_STU_LOC == '제주' }) {
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(33.488906590123094, 126.49821844632523), //지도 중심 좌표
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
	}
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

});

</script>

<!-- css 끝------------------------ -->
<!-- ---- ------------------------ -->
<!-- 검색창 시작 ------------------------ -->

<body>

	<div class="gtco-loader"></div>

	<div id="page">
	<!-- nav include  -->
		<header id="gtco_header" class="gtco-cover gtco-cover-xs gtco-inner"
			role="banner">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-12 col-md-offset-0 text-left">
						<div class="display-t">
							<div class="display-tc">
								<div class="row">
									<div class="col-md-8 animate-box">
										<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
											
										<div class="row padding-horizontal-md pull-left banner">
											<div class="row margin-top-xs text title title-xxl text-bold text-white">
												<p><h1>학생 찾기</h1></p>
											</div>
											<br>
											<div class="row margin-top-xl text title title-xl text-bold text-white pull-left">
												<p><h2>과외 조건에 맞는 학생을 검색할 수 있습니다.</h2></p><br>
												<c:if test="${loginUser.userActor eq 2 }">
													<p><h2>학생이라면?<a id="writebtn" href="${pageContext.request.contextPath}/student/findStu/write">글쓰기</a></h2></p>
												</c:if>
											</div>
											
										
										</div>	
										<div class="container bootstrap snippets bootdey banner">
											<div class="lc-block col-md-4  toggled pull-right" id="l-login">
												<div class="lcb-float">
													<i class="fa fa-users"></i>
												</div>
												<div class="form-group">
													<form action="${pageContext.request.contextPath}/lesson/findStu/search" method="post">
													
														        <select class="form-control" name="findStuLoc" id="findStuLoc">
																		<option selected value="무관">- 지역 선택 -</option>
																		<option value="서울">서울</option>
																		<option value="경기">경기</option>
																		<option value="부산">부산</option>
																		<option value="대구">대구</option>
																		<option value="인천">인천</option>
																		<option value="대전">대전</option>
																		<option value="울산">울산</option>
																		<option value="광주">광주</option>
																		<option value="세종">세종</option>
																		<option value="경남">강원</option>
																		<option value="경북">경북</option>
																		<option value="전남">경남</option>
																		<option value="전북">충북</option>
																		<option value="광주">충남</option>
																		<option value="부산">전북</option>
																		<option value="제주">전남</option>
																		<option value="제주">제주</option>
														        </select>
													
													       <select class="form-control" name="findStuSubject" id="findStuSubject">
																<option selected value="무관" >- 과목 선택 -</option>
																<option value="수학">수학</option>
																<option value="국어">국어</option>
																<option value="영어">영어</option>
																<option value="과학">과학</option>
																<option value="논술">논술</option>
																<option value="사회">사회</option>
																<option value="예체능">예체능</option>
																<option value="제2외국어">제2외국어</option>
																<option value="컴퓨터(IT)">컴퓨터(IT)</option>
																<option value="자격증">자격증</option>
																<option value="대학전공">대학전공</option>
																<option value="기타">기타</option>
													       	</select>
													
															<input type="text" class="form-control" id="keyword" name="keyword" placeholder="키워드를 작성해주세요">
														</form>
													</div>
															<div class="clearfix"></div>
															
														<button type="button" class="btn btn-block btn-primary btn-float m-t-25" style="color: white;">검색</button>
													
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		
		<!-- 검색창 끝------------------------ -->
		<!-- ---- ------------------------ -->
		<!-- 결과 시작 ------------------------ -->

		<h4 id="findtitle">FIND STUDENT No.${findStudentOne.FIND_STU_NO } DETAIL</h4>
		
		<div id="detailboard">
		
		<h3>${findStudentOne.FIND_STU_TITLE }</h3><br>
		
		
		<p>${findStudentOne.FIND_STU_CONTENT }</p><br>
		
		
		지역 : ${findStudentOne.FIND_STU_LOC }
		<!-- 지도영역 -->
		<div id="map" style="width:500px;height:400px;"></div><br>
		<h6>※상세한 과외위치는 글 작성자와 채팅을 통하여 결정하세요</h6>
		
		<!-- 리모콘 -->
		<div class="floating">
		작성자 : ${findStudentOne.USER_ID }<br>
		과목 : ${findStudentOne.FIND_STU_SUBJECT }<br>
		날짜 : ${findStudentOne.FIND_STU_DATE }<br>
		
		<c:if test="${findStudentOne.FIND_STU_STATE eq 0}">
       		<p class="text-muted">상태 : 모집</p>
        </c:if>
        
        <c:if test="${findStudentOne.FIND_STU_STATE eq 1}">
       		<p class="text-muted">상태 : 마감</p>
        </c:if>
		                            
		<div class="pull-right btn-group-sm">
			<c:if test="${loginUser.userNo ne  findStudentOne.USER_NO}">
				<a href="#" id="MessageSt" data-placement="top" data-toggle="tooltip" class="tooltips" data-original-title="Message">
					<i class="fa fa-envelope-o"></i>
				</a>
			</c:if>
			
<%--        		<c:if test="${loginUser.userNo eq  findStudentOne.USER_NO}"> --%>
<%--     		   <a href="<%=request.getContextPath()%>/" class="btn btn-success tooltips" data-placement="top" data-toggle="tooltip" data-original-title="Edit"> --%>
<!--                    <i class="fa fa-pencil"></i> -->
<!-- 	           </a> -->
<%-- 	           <a onclick=" XMLDeleteClick(${findstu.FIND_STU_NO})" class="btn btn-danger tooltips" data-placement="top" data-toggle="tooltip" data-original-title="Delete"> --%>
<!-- 	               <i class="fa fa-close"></i> -->

<!-- 	           </a> -->
<%--            </c:if> --%>
       </div>
		 
		 
		 
		</div>

		</div>
		
</div>
	
	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
	<!-- countTo -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.countTo.js"></script>
	<!-- Carousel -->
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/magnific-popup-options.js"></script>

	<!-- Main -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>
</html>

<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>