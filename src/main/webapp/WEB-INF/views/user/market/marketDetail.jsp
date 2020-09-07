<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- nav include  -->
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
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
	width: 970px;
	margin: 0 auto;
	margin-top: 20px;
/*     border: 1px solid #ccc; */
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
  width: 40%;
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


.article .article-title p {
/*   color: #20247b; */
  font-weight: 600;
  font-size: 25px;
  word-wrap: break-word;
  width: inherit;
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
/*     border: 1px solid #ccc; */
    float: left;
    text-align: center;
    position: relative;
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
.finishImg{
	background-color: rgba(200, 200, 200, 0.5);
	width: 100%;
	height: 100%;
	text-align: center;
	vertical-align: middle;
	position: absolute;
	top: 0px;
}

.finishText{
	width: 100px;
	line-height: 30px;
	background-color: rgba(150, 150, 150, 1);
	color: white;
	font-weight: bold;
	border-radius: 5px;
	margin: 139px auto;
}

.btn-finish{
	background-color: #ccc;
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
           <div class="article">
				<h2>${market.MK_TITLE }</h2>
               <div class="userImg">
               		<c:if test="${!empty market.TCH_FILE_RENAME }" >
	                  <img src="${pageContext.request.contextPath }/resources/upload/${market.TCH_FILE_RENAME }" title="" alt="">
               		</c:if>
               		<c:if test="${empty market.TCH_FILE_RENAME }" >
	                  <img src="${pageContext.request.contextPath }/resources/images/rename1.png" title="" alt="">
               		</c:if>
            	  <div class="userInfo">
            	  	<div class="userId">${market.USER_ID }</div>
            	  	<div class="date">${market.MK_DATE }</div>
            	  </div>
               </div>
            	  <div class="text-muted pull-right userAct">
            	  	<c:if test="${chkWriter }">
            	  		<a href="javascript:void(0);" onclick="update(${market.MK_NO });">수정</a> | <a  href="javascript:void(0);" onclick="deleteMK(${market.MK_NO });">삭제</a>
            	  	</c:if>
            	  	<c:if test="${!chkWriter }">
            	  		<a href="">신고</a>
            	  	</c:if>
		          </div>
               <div class="clearfix" ></div>	
               <hr>
               <div>
               <div class="article-img">
               <c:if test="${empty market.MK_THUMB_RENAME }">
                   <img src="${pageContext.request.contextPath }/resources/images/noimage.gif" title="" alt="메인 이미지">
               </c:if>
               <c:if test="${!empty market.MK_THUMB_RENAME }">
                   <img src="${pageContext.request.contextPath }/resources/upload/${market.MK_THUMB_RENAME }" title="" alt="">
                </c:if>
                <c:if test="${market.MK_STATE eq 1 }">
                	<div class="finishImg">
               			<div class="finishText">판매 완료</div>
               		</div>
                </c:if>
               </div>
               <div class="article-title">
               		<div class="mkTitle">
               			<c:if test="${market.MK_STATE eq 0 }" >
		                   <h6 class="sale">판매중</h6>
               			</c:if>
               			<c:if test="${market.MK_STATE eq 1 }" >
		                   <h6 class="finish">판매완료</h6>
               			</c:if>
						<div><p>${market.MK_TITLE }</p></div>
	                   <div>
	                   	<h4>${market.MK_PRICE }원</h4>
	                   </div>
	                   <c:if test="${chkWriter }">
	                   		<c:if test="${market.MK_STATE eq 0 }">
			                  	 <button type="button" class="btn btn-success" id="BtnFinishSales">판매 끝내기</button>
	                   		</c:if>
	                   		<c:if test="${market.MK_STATE eq 1 }">
			                  	 <button type="button" class="btn btn-finish" disabled="disabled">판매완료</button>
	                   		</c:if>
                   		</c:if>
	                   <c:if test="${!chkWriter }">
	                   		<c:if test="${market.MK_STATE eq 0 }">
		                  		<button type="button" class="btn btn-info" id="BtnChat">채팅하기</button>
	                   		</c:if>
	                   		<c:if test="${market.MK_STATE eq 1 }">
			                  	 <button type="button" class="btn btn-finish" disabled="disabled">판매완료</button>
	                   		</c:if>
                   		</c:if>
                   </div>
               </div>
               </div>
               <div class="clearfix" ></div>
               <hr>
               <div class="article-content">
                   <p>${market.MK_CONTENT }</p>
                   <div class="mkFiles">
                   <c:if test="${!empty files }">
                   <c:forEach items="${files }" var="file">
               			<img class="files" alt="" src="${pageContext.request.contextPath }/resources/upload/${file.mkFileRename }"/>
                   </c:forEach>
                   </c:if>
                   </div>
                   
               </div>
               <br><br>
               
               <div style="font-size: 14px; font-weight: bold;">
               	댓글 <i class="fa fa-comment-o" aria-hidden="true"></i>
               </div>
               <hr style="margin: 5px 0;">
               
		        <div class="comment-wrapper">
		                <div class="panel-body">
		                	<div>
			                    <textarea class="form-control" placeholder="댓글 내용을 입력하세요" rows="3"></textarea>
			                    <button type="button" class="btn btn-info pull-right" id="BtncommWrite">댓글 달기</button>
		                    </div>
		                    <div class="clearfix"></div>
		                    <hr>
		                    <ul class="media-list">
		                        <li class="media">
		                            <a href="#" class="pull-left">
		                                <img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">
		                            </a>
		                            <div class="media-body">
		                                <span class="text-muted pull-right">
		                                    <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
		                                </span>
		                                <strong class="text-success">@MartinoMont</strong>
		                                <p>
		                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		                                    Lorem ipsum dolor sit amet, <a href="#">#consecteturadipiscing </a>.
		                                </p>
		                            </div>
		                        </li>
		                    </ul>
		                </div>
		            </div>
               
           </div>
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

