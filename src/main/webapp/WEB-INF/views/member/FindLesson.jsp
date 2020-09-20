<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layout/main/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/header.jsp"></jsp:include>    --%>

<style type="text/css">
@import
	url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css')
	;

.banner h1, .banner h2 .banner form {
	font-family: 'NanumSquareRound', sans-serif !important;
	font-weight: bolder !important;
}

.banner h1 {
	margin-top: 20px;
}

.banner {
	margin-top: 120px;
}

body {
	margin-top: 20px;
}

label {
	font-size: 11px;
	font-weight: bolder;
	white-space: nowrap;
	margin-right: 40px;
	margin-bottom: 15px;
	padding-bottom: 10px;
}

.option {
	display: inline-block;
	width: 300px;
	margin-left: 140px;
}
/* -------------------------------------------------------------- Box Product -------------------------------------------------------------- */
.box-product-outer {
	margin-bottom: 5px;
	padding-top: 15px;
	padding-bottom: 15px;
	height: 380px;
}

.box-product-outer:hover {
	outline: 1px solid #aaa;
	-webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
	box-shadow: 0 6px 12px rgba(0, 0, 0, .175)
}

.tab-content .box-product-outer {
	margin-bottom: 0
}

.box-product-slider-outer {
	padding: 10px
}

.box-product .img-wrapper {
	position: relative;
	overflow: hidden;
	width: 230px;
}

.box-product .img-wrapper>:first-child {
	position: relative;
	display: block
}

.box-product .img-wrapper>a>img {
	width: 100%
}

.box-product .img-wrapper .tags {
	position: absolute;
	top: 0;
	right: 0;
	display: inline-block;
	overflow: visible;
	width: auto;
	height: auto;
	margin: 0;
	padding: 0;
	vertical-align: inherit;
	border-width: 0;
	background-color: transparent;
	direction: rtl
}

.box-product .img-wrapper .tags-left {
	left: 0;
	direction: ltr
}

.box-product .img-wrapper .tags>.label-tags {
	display: table;
	margin: 1px 0 0 0;
	text-align: left;
	opacity: .92;
	filter: alpha(opacity = 92);
	direction: ltr
}

.box-product .img-wrapper .tags>.label-tags:hover {
	opacity: 1;
	filter: alpha(opacity = 100)
}

.box-product .img-wrapper .tags>.label-tags a:hover {
	text-decoration: none
}

.box-product .img-wrapper>.option {
	position: absolute;
	top: auto;
	right: 0;
	bottom: -30px;
	left: 0;
	width: auto;
	height: 28px;
	-webkit-transition: all .2s ease;
	-o-transition: all .2s ease;
	transition: all .2s ease;
	text-align: center;
	vertical-align: middle;
	background-color: rgba(0, 0, 0, .55)
}

.box-product .img-wrapper .option>a {
	font-size: 18px;
	font-weight: normal;
	display: inline-block;
	padding: 0 4px;
	color: #fff
}

.box-product .img-wrapper:hover>.option {
	top: auto;
	bottom: 0
}

.box-product h6 a {
	line-height: 1.4
}

.price {
	margin-bottom: 5px;
	color: #f44336
}

.price .price-down {
	margin-left: 5px;
	padding: 2px 5px;
	color: #fff;
	background: #f44336
}

.price-old {
	position: relative;
	display: inline-block;
	margin-right: 7px;
	color: #666
}

.price-old:before {
	position: absolute;
	width: 100%;
	height: 60%;
	content: '';
	border-bottom: 1px solid #666
}

.rating i {
	color: #fc0
}

.product-sorting-bar {
	border: 1px solid #e5e5e5
}
/* -------------------------------------------------------------- End of Box Product -------------------------------------------------------------- */
* {
	user-select: none;
}

*:focus {
	outline: none;
}

html, body {
	height: 100%;
	min-height: 100%;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	padding-bottom: 100px;
	margin: 0;
	background-color: #ebf3f3;
}

.brd {
	border: 1px solid #e2eded;
	border-color: #eaf1f1 #e4eded #dbe7e7 #e4eded;
}

#info {
	position: absolute;
	top: 0;
	right: 0;
	left: 0;
	color: #2d3667;
	font-size: 16px;
	text-align: center;
	padding: 14px;
	background-color: #f3f9f9;
}

