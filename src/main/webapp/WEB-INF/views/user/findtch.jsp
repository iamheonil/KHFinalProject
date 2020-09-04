<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 구동영 20200817 : 프론트 작업 -->
<!-- nav include  -->
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/layout/main/header.jsp"></jsp:include>

<style type="text/css">

.panel {
    box-shadow: 0 2px 0 rgba(0,0,0,0.075);
    border-radius: 0;
    border: 0;
    margin-bottom: 24px;
}
.panel .panel-heading, .panel>:first-child {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.bg-primary, .bg-primary a {
    color: #fff;
}
.bg-primary {
    background-color: #5fa2dd;
}
.bg-success, .bg-success a {
    color: #fff;
}
.bg-success {
    background-color: #91c957;
}

.widget-header {
    padding: 15px 15px 50px 15px;
    min-height: 200px;
    position: relative;
    overflow: hidden;
}
.panel .panel-footer, .panel>:last-child {
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
.widget-body {
    padding: 15px 15px 15px;
    position: relative;
}
.panel-body {
    padding: 25px 20px;
}
.pad-all {
    padding: 5px;
}
.widget-img {
    position: absolute;
    width: 64px;
    height: 64px;
    left: 50%;
    margin-left: -32px;
    top: -32px;
}
.img-md {
    width: 64px;
    height: 64px;
}
.widget-bg {
    position: absolute;
    top: 0;
    left: 0;
    min-width: 100%;
    min-height: 100%;
}
.img-border-light {
    box-shadow: 0 0 0 4px #fff;
}
.img-border {
    box-shadow: 0 0 0 4px rgba(0,0,0,0.1);
}
.mar-no {
    margin: 0 !important;
}
h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
    font-weight: 600;
}
.text-muted, a.text-muted:hover, a.text-muted:focus, a.text-muted:focus {
    color: #606060;
}
.mar-btm {
    margin-bottom: 15px;
}
.pad-ver {
    padding-top: 15px;
    padding-bottom: 15px;
}
.pad-btm {
    padding-bottom: 15px;
}
.pad-top {
    padding-top: 8px;
}
.small, small {
    font-size: 65%;
}
.text-lg {
    font-size: 75%;
}

.teacher{
	width: 280px;
	padding: 0 10px;
	float: left;
}
.selectStyle{
	width: 100%;
	border-radius: 90px;
	background-color: #eee;
	border: none;
	height: 40px !important;
	padding: 0 10px;
}

#tchList{
	widht: 900px;
}

#tchList .btn {
    cursor: pointer;
    padding: 6px 12px;
    border-radius: 0;
    border: 1px solid 0;
    font-size: 11px;
    line-height: 1.42857;
    vertical-align: middle;
    -webkit-transition: all .25s;
    transition: all .25s;
    width: 90px;
    height: 30px;
}

.teacher p{
	font-size: 16px;
}
</style>

<body>
		
	<div id="page">

		<header id="gtco-header" class="gtco-cover gtco-cover-xs gtco-inner" role="banner" style="height: 600px;">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-12 col-md-offset-0 text-left">
						<div class="display-t">
							<div class="display-tc">
								<div class="row">
									<div class="col-md-8 animate-box">
									<br>
										<h1 class="no-margin" style="margin-top: 100px;">과외 찾기</h1>
										<br>
										<div style="margin-left: 22%;">

										<div class="s010">
									      <form>
									        <div class="inner-form">
									          <div class="basic-search">
									            <div class="input-field">
									              <input id="search" type="text" placeholder="Type Keywords" />
									              <div class="icon-wrap">
									                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
									                  <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
									                </svg>
									              </div>
									            </div>
									          </div>
									          <div class="advance-search">
<!-- 									            <span class="desc">ADVANCED SEARCH</span> -->
									            <div class="row">
									            <div class="input-field">
									                <div class="input-select">
									                  <select class="selectStyle" data-trigger="" name="choices-single-defaul">
									                    <option placeholder="" value="">지역</option>
									                    <option>서울</option>
									                    <option>경기</option>
									                    <option>강원</option>
									                    <option>충남</option>
									                    <option>충북</option>
									                    <option>전남</option>
									                    <option>전북</option>
									                    <option>경남</option>
									                    <option>경북</option>
									                    <option>제주</option>
									                  </select>
									                </div>
									              </div>
									              <div class="input-field">
									                <div class="input-select">
									                  <select class="selectStyle" data-trigger="" name="choices-single-defaul">
									                    <option placeholder="" value="">연령</option>
									                    <option>초등</option>
									                    <option>중등</option>
									                    <option>고등</option>
									                    <option>대학</option>
									                    <option>성인</option>
									                  </select>
									                </div>
									              </div>
									              <div class="input-field">
									                <div class="input-select">
									                  <select class="selectStyle" data-trigger="" name="choices-single-defaul">
									                    <option placeholder="" value="">과목</option>
									                    <option>국어</option>
									                    <option>영어</option>
									                    <option>수학</option>
									                    <option>사회</option>
									                    <option>과학</option>
									                    <option>논술</option>
									                    <option>예체능</option>
									                    <option>컴퓨터(IT)</option>
									                    <option>제2외국어</option>
									                    <option>대학 전공</option>
									                    <option>자격증</option>
									                    <option>기타</option>
									                  </select>
									                </div>
									              </div>
									            </div>
									            <div class="row second">
									              <div class="input-field">
									                <div class="input-select">
									                  <select class="selectStyle" data-trigger="" name="choices-single-defaul">
									                    <option placeholder="" value="">성별</option>
									                    <option>남</option>
									                    <option>여</option>
									                  </select>
									                </div>
									              </div>
									              <div class="input-field">
									                <div class="input-select">
									                  <select class="selectStyle" data-trigger="" name="choices-single-defaul">
									                    <option placeholder="" value="">가격</option>
									                    <option>~10만원</option>
									                    <option>10~20만원</option>
									                    <option>20~30만원</option>
									                    <option>30~40만원</option>
									                    <option>40~50만원</option>
									                    <option>50~60만원</option>
									                    <option>60~70만원</option>
									                    <option>70~80만원</option>
									                    <option>80만원~</option>
									                  </select>
									                </div>
									              </div>
									              <div class="input-field">
									                <div class="input-select">
									                  <select class="selectStyle" data-trigger="" name="choices-single-defaul">
									                    <option placeholder="" value="">Type</option>
									                    <option>Subject b</option>
									                    <option>Subject c</option>
									                  </select>
									                </div>
									              </div>
									            </div>
									            <div class="row third">
									              <div class="input-field">
									                <div class="result-count">
									                  <span>108 </span>results</div>
									                <div class="group-btn">
