<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <!-- nav include  -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/header.jsp"></jsp:include> --%>
<%@ include file="/WEB-INF/layout/main/header.jsp" %>

<body>

    <div class="gtco-loader"></div>

	<div id="page">

        <!-- 김헌일 : 로그인 전 메인 페이지 작성 -->

        <br><br><br><br><br><br>
        <div id="main_wrap">
            <div>
                <h1 style="text-align: center">화려한 조명이 나를 감싸네</h1>

                <div id="main_img" style="width: 100%; margin:0 auto; position: relative;">
                    <img src="https://t1.daumcdn.net/cfile/tistory/2207573D58CFDE2704" />
                </div>
                <div id="main_img_button" style="width: 450px; margin: -3% 0px 0px 44%; position: relative;">
                    <button class="btn btn-primary">회원가입</button> <button class="btn btn-primary">로그인하기</button>
                </div>
            </div>
            <br><br><br><br><br><br><br>
            

            <h1 style="text-align: center">인기쓰앵님 TOP3</h1> 

            <ul class="row portfolio list-unstyled mb-0 boxed-portfolio">
                <!-- project -->
                <li class="col-md-6 col-lg-4 project" data-groups="[&quot;skill1&quot;]">
                    <div class="card mb-0">
                        <div class="project m-0">
                            <figure class="portfolio-item">
                                <a href="single-project6.html" class="hovereffect">
                                    <img class="img-responsive" src="https://via.placeholder.com/350x180/FFB6C1/000000" alt="">
                                    <div class="overlay">
                                    </div><!-- / overlay -->
                                </a><!-- / hovereffect -->
                            </figure><!-- / portfolio-item -->
                        </div><!-- / project -->
                        <div class="card-body">
                            <a href="single-project6.html" class="card-title title-link fs-16 fw-bold">1번 빽스</a>
                            <p class="card-text mt-5 mb-0 fs-14"><b>Skills:</b> Design, Branding</p>
                        </div><!-- / card-body -->
                    </div><!-- / card -->
                </li><!-- / project -->

                <!-- project -->
                <li class="col-md-6 col-lg-4 project" data-groups="[&quot;skill1&quot;]">
                    <div class="card mb-0">
                        <div class="project m-0">
                            <figure class="portfolio-item">
                                <a href="single-project6.html" class="hovereffect">
                                    <img class="img-responsive" src="https://via.placeholder.com/350x180/87CEFA/000000" alt="">
                                    <div class="overlay">
                                    </div><!-- / overlay -->
                                </a><!-- / hovereffect -->
                            </figure><!-- / portfolio-item -->
                        </div><!-- / project -->
                        <div class="card-body">
                            <a href="single-project6.html" class="card-title title-link fs-16 fw-bold">MOUNTAINS</a>
                            <p class="card-text mt-5 mb-0 fs-14"><b>Skills:</b> Design, Illustration</p>
                        </div><!-- / card-body -->
                    </div><!-- / card -->
                </li><!-- / project -->

                <!-- project -->
                <li class="col-md-6 col-lg-4 project" data-groups="[&quot;skill1&quot;]">
                    <div class="card mb-0">
                        <div class="project m-0">
                            <figure class="portfolio-item">
                                <a href="single-project6.html" class="hovereffect">
                                    <img class="img-responsive" src="https://via.placeholder.com/350x180/B0C4DE/000000" alt="">
                                    <div class="overlay">
                                    </div><!-- / overlay -->
                                </a><!-- / hovereffect -->
                            </figure><!-- / portfolio-item -->
                        </div><!-- / project -->
                        <div class="card-body">
                            <a href="single-project6.html" class="card-title title-link fs-16 fw-bold">CAMERON</a>
                            <p class="card-text mt-5 mb-0 fs-14"><b>Skills:</b> Design</p>
                        </div><!-- / card-body -->
                    </div><!-- / card -->
                </li><!-- / project -->
            </ul>
        </div>
    </div>

    <br><br><br><br><br><br>

    <h2 style="text-align: center">선생님을 찾습니다</h2>
    <table class="table text-left" style="width: 80%; margin: 0 auto;">

        <th style="width: 50px;">번호</th>
        <th style="width: 650px;">내용</th>
        <th style="width: 50px;">작성자</th>
        <tr>
            <td>
                1
            </td>
            <td>
                내용1방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을
            </td>
            <td>
                공자
            </td>
        </tr>
        <!-- 테스트 데이터 2~3개 삽입-->
        <tr>
            <td>
                2
            </td>
            <td>
                그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은 웅대한 이 산야에 피어나는 군영과 같이 이상은 실로 인간의 부패를 방지하는
            </td>
            <td>
                맹자
            </td>
        </tr>

        <tr>
            <td>
                3
            </td>
            <td>
                여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는 그것은 웅대한 관현악이며 미묘한 교향악이다 뼈 끝에 스며들어
            </td>
            <td>
                방방
            </td>
        </tr>

    </table>

    <br><br><br><br>

   <!-- footer include  -->
		<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/footer.jsp"></jsp:include> --%>
		
		<%@ include file="/WEB-INF/layout/main/footer.jsp" %>

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

</body></html>