#app-cover {
	position: absolute;
	top: 0;
	right: 0;
	left: 0;
	width: 300px;
	height: 42px;
	margin: 100px auto 0 auto;
}

#select-button {
	position: relative;
	height: 16px;
	padding: 12px 14px;
	background-color: #fff;
	border-radius: 4px;
	cursor: pointer;
}

#options-view-button {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 100%;
	margin: 0;
	opacity: 0;
	cursor: pointer;
	z-index: 3;
}

#selected-value {
	font-size: 16px;
	line-height: 1;
	margin-right: 26px;
}

.option i {
	width: 16px;
	height: 16px;
}

.option, .label {
	color: #2d3667;
	font-size: 16px;
}

#chevrons {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	width: 12px;
	padding: 9px 14px;
}

#chevrons i {
	display: block;
	height: 50%;
	color: #d1dede;
	font-size: 12px;
	text-align: right;
}

#options-view-button:checked+#select-button #chevrons i {
	color: #2d3667;
}

.options {
	position: absolute;
	left: 0;
	width: 250px;
}

#options {
	position: absolute;
	top: 42px;
	right: 0;
	left: 0;
	width: 298px;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 4px;
}

#options-view-button:checked ~ #options {
	border: 1px solid #e2eded;
	border-color: #eaf1f1 #e4eded #dbe7e7 #e4eded;
}

.option {
	position: relative;
	line-height: 1;
	transition: 0.3s ease all;
	z-index: 2;
}

.option i {
	position: absolute;
	left: 14px;
	padding: 0;
	display: none;
}

#options-view-button:checked ~ #options .option i {
	display: block;
	padding: 12px 0;
}

.label {
	display: none;
	padding: 0;
	margin-left: 27px;
}

#options-view-button:checked ~ #options .label {
	display: block;
	padding: 12px 14px;
}

.s-c {
	position: absolute;
	left: 0;
	width: 100%;
	height: 50%;
}

.s-c.top {
	top: 0;
}

.s-c.bottom {
	bottom: 0;
}

input[type="radio"] {
	position: absolute;
	right: 0;
	left: 0;
	width: 100%;
	height: 50%;
	margin: 0;
	opacity: 0;
	cursor: pointer;
}

.s-c:hover ~ i {
	color: #fff;
	opacity: 0;
}

.s-c:hover {
	height: 100%;
	z-index: 1;
}

.s-c.bottom:hover+i {
	bottom: -25px;
	animation: moveup 0.3s ease 0.1s forwards;
}

.s-c.top:hover ~ i {
	top: -25px;
	animation: movedown 0.3s ease 0.1s forwards;
}

@
keyframes moveup { 0%{
	bottom: -25px;
	opacity: 0;
}

100%{
bottom














:







 







0;
opacity














:







 







1;
}
}
@
keyframes movedown { 0%{
	top: -25px;
	opacity: 0;
}

100%{
top














:







 







0;
opacity














:







 







1;
}
}
.label {
	transition: 0.3s ease all;
}

.opt-val {
	position: absolute;
	left: 14px;
	width: 217px;
	height: 21px;
	opacity: 0;
	background-color: #fff;
	transform: scale(0);
}

.option input[type="radio"]:checked ~ .opt-val {
	opacity: 1;
	transform: scale(1);
}

.option input[type="radio"]:checked ~ i {
	top: 0;
	bottom: auto;
	opacity: 1;
	animation: unset;
}

.option input[type="radio"]:checked ~ i, .option input[type="radio"]:checked 
	 ~ .label {
	color: #fff;
}

element.style {
	
}

.gtco-cover.gtco-cover-xs {
	height: 600px;
}

.option input[type="radio"]:checked ~ .label:before {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: -1;
}

#options-view-button:not (:checked ) ~ #options .option input[type="radio"]:checked 
	 ~ .opt-val {
	top: -30px;
}

.option:nth-child(1) input[type="radio"]:checked ~ .label:before {
	background-color: #000;
	border-radius: 4px 4px 0 0;
}

.option:nth-child(1) input[type="radio"]:checked ~ .opt-val {
	top: -31px;
}

.option:nth-child(2) input[type="radio"]:checked ~ .label:before {
	background-color: #ea4c89;
}

.option:nth-child(2) input[type="radio"]:checked ~ .opt-val {
	top: -71px;
}

