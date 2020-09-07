<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- nav include  -->
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">		
	
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

#marketBox{
	width: 1000px;
	margin: 0 auto;
}

#marketBox{
	width: 1000px;
	margin-top: 20px;
    border: 1px solid #ccc;
	border-radius: 5px;

}

.marketBan{
	font-size: 30px;
	background: linear-gradient(to right, rgba(61,205,188,1) 0%, rgba(51,161,189,1) 100%);
	height: 200px;
	vertical-align: middle;
}

.marketBan h1{
	margin-left: 100px;
	color: white;
}
.userImg{
	float: left;
}

.userImg img{
	width: 50xp;
	height: 50px;
	border-radius: 25px;
	margin-right: 20px;
	float: left;
}
.userImg .userInfo{
	float: left;
}
.userImg .userInfo .userId{
	font-weight: bold;
}
.userImg .userInfo .date{
	font-size: 14px;
}


.article {
  overflow: hidden;
  padding: 30px;
  width: 1000px;
  margin: 0 auto;
}
.article .article-title {
  width: 30%;
  float: left;
  height: 300px;
}

.article .article-title .mkTitle{
	height: 186px;
	margin: 0 10px;
	padding: 10px;
}

.article .article-title h6 {
  font-size: 14px;
  font-weight: 700;
  margin-bottom: 5px;
}

.article .article-title h6.sale{
	border: 2px soild #00C60F;
	color: #00C60F;
}

.article .article-title h6.finish{
	border: 2px soild #ccc;
	color: #ccc;
}


.article .article-title h2 {
/*   color: #20247b; */
  font-weight: 600;
}
.article .article-title .media {
  padding-top: 10px;
  border-top: 1px dashed #ddd;
  border-bottom: 1px dashed #ddd;
  padding-bottom: 10px;
}
.article .article-content h1,
.article .article-content h2,
.article .article-content h3,
.article .article-content h4,
.article .article-content h5,
.article .article-content h6 {
  color: #20247b;
  font-weight: 600;
  margin-bottom: 15px;
}
.article .article-content blockquote {
  max-width: 600px;
  padding: 15px 0 30px 0;
  margin: 0;
}
.article .article-content blockquote p {
  font-size: 20px;
  font-weight: 500;
  color: #fc5356;
  margin: 0;
}
.article .article-content blockquote .blockquote-footer {
  color: #20247b;
  font-size: 16px;
}
.article .article-content blockquote .blockquote-footer cite {
  font-weight: 600;
}
.article .tag-cloud {
  padding-top: 10px;
}
.article-img {
    width: 60%;
    height: 300px;
    vertical-align: middle;
    border: 1px solid #ccc;
    float: left;
    text-align: center;
}
.article-img img{
	height: 99%;
	
}

.comment-wrapper .panel-body {
    max-height:650px;
    overflow:auto;
}

.comment-wrapper .panel-body textarea{
	width: 750px;
	display: inline-block;

}

.comment-wrapper .media-list .media img {
    width:50px;
    height:50px;
    border:2px solid #e5e7e8;
}

.comment-wrapper .media-list .media {
    border-bottom:1px dashed #efefef;
    margin-bottom:25px;
}

#BtncommWrite{
	margin: 0;
}
.userAct{
	margin-top: 27px;
}

.userAct a{
	color: #999;
	font-size: 12px;
}


.files{
	width: 400px;
	display: block;
	margin: 5px auto;
}

.form-control{
	color: black;
}


</style>

<script type="text/javascript">
function update(mkno){
	
	location.href = "${pageContext.request.contextPath}/board/market/update?mkno=" + mkno;
	
}

function deleteMK(mkno){
	
	var chk = confirm("게시글을 삭제하시겠습니까?");
	
	if( chk == true){
		location.href = "${pageContext.request.contextPath}/board/market/delete?mkno=" + mkno;
	}
}




</script>

<body>
	
	<!-- 김헌일 : 중고장터 프론트 초안작성중 0817 ~ ing -->
<!-- 		<div class="marketBan banner"> -->
<!-- 		<h1>중고장터</h1> -->
<!-- 		</div> -->
		
		
	<header id="gtco_header" class="gtco-cover gtco-cover-xs gtco-inner" role="banner">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-12 col-md-offset-0 text-left">
						<div class="display-t">
							<div class="display-tc">
								<div class="row">
									<div class="col-md-8 animate-box">
										<div class="row padding-horizontal-md pull-left banner">
											<div class="row margin-top-xs text title title-xxl text-bold text-white">
												<p><h1>중고장터</h1></p>
											</div>
											<br>
											<div class="row margin-top-xl text title title-xl text-bold text-white pull-left">
												<p><h2>자유롭게 물건들을 팔아보아요</h2></p>
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
     <div class="clearfix" ></div>	
    <div id="marketBox">
    <form>
           <div class="article">
           	<div class="form-group">
			    <input type="text" placeholder="제목" class="form-control" value="${market.MK_TITLE }" />
			</div>
               <div class="userImg">
                  <img src="https://bootdey.com/img/Content/avatar/avatar1.png" title="" alt="">
            	  <div class="userInfo">
            	  	<div class="userId">${market.USER_ID }</div>
            	  	<div class="date"><fmt:parseDate value="${market.MK_DATE }" pattern="yyyyMMdd" var="date"/><fmt:formatDate value="${date }" pattern="yyyy.MM.dd."/></div>
            	  </div>
               </div>
               <div class="clearfix" ></div>	
               <hr>
               <div>
               <div class="article-img">
                   <img src="${pageContext.request.contextPath }/resources/upload/${market.MK_THUMB_RENAME }" title="" alt="메인 이미지">
               </div>
               <div class="article-title">
               		<div class="mkTitle">
	                   <div>
	                   	<input type="number" value="${market.MK_PRICE }" /></h4>
	                   </div>
                   </div>
               </div>
               </div>
               <div class="clearfix" ></div>
               <hr>
               <div class="article-content">
               		<textarea class="form-control" rows="5">${market.MK_CONTENT }</textarea>
                   <div class="mkFiles">
                   <c:if test="${!empty files }">
                   <c:forEach items="${files }" var="file">
               			<img class="files" alt="" src="${pageContext.request.contextPath }/resources/upload/${file.mkFileRename }"/>
                   </c:forEach>
                   </c:if>
                   </div>
                   
               </div>
               <br><br>
               
           </div>
           
           </form>
        </div>

	<!-- footer include  -->
	<c:import url="/WEB-INF/layout/main/footer.jsp"></c:import>

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

