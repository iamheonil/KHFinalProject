<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- nav include  -->
<%@ include file="/WEB-INF/layout/main/log_header.jsp" %>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">		
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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

#marketWrite{
	width: 970px;
	margin: 0 auto;
	margin-top: 60px;
}

#price{
	width: 150px;
}


#thumbImg{
	width: 150px;
	height: 150px;
	border: 1px solid #ccc;
	margin: 5px;
}
.form textarea{
	width: 969px;
}

</style>

<script type="text/javascript">


function submitContents(elClickedObj) {
	 // 에디터의 내용이 textarea에 적용된다.
	 oEditors.getById["mkContent"].exec("UPDATE_CONTENTS_FIELD", []);

	 // 에디터의 내용에 대한 값 검증은 이곳에서
	 // document.getElementById("ir1").value를 이용해서 처리한다.
	console.log(elClickedObj);
	 try {
	     elClickedObj.form.submit();
	 } catch(e) {}

}

function goback(){
	history.go(-1);	
}
</script>

<body>
		
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
<div id="marketWrite">
<form class="form" method="post" action="${pageContext.request.contextPath}/board/market/write" enctype="multipart/form-data">
  <div class="form-group" style="font-weight: bold; font-size: 16px;">
	중고장터 글쓰기
	<hr>
  </div>
  <div class="form-group">
    <label>제목</label>
    <input class="form-control" maxlength="100" type="text" name="mkTitle" placeholder="제목" required="required">
  </div>
  <div class="form-group">
    <label>가격</label>
    <input style="width: 200px;" class="form-control" type="number" min="0" name="mkPrice" id="mkPrice" required="required">
  </div>
    <div class="form-group">
      <label>내용</label>
      <textarea maxlength="2000" required="required" class="form-control" id="mkContent" name="mkContent" rows="10" placeholder="물품에 대한 설명을 작성하세요"></textarea>
    </div>
    <div class="form-group">
      <label>썸네일 사진</label>
	    <input type="file" accept="image/*" name="thumb" />
<!-- 	    <div id="thumbImg"></div> -->
    </div>
    <div class="form-group">
      <label>상세 사진</label>
	    <input type="file" accept="image/*" multiple="multiple" name="files" />
    </div>
    <div style="text-align: center;">
	    <button class="btn btn-primary" onclick="submitContents();"><span>글 올리기</span></button>
	    <button class="btn btn-disable" type="button" onclick="goback();"><span>취소</span></button>
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
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "mkContent",
 sSkinURI: "${pageContext.request.contextPath }/resources/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});
</script>
</body>
</html>