.option:nth-child(3) input[type="radio"]:checked ~ .label:before {
	background-color: #0057ff;
}

.option:nth-child(3) input[type="radio"]:checked ~ .opt-val {
	top: -111px;
}

.option:nth-child(4) input[type="radio"]:checked ~ .label:before {
	background-color: #32c766;
}

.option:nth-child(4) input[type="radio"]:checked ~ .opt-val {
	top: -151px;
}

.option:nth-child(5) input[type="radio"]:checked ~ .label:before {
	background-color: #f48024;
}

.option:nth-child(5) input[type="radio"]:checked ~ .opt-val {
	top: -191px;
}

.option:nth-child(6) input[type="radio"]:checked ~ .label:before {
	background-color: #006400;
	border-radius: 0 0 4px 4px;
}

.option:nth-child(6) input[type="radio"]:checked ~ .opt-val {
	top: -231px;
}

.option .fa-codepen {
	color: #000;
}

.option .fa-dribbble {
	color: #ea4c89;
}

.option .fa-behance {
	color: #0057ff;
}

.option .fa-hackerrank {
	color: #32c766;
}

.option .fa-stack-overflow {
	color: #f48024;
}

.option .fa-free-code-camp {
	color: #006400;
}

#option-bg {
	position: absolute;
	top: 0;
	right: 0;
	left: 0;
	height: 40px;
	transition: 0.3s ease all;
	z-index: 1;
	display: none;
}

#options-view-button:checked ~ #options #option-bg {
	display: block;
}

.option:hover .label {
	color: #fff;
}

.option:nth-child(1):hover ~ #option-bg {
	top: 0;
	background-color: #000;
	border-radius: 4px 4px 0 0;
}

.option:nth-child(2):hover ~ #option-bg {
	top: 40px;
	background-color: #ea4c89;
}

.option:nth-child(3):hover ~ #option-bg {
	top: 80px;
	background-color: #0057ff;
}

.option:nth-child(4):hover ~ #option-bg {
	top: 120px;
	background-color: #32c766;
}

.option:nth-child(5):hover ~ #option-bg {
	top: 160px;
	background-color: #f48024;
}

.option:nth-child(6):hover ~ #option-bg {
	top: 200px;
	background-color: #006400;
	border-radius: 0 0 4px 4px;
}

#ytd-url {
	display: block;
	position: fixed;
	right: 0;
	bottom: 0;
	padding: 10px 14px;
	margin: 20px;
	color: #fff;
	font-size: 14px;
	text-decoration: none;
	background-color: #143240;
	border-radius: 4px;
	box-shadow: 0 10px 20px -5px rgba(20, 50, 64, 0.76);
}

.form-horizontal .form-group {
	margin-left: -15px;
	margin-right: -90px;
}

#tutee_list .tutee .text-ellipsis, #tutor_list .tutor .text-ellipsis {
	width: calc(100% - 24px);
	height: 24px;
	padding: 7px 0 6px 4px;
	font-size: 14px !important;
}

.text-ellipsis {
	white-space: nowrap !important;
	overflow: hidden !important;
	text-overflow: ellipsis !important;
	max-width: 100%;
	font-weight: 300;
}

.text-basic-black {
	color: #4d4d4d !important;
}
</style>
<!-- 
<!-- CSS only -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
 -->
