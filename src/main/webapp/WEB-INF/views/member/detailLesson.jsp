<%@page import="com.privateplaylist.www.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layout/main/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/header.jsp"></jsp:include>    --%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lessonDetail.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>







<body>

	<div class="gtco-loader"></div>


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
									<link
										href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
										rel="stylesheet">

									<div class="row padding-horizontal-md pull-left banner">
										<div
											class="row margin-top-xs text title title-xxl text-bold text-white">
											<p>
											<h1>과외 찾기</h1>
											</p>
										</div>
										<br>
										<div
											class="row margin-top-xl text title title-xl text-bold text-white pull-left">
											<p>
											<h2>조건에 맞는 과외를 검색할수 있습니다</h2>
											</p>
										</div>

									</div>
									<div class="container bootstrap snippets bootdey banner">
										<div class="lc-block col-md-6  toggled pull-right"
											id="l-login">

											<div class="form-group">
												<form
													action="${pageContext.request.contextPath}/lesson/findlesson"
													method="post" class="form-horizontal">

													<div class="form-group option">
														<label class="col-sm-2 control-label">지역</label>
														<div class="col-sm-10">
															<select class="form-control" name="Loc" id="Loc">
																<option value="무관"
																	<c:if test="${option.Loc eq '무관'} "> selected="selected"</c:if>>-전체-</option>
																<option value="서울"
																	<c:if test="${option.Loc eq '서울' }"> selected="selected"</c:if>>서울</option>
																<option value="부산"
																	<c:if test="${option.Loc eq '부산' }"> selected="selected"</c:if>>부산</option>
																<option value="대구"
																	<c:if test="${option.Loc eq '대구' }"> selected="selected"</c:if>>대구</option>
																<option value="인천"
																	<c:if test="${option.Loc eq '인천' }"> selected="selected"</c:if>>인천</option>
																<option value="대전"
																	<c:if test="${option.Loc eq '대전' }"> selected="selected"</c:if>>대전</option>
																<option value="울산"
																	<c:if test="${option.Loc eq '울산' }"> selected="selected"</c:if>>울산</option>
																<option value="광주"
																	<c:if test="${option.Loc eq '광주' }"> selected="selected"</c:if>>광주</option>
																<option value="세종"
																	<c:if test="${option.Loc eq '세종' }"> selected="selected"</c:if>>세종</option>
																<option value="강원"
																	<c:if test="${option.Loc eq '경남' }"> selected="selected"</c:if>>강원</option>
																<option value="경기"
																	<c:if test="${option.Loc eq '경기' }"> selected="selected"</c:if>>경기</option>
																<option value="경북"
																	<c:if test="${option.Loc eq '경북' }"> selected="selected"</c:if>>경북</option>
																<option value="경남"
																	<c:if test="${option.Loc eq '전남' }"> selected="selected"</c:if>>경남</option>
																<option value="충북"
																	<c:if test="${option.Loc eq '충북' }"> selected="selected"</c:if>>충북</option>
																<option value="충남"
																	<c:if test="${option.Loc eq '충남' }"> selected="selected"</c:if>>충남</option>
																<option value="전북"
																	<c:if test="${option.Loc eq '전북' }"> selected="selected"</c:if>>전북</option>
																<option value="전남"
																	<c:if test="${option.Loc eq '전남' }"> selected="selected"</c:if>>전남</option>
																<option value="제주"
																	<c:if test="${option.Loc eq '제주' }"> selected="selected"</c:if>>제주</option>
															</select>
														</div>
													</div>

													<div class="form-group option" style="margin-left: 70px;">
														<label class="col-sm-2 control-label">선생님 성별</label>
														<div class="col-sm-10">
															<select class="form-control" name="Sex" id="findStuLoc">
																<option
																	<c:if test="${option.Sex eq '무관' }"> selected="selected"</c:if>
																	value="무관">-전체-</option>
																<option
																	<c:if test="${option.Sex eq 'w' }"> selected="selected"</c:if>
																	value="w">여자</option>
																<option
																	<c:if test="${option.Sex eq 'm' }"> selected="selected"</c:if>
																	value="m">남자</option>

															</select>
														</div>
													</div>


													<div class="form-group option">
														<label class="col-sm-2 control-label">나이</label>
														<div class="col-sm-10">
															<select class="form-control" name="Age" id="findStuLoc">
																<option
																	<c:if test="${option.Age eq '무관' }"> selected="selected"</c:if>
																	value="무관">-전체-</option>
																<option
																	<c:if test="${option.Age eq '초등' }"> selected="selected"</c:if>
																	value="초등">초등</option>
																<option
																	<c:if test="${option.Age eq '중등' }"> selected="selected"</c:if>
																	value="중등">중등</option>
																<option
																	<c:if test="${option.Age eq '고등' }"> selected="selected"</c:if>
																	value="고등">고등</option>
																<option
																	<c:if test="${option.Age eq '20대' }"> selected="selected"</c:if>
																	value="20대">20대</option>
																<option
																	<c:if test="${option.Age eq '30대' }"> selected="selected"</c:if>
																	value="30대">30대</option>
																<option
																	<c:if test="${option.Age eq '40대' }"> selected="selected"</c:if>
																	value="40대">40대</option>


															</select>
														</div>
													</div>

													<div class="form-group option" style="margin-left: 70px;">
														<label class="col-sm-2 control-label">과목</label>
														<div class="col-sm-10">
															<select class="form-control" name="Sub" id="findStuLoc">
																<option
																	<c:if test="${option.Sub eq '무관' }"> selected="selected"</c:if>
																	value="무관">-전체-</option>
																<option
																	<c:if test="${option.Sub eq '수학' }"> selected="selected"</c:if>
																	value="수학">수학</option>
																<option
																	<c:if test="${option.Sub eq '국어' }"> selected="selected"</c:if>
																	value="국어">국어</option>
																<option
																	<c:if test="${option.Sub eq '영어' }"> selected="selected"</c:if>
																	value="영어">영어</option>
																<option
																	<c:if test="${option.Sub eq '과학' }"> selected="selected"</c:if>
																	value="과학">과학</option>
																<option
																	<c:if test="${option.Sub eq '논술' }"> selected="selected"</c:if>
																	value="논술">논술</option>
																<option
																	<c:if test="${option.Sub eq '사회' }"> selected="selected"</c:if>
																	value="사회">사회</option>
																<option
																	<c:if test="${option.Sub eq '예체능' }"> selected="selected"</c:if>
																	value="예체능">예체능</option>
																<option
																	<c:if test="${option.Sub eq '제2외국어' }"> selected="selected"</c:if>
																	value="제2외국어">제2외국어</option>
																<option
																	<c:if test="${option.Sub eq '컴퓨터(IT)' }"> selected="selected"</c:if>
																	value="컴퓨터(IT)">컴퓨터(IT)</option>
																<option
																	<c:if test="${option.Sub eq '자격증' }"> selected="selected"</c:if>
																	value="자격증">자격증</option>
																<option
																	<c:if test="${option.Sub eq '대학전공' }"> selected="selected"</c:if>
																	value="대학전공">대학전공</option>
																<option
																	<c:if test="${option.Sub eq '기타' }"> selected="selected"</c:if>
																	value="기타">기타</option>

															</select>
														</div>
													</div>

													<div class="form-group option">
														<label class="col-sm-2 control-label">금액</label>
														<div class="col-sm-10">
															<select class="form-control" name="Pri" id="findStuLoc">
																<option
																	<c:if test="${option.Pri eq '무관' }"> selected="selected"</c:if>
																	value="무관">-전체-</option>
																<option
																	<c:if test="${option.Pri eq '200000' }"> selected="selected"</c:if>
																	value="200000">20만원 이하</option>
																<option
																	<c:if test="${option.Pri eq '300000' }"> selected="selected"</c:if>
																	value="300000">30만원 이하</option>
																<option
																	<c:if test="${option.Pri eq '400000' }"> selected="selected"</c:if>
																	value="400000">40만원 이하</option>
																<option
																	<c:if test="${option.Pri eq '500000' }"> selected="selected"</c:if>
																	value="500000">50만원 이하</option>
																<option
																	<c:if test="${option.Pri eq '600000' }"> selected="selected"</c:if>
																	value="600000">60만원 이하</option>
																<option
																	<c:if test="${option.Pri eq '700000' }"> selected="selected"</c:if>
																	value="700000">70만원 이하</option>
																<option
																	<c:if test="${option.Pri eq '800000' }"> selected="selected"</c:if>
																	value="800000">80만원 이하</option>


															</select>
														</div>
													</div>

													<div class="form-group option" style="margin-left: 70px;">
														<label class="col-sm-2 control-label">그룹과외 or
															일대일과외</label>
														<div class="col-sm-10">
															<select class="form-control" name="Cnt" id="findStuLoc">
																<option
																	<c:if test="${option.Cnt eq '무관' }"> selected="selected"</c:if>
																	value="무관">-전체-</option>
																<option
																	<c:if test="${option.Cnt eq '그룹' }"> selected="selected"</c:if>
																	value="그룹">그룹</option>
																<option
																	<c:if test="${option.Cnt eq '일대일' }"> selected="selected"</c:if>
																	value="일대일">일대일</option>

															</select>
														</div>
													</div>




													<div class="clearfix"></div>
													<button class="btn btn-block btn-primary btn-float m-t-25"
														style="color: white;">조건 검색</button>
												</form>
											</div>

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
	<!-- END #gtco-header -->







	<div class="gtco-services gtco-section">
		<div class="gtco-container">


			<link
				href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
				rel="stylesheet">
			<div class="container">
				<div id="user-profile-2" class="user-profile">
					<div class="tabbable">
						<ul class="nav nav-tabs padding-18">
							<li class="active"><a data-toggle="tab" href="#home"> <i
									class="green ace-icon fa fa-user bigger-120"></i> 프로필
							</a></li>



							<li><a data-toggle="tab" href="#friends"> <i
									class="blue ace-icon fa fa-users bigger-120"></i>  선생님 후기
							</a></li>

							<li><a data-toggle="tab" href="#pictures"> <i
									class="pink ace-icon fa fa-picture-o bigger-120"></i> 사진
							</a></li>
						</ul>

						<div class="tab-content no-border padding-24">
							<div id="home" class="tab-pane in active">
								<div class="row">
									<div class="col-xs-12 col-sm-3 center">
										<c:if test="${teacher eq null }">
											<!-- 프로필 사진이 없으면 기본사진  -->
											<span class="profile-picture"> <img
												class="editable img-responsive" alt=" Avatar" id="avatar2"
												src="${pageContext.request.contextPath}/resources/images/profile.png">
											</span>
										</c:if>
										<c:if test="${teacher ne null }">
											<!-- 프로필 사진이 있으면 해당사진 보이기  -->
											<span class="profile-picture"> <img
												class="editable img-responsive" alt=" Avatar" id="avatar2"
												src="${pageContext.request.contextPath}/resources/upload/${teacher.TCH_FILE_RENAME}">
											</span>
										</c:if>


										<div class="space space-4"></div>

										<a href="javascript:void(0);"
											onclick="insertWish(${findlessonAndTeacherList.LESSON_NO});"
											class="btn btn-sm btn-block btn-success"> <i
											class="ace-icon fa fa-plus-circle bigger-120"></i> <span
											class="bigger-110">찜하기</span>
										</a> <a href="javascript:void(0);" onclick="gochatRoom();"
											class="btn btn-sm btn-block btn-primary"> <i
											class="ace-icon fa fa-envelope-o bigger-110"></i> <span
											class="bigger-110">문의하기</span>
										</a> <a href="javascript:void(0);" onclick="insertConnect(${findlessonAndTeacherList.LESSON_NO},${findlessonAndTeacherList.USER_NO});"
											class="btn btn-sm btn-block btn-info"> <i
											class="ace-icon fa  fa-paper-plane-o bigger-110"></i> <span
											class="bigger-110">신청하기</span>
										</a>
									</div>
									<!-- /.col -->


									<div class="col-xs-12 col-sm-9">
										<h4 class="blue">
											<span class="middle">${findlessonAndTeacherList.USER_ID}</span>
											<span class="label label-purple arrowed-in-right"> <i
												class="ace-icon fa fa-circle smaller-80 align-middle"></i>
												online
											</span>
										</h4>

										<div class="profile-user-info">
											<div class="profile-info-row">
												<div class="profile-info-name">과목</div>

												<div class="profile-info-value">
													<span>${findlessonAndTeacherList.LESSON_SUBJECT}</span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">지역</div>

												<div class="profile-info-value">
													<i class="fa fa-map-marker light-orange bigger-110"></i> <span>${findlessonAndTeacherList.LESSON_LOC}</span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">나이</div>

												<div class="profile-info-value">
													<span>${findlessonAndTeacherList.AGE}</span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">등록일</div>

												<div class="profile-info-value">
													<span>${findlessonAndTeacherList.LESSON_DATE}</span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">대상</div>

												<div class="profile-info-value">
													<span>${findlessonAndTeacherList.LESSON_AGE}</span>
												</div>
											</div>
										</div>



									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
								<br>

								<div class="space-20"></div>

								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<div class="widget-box transparent">
											<div class="widget-header widget-header-small">
												<h4 class="widget-title smaller">
													<i class="ace-icon fa fa-check-square-o bigger-110"></i> 과외
													소개
												</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main">
													<B>${findlessonAndTeacherList.LESSON_TITLE}</B>
													<p>${findlessonAndTeacherList.LESSON_CONTENT}</p>


												</div>
											</div>
										</div>
									</div>
								</div>
								<br>

								<div class="space-20"></div>

								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<div class="widget-box transparent">
											<div class="widget-header widget-header-small">
												<h4 class="widget-title smaller">
													<i class="ace-icon fa fa-check-square-o bigger-110"></i>
													사는곳
												</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main">
													<p>저는 ${findlessonAndTeacherList.LESSON_LOC}에 사는중 입니다</p>

												</div>
											</div>
										</div>
									</div>
								</div>
								<br>


								<div class="space-20"></div>

								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<div class="widget-box transparent">
											<div class="widget-header widget-header-small">
												<h4 class="widget-title smaller">
													<i class="ace-icon fa fa-check-square-o bigger-110"></i>
													수업료
												</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main">
													<p>수업료는 ${findlessonAndTeacherList.LESSON_PRICE}원 입니다.</p>

												</div>
											</div>
										</div>
									</div>
								</div>

								<br>
								<div class="space-20"></div>

								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<div class="widget-box transparent">
											<div class="widget-header widget-header-small">
												<h4 class="widget-title smaller">
													<i class="ace-icon fa fa-check-square-o bigger-110"></i> 나이
												</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main">
													<p>${findlessonAndTeacherList.AGE}세</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<br>
								<div class="space-20"></div>

								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<div class="widget-box transparent">
											<div class="widget-header widget-header-small">
												<h4 class="widget-title smaller">
													<i class="ace-icon fa fa-check-square-o bigger-110"></i>
													인원수
												</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main">
													<c:if test="${findlessonAndTeacherList.MAX_PEOPLE>1 }">

														<p>저는 그룹과외를 하고</p>
														<p>최대인원수는 ${findlessonAndTeacherList.MAX_PEOPLE} 입니다</p>
													</c:if>
													<c:if test="${findlessonAndTeacherList.MAX_PEOPLE eq 1 }">

														<p>저는 1:1 과외를 합니다</p>

													</c:if>

												</div>
											</div>
										</div>
									</div>
								</div>


							</div>
							<!-- /#home -->



							<div id="friends" class="tab-pane">
								<br>
								<c:if test="${revuewAndStar[0] eq null}">

									<div class="" style="text-align: center;">
										<span style="font-size: 32px;"><i class="fa fa-file"></i></span><br>

										<b style="font-size: 22px;">No Review</b><br> <b
											style="font-size: 12px;">등록된 리뷰가 없습니다</b>

									</div>
									<!-- 검색결과 x end  -->
								</c:if>
								<c:forEach items="${revuewAndStar }" var="review">

									<div class="comment-wrapper">
										<span class=" pull-right"
											style="position: relative; top: -30px;"><small>${review.REVIEW_DATE }</small></span>
										<div class="panel-body">


											<ul class="media-list">
												<li class="media"><a href="#" class="pull-left"> <img
														src="${pageContext.request.contextPath}/resources/images/student.png"
														alt="" class="img-circle">
												</a>
													<div class="media-body">

														<span class="text-muted pull-right"> <c:if
																test="${review.STAR_POINT eq 1 }">
																<i class="ace-icon fa fa-star"></i>
															</c:if> <c:if test="${review.STAR_POINT eq 2 }">
																<i class="ace-icon fa fa-star"></i>
																<i class="ace-icon fa fa-star"></i>
															</c:if> <c:if test="${review.STAR_POINT eq 3 }">
																<i class="ace-icon fa fa-star"></i>
																<i class="ace-icon fa fa-star"></i>
																<i class="ace-icon fa fa-star"></i>
															</c:if> <c:if test="${review.STAR_POINT eq 4 }">
																<i class="ace-icon fa fa-star"></i>
																<i class="ace-icon fa fa-star"></i>
																<i class="ace-icon fa fa-star"></i>
																<i class="ace-icon fa fa-star"></i>
															</c:if> <c:if test="${review.STAR_POINT eq 5 }">
																<i class="ace-icon fa fa-star"></i>
																<i class="ace-icon fa fa-star"></i>
																<i class="ace-icon fa fa-star"></i>
																<i class="ace-icon fa fa-star"></i>
																<i class="ace-icon fa fa-star"></i>
															</c:if>
														</span> <strong class="text-success">${review.USER_ID }</strong>
														<p>${review.REVIEW_CONTENT }</p>
													</div> <br></li>
											</ul>
										</div>
									</div>

								</c:forEach>


								<div class="hr hr10 hr-double"></div>


							</div>
							<!-- /#friends -->

							<div id="pictures" class="tab-pane">


								<ul class="ace-thumbnails">
									<c:if test="${lessonFile[0] ne null }">
										<c:forEach items="${lessonFile }" var="file">


											<li><a href="#" data-rel="colorbox"> <img
													style="width: 200px; height: 200px;" alt="150x150"
													src="${pageContext.request.contextPath}/resources/upload/${file.TCH_FILE_RENAME}">

											</a></li>
										</c:forEach>
									</c:if>

									<c:if test="${lessonFile[0] eq null }">
										<br>
										<div class="" style="text-align: center;">
											<span style="font-size: 32px;"><i class="fa fa-image"></i></span><br>

											<b style="font-size: 22px;">No Review</b><br> <b
												style="font-size: 12px;">등록된 이미지가 없습니다</b>

										</div>

									</c:if>














								</ul>
							</div>
							<!-- /#pictures -->
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- END .gtco-services -->


	<link
		href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
		rel="stylesheet">




	<%
		int userNo = 0;
	if (session.getAttribute("loginUser") != null) {
		userNo = ((Member) session.getAttribute("loginUser")).getUserNo();//사용자의 정보가져오기
	}
	%>






	<script type="text/javascript">
	
	function gochatRoom(){
		
		var userNo=<%=userNo%>
		
		if(userNo==0){
    		alert('로그인 후 사용 가능합니다')
    		return 
    	}else{
    		location.href="${pageContext.request.contextPath}/chat/chatRoom?toID=${findlessonAndTeacherList.USER_ID}";
    	}
	}
	
    function insertWish(lessonNo){
    
    	var userNo=<%=userNo%>
    	if(userNo==0){
    		alert('로그인 후 사용 가능합니다')
    		return 
    	}else{
    		
    	$.ajax({
    		type:"POST",
    		url:"${pageContext.request.contextPath}/lesson/wish/insert",
    		data:{lessonNo:lessonNo, userNo:userNo},
    		success:function(data){
    			if(data==1){//이미 찜이 되어있을때
    				alert('이미 찜이 되어있습니다')
    			}else{
    				alert('찜하기가 완료되었습니다')
    			}
    		}
    });
    	}
    
    	
    }
    
    function insertConnect(lessonNo,teacherNo){
    	var student=<%=userNo%>;
    	
    	if(student==0){
    		alert('로그인 후 사용 가능합니다')
    		return 
    	}else{
    		
        	$.ajax({
        		type:"POST",
        		url:"${pageContext.request.contextPath}/lesson/connect/insert",
        		data:{lessonNo:lessonNo, stuNo:student, teacherNo:teacherNo},
        		success:function(data){
        			if(data==1){//이미 찜이 되어있을때
        				alert('이미 신청이 되어있습니다')
        			}else{
        				alert('신청이 완료되었습니다')
        			}
        		}
        });
        	}
    	
    	
    }
    	
    
    
    
    
    
    
   
    </script>


	<%-- <!-- footer include  -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/footer.jsp"></jsp:include>  --%>

	<%@ include file="/WEB-INF/layout/main/footer.jsp"%>





	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
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
