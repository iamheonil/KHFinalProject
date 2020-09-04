<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layout/main/header.jsp"%>


<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/header.jsp"></jsp:include>    --%>

<style type="text/css">
@import
	url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css')
	;

.banner h1, .banner h2 {
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
/* -------------------------------------------------------------- Box Product -------------------------------------------------------------- */
.box-product-outer {
	margin-bottom: 5px;
	padding-top: 15px;
	padding-bottom: 15px
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
	overflow: hidden
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

*
{
    user-select: none;
}

*:focus
{
    outline: none;
}

html, body
{
    height: 100%;
    min-height: 100%;
}

body
{
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    padding-bottom: 100px;
    margin: 0;
    background-color: #ebf3f3;
}

.brd
{
    border: 1px solid #e2eded;
    border-color: #eaf1f1 #e4eded #dbe7e7 #e4eded;
}

#info
{
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

#app-cover
{
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    width: 300px;
    height: 42px;
    margin: 100px auto 0 auto;
}

#select-button
{
    position: relative;
    height: 16px;
    padding: 12px 14px;
    background-color: #fff;
    border-radius: 4px;
    cursor: pointer;
}

#options-view-button
{
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

#selected-value
{
    font-size: 16px;
    line-height: 1;
    margin-right: 26px;
}

.option i
{
    width: 16px;
    height: 16px;
}

.option, .label
{
    color: #2d3667;
    font-size: 16px;
}

#chevrons
{
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    width: 12px;
    padding: 9px 14px;
}

#chevrons i
{
    display: block;
    height: 50%;
    color: #d1dede;
    font-size: 12px;
    text-align: right;
}

#options-view-button:checked + #select-button #chevrons i
{
    color: #2d3667;
}

.options
{
    position: absolute;
    left: 0;
    width: 250px;
}

#options
{
    position: absolute;
    top: 42px;
    right: 0;
    left: 0;
    width: 298px;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 4px;
}

#options-view-button:checked ~ #options
{
    border: 1px solid #e2eded;
    border-color: #eaf1f1 #e4eded #dbe7e7 #e4eded;
}

.option
{
    position: relative;
    line-height: 1;
    transition: 0.3s ease all;
    z-index: 2;
}

.option i
{
    position: absolute;
    left: 14px;
    padding: 0;
    display: none;
}

#options-view-button:checked ~ #options .option i
{
    display: block;
    padding: 12px 0;
}

.label
{
    display: none;
    padding: 0;
    margin-left: 27px;
}

#options-view-button:checked ~ #options .label
{
    display: block;
    padding: 12px 14px;    
}

.s-c
{
    position: absolute;
    left: 0;
    width: 100%;
    height: 50%;
}

.s-c.top
{
    top: 0;
}

.s-c.bottom
{
    bottom: 0;
}

input[type="radio"]
{
    position: absolute;
    right: 0;
    left: 0;
    width: 100%;
    height: 50%;
    margin: 0;
    opacity: 0;
    cursor: pointer;
}

.s-c:hover ~ i
{
    color: #fff;
    opacity: 0;
}

.s-c:hover
{
    height: 100%;
    z-index: 1;
}

.s-c.bottom:hover + i
{
    bottom: -25px;
    animation: moveup 0.3s ease 0.1s forwards;
}

.s-c.top:hover ~ i
{
    top: -25px;
    animation: movedown 0.3s ease 0.1s forwards;
}

@keyframes moveup
{
    0%{ bottom: -25px; opacity: 0;}
    100%{ bottom: 0; opacity: 1;}
}

@keyframes movedown
{
    0%{ top: -25px; opacity: 0;}
    100%{ top: 0; opacity: 1;}
}

.label
{
    transition: 0.3s ease all;
}

.opt-val
{
    position: absolute;
    left: 14px;
    width: 217px;
    height: 21px;
    opacity: 0;
    background-color: #fff;
    transform: scale(0);
}

.option input[type="radio"]:checked ~ .opt-val
{
    opacity: 1;
    transform: scale(1);
}

.option input[type="radio"]:checked ~ i
{
    top: 0;
    bottom: auto;
    opacity: 1;
    animation: unset;
}

.option input[type="radio"]:checked ~ i, .option input[type="radio"]:checked ~ .label
{
    color:#fff;
}

.option input[type="radio"]:checked ~ .label:before
{
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: -1;
}

#options-view-button:not(:checked) ~ #options .option input[type="radio"]:checked ~ .opt-val
{
    top: -30px;
}

.option:nth-child(1) input[type="radio"]:checked ~ .label:before
{
    background-color: #000;
    border-radius: 4px 4px 0 0;
}

.option:nth-child(1) input[type="radio"]:checked ~ .opt-val
{
    top: -31px;
}

.option:nth-child(2) input[type="radio"]:checked ~ .label:before
{
    background-color: #ea4c89;
}

.option:nth-child(2) input[type="radio"]:checked ~ .opt-val
{
    top: -71px;
}

.option:nth-child(3) input[type="radio"]:checked ~ .label:before
{
    background-color: #0057ff;
}

.option:nth-child(3) input[type="radio"]:checked ~ .opt-val
{
    top: -111px;
}

.option:nth-child(4) input[type="radio"]:checked ~ .label:before
{
    background-color: #32c766;
}

.option:nth-child(4) input[type="radio"]:checked ~ .opt-val
{
    top: -151px;
}

.option:nth-child(5) input[type="radio"]:checked ~ .label:before
{
    background-color: #f48024;
}

.option:nth-child(5) input[type="radio"]:checked ~ .opt-val
{
    top: -191px;
}

.option:nth-child(6) input[type="radio"]:checked ~ .label:before
{
    background-color: #006400;
    border-radius: 0 0 4px 4px;
}

.option:nth-child(6) input[type="radio"]:checked ~ .opt-val
{
    top: -231px;
}

.option .fa-codepen
{
    color: #000;
}

.option .fa-dribbble
{
    color: #ea4c89;
}

.option .fa-behance
{
    color: #0057ff;
}

.option .fa-hackerrank
{
    color: #32c766;
}

.option .fa-stack-overflow
{
    color: #f48024;
}

.option .fa-free-code-camp
{
    color: #006400;
}

#option-bg
{
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    height: 40px;
    transition: 0.3s ease all;
    z-index: 1;
    display: none;
}

#options-view-button:checked ~ #options #option-bg
{
    display: block;
}

.option:hover .label
{
    color: #fff;
}

.option:nth-child(1):hover ~ #option-bg
{
    top: 0;
    background-color: #000;
    border-radius: 4px 4px 0 0;
}

.option:nth-child(2):hover ~ #option-bg
{
    top: 40px;
    background-color: #ea4c89;
}

.option:nth-child(3):hover ~ #option-bg
{
    top: 80px;
    background-color: #0057ff;
}

.option:nth-child(4):hover ~ #option-bg
{
    top: 120px;
    background-color: #32c766;
}

.option:nth-child(5):hover ~ #option-bg
{
    top: 160px;
    background-color: #f48024;
}

.option:nth-child(6):hover ~ #option-bg
{
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
</style>

<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<body>

	<div class="gtco-loader"></div>

	<div id="page">
		<!-- nav include  -->
		<header id="gtco_header" class="gtco-cover gtco-cover-xs gtco-inner"
			role="banner">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-12 col-md-offset-0 text-center">
						<div class="display-t">
							<div class="display-tc">
								<div class="row">
									<div class="col-md-8 animate-box">
										<link
											href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
											rel="stylesheet">

										<div class="row padding-horizontal-md  banner">
											<div
												class="row margin-top-xs text title title-xxl text-bold text-white">
												<p>
												<h2>원하는 선생님을 찾아보세요</h2>
												</p>
											</div>
											

										</div>
										
										
										
										

<form id="app-cover">
            <div id="select-box">
                    <input type="checkbox" id="options-view-button">
                    <div id="select-button" class="brd">
                            <div id="selected-value">
                                <span>선생님 성별</span>
                            </div>
                            <div id="chevrons">
                                    <i class="fas fa-chevron-up"></i>
                                    <i class="fas fa-chevron-down"></i>
                            </div>
                    </div>
                    <div id="options">
                            <div class="option">
                                    <input class="s-c top" type="radio" name="platform" value="codepen">
                                    <input class="s-c bottom" type="radio" name="platform" value="codepen">
                                    <i class="fab fa-codepen"></i>
                                    <span class="label">CodePen</span>
                                    <span class="opt-val">CodePen</span>
                            </div>
                            <div class="option">
                                    <input class="s-c top" type="radio" name="platform" value="dribbble">
                                    <input class="s-c bottom" type="radio" name="platform" value="dribbble">
                                    <i class="fab fa-dribbble"></i>
                                    <span class="label">Dribbble</span>
                                    <span class="opt-val">Dribbble</span>
                            </div>
                            <div class="option">
                                    <input class="s-c top" type="radio" name="platform" value="behance">
                                    <input class="s-c bottom" type="radio" name="platform" value="behance">
                                    <i class="fab fa-behance"></i>
                                    <span class="label">Behance</span>
                                    <span class="opt-val">Behance</span>
                            </div>
                            <div class="option">
                                    <input class="s-c top" type="radio" name="platform" value="hackerrank">
                                    <input class="s-c bottom" type="radio" name="platform" value="hackerrank">
                                    <i class="fab fa-hackerrank"></i>
                                    <span class="label">HackerRank</span>
                                    <span class="opt-val">HackerRank</span>
                            </div>
                            <div class="option">
                                    <input class="s-c top" type="radio" name="platform" value="stackoverflow">
                                    <input class="s-c bottom" type="radio" name="platform" value="stackoverflow">
                                    <i class="fab fa-stack-overflow"></i>
                                    <span class="label">StackOverflow</span>
                                    <span class="opt-val">StackOverflow</span>
                            </div>
                            <div class="option">
                                    <input class="s-c top" type="radio" name="platform" value="freecodecamp">
                                    <input class="s-c bottom" type="radio" name="platform" value="freecodecamp">
                                    <i class="fab fa-free-code-camp"></i>
                                    <span class="label">FreeCodeCamp</span>
                                    <span class="opt-val">FreeCodeCamp</span>
                            </div>
                            <div id="option-bg"></div>
                    </div>
            </div>
    </form>

<a href="https://www.youtube.com/channel/UC7hSS_eujjZOEQrjsda76gA/videos" target="_blank" id="ytd-url">My YouTube Channel</a>
										
										
										
										
										
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- END #gtco-header -->




		



		<div class="gtco-section gtco-testimonial gtco-gray">
			<div class="gtco-container">


				<link
					href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
					rel="stylesheet">
				<div class="container bootdey">
					<div class="col-md-12">
						<div class="title">
							<span>선생님 찾기</span>
						</div>
						<hr>
						
						<!-- 이미지 시작부분  -->
						<div class="col-sm-4 col-md-3 box-product-outer">
							<div class="box-product">
								<div class="img-wrapper">
									<a href="detail.html"> <img alt="Product"
										src="https://bootdey.com/img/Content/avatar/avatar1.png">
									</a>
									
									
								</div>
								<h6>
									<a href="detail.html">IncultGeo Print Polo T-Shirt</a>
								</h6>
								<div class="price">
									<div>
										$16.59<span class="price-down">-10%</span>
									</div>
									<span class="price-old">$15.00</span>
								</div>
								<div class="rating">
									<i class="ace-icon fa fa-star"></i> <i
										class="ace-icon fa fa-star"></i> <i
										class="ace-icon fa fa-star"></i> <i
										class="ace-icon fa fa-star"></i> <i
										class="ace-icon fa fa-star-half-o"></i> <a href="#">(2
										reviews)</a>
								</div>
							</div>
						</div>
						
						<!-- 이미지 끝부분  -->
						
						

						
						</div>
						
						
					</div>
				
			</div><!-- end container  -->
		</div><!-- end section  -->


		<%-- <!-- footer include  -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/footer.jsp"></jsp:include>  --%>

		<%@ include file="/WEB-INF/layout/main/footer.jsp"%>



	</div>

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