JS, Popper.js, and jQuery
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
-->



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


			<!-- 검색결과  -->
			<link
				href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
				rel="stylesheet">
			<div class="container bootdey">
				<div class="col-md-12">
					<div class="title">
						<span>선생님 찾기</span>
					</div>
					<hr>
					<c:if test="${option.Loc ne '무관' }">
						<i class="fa fa-check-square-o">&nbsp;${option.Loc }</i>&nbsp;|&nbsp;
					</c:if>

					<c:if test="${option.Sex ne '무관' }">
						<c:if test="${option.Sex eq 'w' }">
							<i class="fa fa-check-square-o">&nbsp;여자</i>&nbsp;|&nbsp;
					</c:if>
						<c:if test="${option.Sex eq 'm' }">
							<i class="fa fa-check-square-o">&nbsp;남자</i>&nbsp;|&nbsp;
					</c:if>
					</c:if>

					<c:if test="${option.Age ne '무관' }">
						<i class="fa fa-check-square-o">&nbsp;${option.Age }</i>&nbsp;|&nbsp;
					</c:if>

					<c:if test="${option.Sub ne '무관' }">
						<i class="fa fa-check-square-o">&nbsp;${option.Sub }</i>&nbsp;|&nbsp;
					</c:if>

					<c:if test="${option.Pri ne '무관' }">
						<i class="fa fa-check-square-o">&nbsp;${option.Pri }원 이하</i>&nbsp;|&nbsp;
					</c:if>

					<c:if test="${option.Cnt ne '무관' }">
						<i class="fa fa-check-square-o">&nbsp;${option.Cnt }</i>&nbsp;|&nbsp;
					</c:if>



					<br>

					<!-- 검색 결과가 없을 경우  -->
					<c:if test="${findLessonList[0] eq null}">
						<div class="" style="text-align: center;">


							<img alt="Teacher" align="middle"
								style="width: 200px; height: 200px; margin-top: 50px;"
								src="${pageContext.request.contextPath}/resources/images/no_result.png">

						</div>
						<!-- 검색결과 x end  -->



					</c:if>

					<!-- 이미지 시작부분  -->

					<c:forEach items="${findLessonList }" var="find">

						<div class="col-sm-4 col-md-3 hidden-xs box-product-outer">

							<div class="box-product">
								<div class="img-wrapper" style="margin: 0 auto;">
									<a
										href="${pageContext.request.contextPath}/lesson/detaillesson?lessonNo=${find.LESSON_NO}&userNo=${find.USER_NO}">
										<img alt="Teacher" style="width: 230px; height: 200px;"
										onerror="javascript:src='${pageContext.request.contextPath}/resources/images/profile.png'"
										src="${pageContext.request.contextPath}/resources/upload/${find.TCH_FILE_RENAME}">
									</a>


								</div>

								<div class="text text-epllipsis text-basic-black text-sm"
									style="margin-left: 10px;">
									<B>${find.USER_ID }</B>
								</div>
								<div class="text text-epllipsis text-basic-black text-sm"
									style="margin-left: 10px;">
									<i class="fa fa-file-o"
										style="margin-right: 8px; margin-left: 0;"></i>
									${find.LESSON_SUBJECT }
								</div>
								<div class="text text-epllipsis text-basic-black text-sm"
									style="margin-left: 10px;">
									<i class="fa fa-map-marker"
										style="margin-right: 16px; margin-left: 0;"></i>${find.LESSON_LOC }</div>

								<div class="text text-epllipsis text-basic-black text-sm"
									style="margin-left: 10px;">
									<i class="fa fa-users" style="margin-right: 8px;"></i>
									<c:if test="${find.MAX_PEOPLE eq 1 }">
										일대일
									</c:if>
									<c:if test="${find.MAX_PEOPLE ne 1 }">
										그룹
									</c:if>

								</div>

								<c:forEach items="${star }" var="s">
									<c:if test="${find.USER_NO eq s.TEACHER}">
										<div class="rating" style="margin-left: 10px;">
											<c:if test="${s.STAR eq 1 }">
												<i class="ace-icon fa fa-star"></i>
											</c:if>
											<c:if test="${s.STAR eq 1.5 }">
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star-half-o"></i>
											</c:if>
											<c:if test="${s.STAR eq 2 }">
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
											</c:if>
											<c:if test="${s.STAR eq 2.5 }">
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star-half-o"></i>
											</c:if>
											<c:if test="${s.STAR eq 3 }">
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
											</c:if>
											<c:if test="${s.STAR eq 3.5 }">
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star-half-o"></i>
											</c:if>
											<c:if test="${s.STAR eq 4 }">
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
											</c:if>
											<c:if test="${s.STAR eq 4.5 }">
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star-half-o"></i>
											</c:if>
											<c:if test="${s.STAR eq 5 }">
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
												<i class="ace-icon fa fa-star"></i>
											</c:if>

											(${s.REVIEW } reviews)
										</div>
									</c:if>
								</c:forEach>

							</div>

							</a>
						</div>

						<!-- 이미지 끝부분  -->

					</c:forEach>



				</div>
				<c:import url="/WEB-INF/paging/user/findLesson/listPaging.jsp" />

			</div>

		</div>
	</div>
	<!-- END .gtco-services -->


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