<!-- 									                  <button class="btn-delete" id="delete">RESET</button> -->
									                  <button class="btn-search">SEARCH</button>
									                </div>
									              </div>
									            </div>
									          </div>
									        </div>
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
		</header>
		<!-- END #gtco-header -->


<div class="gtco-services gtco-section">
<div class="gtco-container">

<!-- 선생님 리스트 -->
 <div class="container">
	<div class="row bootstrap snippets bootdeys" id="tchList">
		   
		    <div class="teacher">
		        <div class="panel widget">
		        <div class="widget-header bg-purple">
		          <img class="widget-bg img-responsive" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Image">
		        </div>
		        <div class="widget-body text-center">
		          <h4 class="mar-no">Lucy Moon</h4>
		          <p class="text-muted mar-btm">Art Designer</p>
		          <div class="pad-all">
		          <p class="text-muted">
		            Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
		          </p>
		          <div class="pad-btm">
		            <button class="btn btn-primary">Follow</button>
		            <button class="btn btn-success">Message</button>
		          </div>
		        </div>
		        </div>
		      </div>
		    </div>
			    
		      <div class="teacher">
		        <div class="panel widget">
		        <div class="widget-header bg-purple">
		          <img class="widget-bg img-responsive" src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="Image">
		        </div>
		        <div class="widget-body text-center">
		          <h4 class="mar-no">Lucy Moon</h4>
		          <p class="text-muted mar-btm">Art Designer</p>
		          <div class="pad-all">
		          <p class="text-muted">
		            Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
		          </p>
		          <div class="pad-btm">
		            <button class="btn btn-primary">Follow</button>
		            <button class="btn btn-success">Message</button>
		          </div>
		        </div>
		        </div>
		      </div>
		    </div>
			    
			    
		    <div class="teacher">
		        <div class="panel widget">
		        <div class="widget-header bg-purple">
		          <img class="widget-bg img-responsive" src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="Image">
		        </div>
		        <div class="widget-body text-center">
		          <h4 class="mar-no">Lucy Moon</h4>
		          <p class="text-muted mar-btm">Art Designer</p>
		          <div class="pad-all">
		          <p class="text-muted">
		            Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
		          </p>
		          <div class="pad-btm">
		            <button class="btn btn-primary">Follow</button>
		            <button class="btn btn-success">Message</button>
		          </div>
		        </div>
		        </div>
		      </div>
		    </div>
		    
		        <div class="teacher">
		        <div class="panel widget">
		        <div class="widget-header bg-purple">
		          <img class="widget-bg img-responsive" src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="Image">
		        </div>
		        <div class="widget-body text-center">
		          <h4 class="mar-no">Lucy Moon</h4>
		          <p class="text-muted mar-btm">Art Designer</p>
		          <div class="pad-all">
		          <p class="text-muted">
		            Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
		          </p>
		          <div class="pad-btm">
		            <button class="btn btn-primary">Follow</button>
		            <button class="btn btn-success">Message</button>
		          </div>
		        </div>
		        </div>
		      </div>
		    </div>
		    
		        <div class="teacher">
		        <div class="panel widget">
		        <div class="widget-header bg-purple">
		          <img class="widget-bg img-responsive" src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="Image">
		        </div>
		        <div class="widget-body text-center">
		          <h4 class="mar-no">Lucy Moon</h4>
		          <p class="text-muted mar-btm">Art Designer</p>
		          <div class="pad-all">
		          <p class="text-muted">
		            Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
		          </p>
		          <div class="pad-btm">
		            <button class="btn btn-primary">Follow</button>
		            <button class="btn btn-success">Message</button>
		          </div>
		        </div>
		        </div>
		      </div>
		    </div>
			    
			</div>
			</div>
				
			</div>
		</div>
		<!-- END .gtco-services -->


	<!-- footer include  -->
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/layout/main/footer.jsp"></jsp:include>


	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>

	
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
	<!-- countTo -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.countTo.js"></script>
	<!-- Carousel -->
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/magnific-popup-options.js"></script>
	
	<!-- Main -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	</body>
</html>
