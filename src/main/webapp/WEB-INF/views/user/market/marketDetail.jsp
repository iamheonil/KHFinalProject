<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- nav include  -->
<%@ include file="/WEB-INF/layout/main/header.jsp" %>
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
	color: black;
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
  font-size: 18px;
  word-wrap: break-word;
  width: inherit;
  height: 164px;
  line-height: 28px;
  color: black;
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
.article .article-content p {
	font-size: 16px;
	color: black;
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
.media {
    margin-top: 10px;
}

/* .comment-wrapper .panel-body { */
/*     max-height:650px; */
/*     overflow:auto; */
/* } */

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
/*     margin-bottom: 25px; */
}

#BtncommWrite{
	margin: 0;
	height: 67px;
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
/* 	font-weight: bold; */
	border-radius: 5px;
	margin: 139px auto;
}

.btn-finish{
	background-color: #ccc;
}

.media-body{
	margin-bottom: 5px;

}

.media-body strong{
	font-size: 15px;
	color: black;
}

.media-body p{
	font-size: 15px;
	color: black;
}
.media-body small{
	font-size: 12px;
}

.userCommAct a{
	color: #999;
	font-size: 12px;
}

#BtnGoList{
	border: none;
	line-height: 35px;
	background: #ddd;
}

.deletedComm{
	margin: 10px;
}

.btn-update{
	padding-left: 10px;
	padding-right: 10px;
}
.comm-body{
    padding-left: 10px;
}

.comment-wrapper .panel-body textarea.updateTextarea{
	width: 650px;
}

</style>

<script type="text/javascript">
function update(mkno){
	
	location.href = "${pageContext.request.contextPath}/board/market/update?mkno=" + mkno;
	
}

function updateMK(mkno){
	
	var chk = confirm("게시글을 수정하시겠습니까?");
	
	if( chk == true){
		location.href = "${pageContext.request.contextPath}/board/market/update?mkno=" + mkno;
	}
}

function deleteMK(mkno){
	
	var chk = confirm("게시글을 삭제하시겠습니까?");
	
	if( chk == true){
		location.href = "${pageContext.request.contextPath}/board/market/delete?mkno=" + mkno;
	}
}

function finishSales(mkno){
	
	var chk = confirm("판매를 완료하시겠습니까?");
	
	if( chk == true){
		location.href = "${pageContext.request.contextPath}/board/market/finish?mkno=" + mkno;
	}
	
	
}
function goList(){
	location.href="${pageContext.request.contextPath}/board/market";
}

function addComm(mkno){
	
	var commContent = $("#commContent").val();
	
	if( commContent != null && commContent != ''){
		var url = "<%=request.getContextPath() %>/board/market/addcomm";
		// 비동기 처리
		$.ajax({
			type : "POST",
			url: url,
			data: {mkno : mkno, commContent : commContent },
			success : function(result) {
				
				if( result != null){
					var li = '';
					li += '<li class="media comm0">';
					li += '<div class="commExist">';
					li += '<div class="text-muted pull-right userCommAct">';
					li += '<a href="javascript:void(0);" onclick="commUpdate(';
					li += result.MK_COMM_NO;
					li += ', this);">수정</a> | <a  href="javascript:void(0);" onclick="commDelete(';
					li += result.MK_COMM_NO;
					li += ', this);">삭제</a>';
					li += '</div>';
					li += '<a href="#" class="pull-left">';
					if(result.TCH_FILE_RENAME == null ){
						li += '<img src="${pageContext.request.contextPath}/resources/images/rename1.png" alt="" class="img-circle">';
					}else{
						li += '<img src="${pageContext.request.contextPath}/resources/upload/' + result.TCH_FILE_RENAME + '" alt="" class="img-circle">';
					}
					li += '</a>';
					li += '<div class="media-body comm-body">';
					li += '<strong class="text">' + result.USER_ID + '</strong>';
					li += '<p>' + result.MK_COMM_CONTENT + '</p>';
					li += '<small>' + result.MK_COMM_DATE + '</small>';
					li += '&nbsp;&nbsp;&nbsp;<small><a href="javascript:void(0);" onclick="addRecomm(';
					li +=  mkno + ', ' +  result.MK_COMM_NO
					li += ', this );">답글달기</a></small>';
					li += '</div>';
					li += '</div>';
					li += '</li>';
	        
					$("#commList").append(li);
					$("#commContent").val("");
					
				    var offset = $("#commList li:last-child").offset();
			        $('html, body').animate({scrollTop : offset.top}, 400);
				}else{
					alert("로그인이 필요합니다.");
					location.href="<%=request.getContextPath() %>/main/login";
				}
			},
			error : function(){
				alert("ajax 실패")
			}
		});
	}
	
}


function commUpdate(mkCommNo, target){
	
	if(	$(target).parents("li.media").next().hasClass('reComm') === true ){
		alert("답글을 다는 중에는 댓글을 수정할 수 없습니다.")
	}else{
		
		var org = $(target).parents("li.media").find("p").text();
		
		var el = '';
		el += '<div class="updateBox"><textarea class="form-control updateTextarea" placeholder="댓글 내용을 입력하세요" rows="3">';
		el += $(target).parents("li.media").find("p").html();
		el += '</textarea>';
	    el += '<button type="button" class="btn btn-disable btn-update pull-right" onclick="commUpdateCancel(this);">취소</button>';   
		el += '<button type="button" class="btn btn-info btn-update pull-right" onclick="updateCommSub(';
		el += mkCommNo;
		el += ', this );" class="BtncommUpdate">수정</button>';
		el += '<input type="hidden" class="inputCancel" value="' + org + '"/>';
		el += '</div>';	
		$(target).parents("div.commExist").find("p").replaceWith(el);
	}
	
	
}

function commUpdateCancel(target){
	
	var org = $(target).next().next("input.inputCancel").val();
	
	var p = '';
	p += '<p class="pCommContent">';
	p += org;
	p += '</p>';
	$(target).parents("li.media").find("div.updateBox").replaceWith(p);
}

function updateCommSub(mkCommNo, target){
	var commContent = $(target).prev().prev("textarea.updateTextarea").val();
	if( commContent != null && commContent != ''){
		var url = "<%=request.getContextPath() %>/board/market/updatecomm";
		// 비동기 처리
		$.ajax({
			type : "POST",
			url: url,
			data: {mkCommNo : mkCommNo,  commContent : commContent },
			success : function(result) {
				if(result > 0){
					
					var p = '';
					p += '<p class="pCommContent">';
					p += commContent;
					p += '</p>';
					$(target).parents("li.media").find("div.updateBox").replaceWith(p);
				}
			},
			error : function(){
				alert("ajax 실패")
			}
		});
	}
	
	
}


function addRecomm(mkno, mkCommNo, target){
	if(	$(target).parents("li.media").next().hasClass('reComm') === true ){
		$(target).parents("li.media").next().remove();
	}else{
		var el = '';
		el += '<li class="media reComm">';
		el += '<span class="pull-left"><i class="fa fa-reply fa-rotate-180" aria-hidden="true"></i></span>';
		el += '<textarea class="form-control" required="required" placeholder="댓글 내용을 입력하세요" class="recommContent" rows="3"></textarea>';
		el += '<button type="button" class="btn btn-info btn-update pull-right" onclick="recommAddSub(';
		el += mkno + ', ' + mkCommNo + ', this';
		el += ' );">등록</button>';	
		el += '</li>';
		
		$(target).parents("li.media").after(el);	
	}
	
}

function recommAddSub(mkno, mkParentCommNo, target){
var recommContent = $(target).prev('textarea').val();
	
	if( recommContent != null && recommContent != ''){
		var url = "<%=request.getContextPath() %>/board/market/addrecomm";
		// 비동기 처리
		$.ajax({
			type : "POST",
			url: url,
			data: {mkno : mkno, mkParentCommNo : mkParentCommNo,  recommContent : recommContent },
			success : function(result) {
				if( result != null){
					var li = '';
					li += '<li class="media comm' + mkParentCommNo + '">';
					li += '<span class="pull-left"><i class="fa fa-reply fa-rotate-180" aria-hidden="true"></i></span>';
					li += '<div class="commExist">';
					li += '<div class="text-muted pull-right userCommAct">';
					li += '<a href="javascript:void(0);" onclick="commUpdate(';
					li += result.MK_COMM_NO;
					li += ', this);">수정</a> | <a  href="javascript:void(0);" onclick="commDelete(';
					li += result.MK_COMM_NO;
					li += ', this);">삭제</a>';
					li += '</div>';
					li += '<a href="#" class="pull-left">';
					if(result.TCH_FILE_RENAME == null ){
						li += '<img src="${pageContext.request.contextPath}/resources/images/rename1.png" alt="" class="img-circle">';
					}else{
						li += '<img src="${pageContext.request.contextPath}/resources/upload/' + result.TCH_FILE_RENAME + '" alt="" class="img-circle">';
					}
					li += '</a>';
					li += '<div class="media-body comm-body">';
					li += '<strong class="text">' + result.USER_ID + '</strong>';
					li += '<p>' + result.MK_COMM_CONTENT + '</p>';
					li += '<small>' + result.MK_COMM_DATE + '</small>';
					li += '</div>';
					li += '</div>';
					li += '</li>';
	        
					var offset;
	// 				console.log(result.MK_PARENT_COMM_NO);
					if( !$("li.comm" + result.MK_PARENT_COMM_NO).length){
						$(target).parents("li.reComm").replaceWith(li);
					}else{
						$(target).parents("li.reComm").remove();
						$(".comm"+mkParentCommNo).last().after(li);
					}
				}else{
					alert("로그인이 필요합니다.");
					location.href="<%=request.getContextPath() %>/main/login";
				}
				
			},
			error : function(){
				alert("ajax 실패")
			}
		});
	}
	
}

function commDelete(mkCommNo, target){
	
	if(	$(target).parents("li.media").next().hasClass('reComm') === true ){
		alert("답글을 다는 중에는 댓글을 삭제할 수 없습니다.")
	
	}else{
		var chk = confirm("댓글을 삭제하시겠습니까?");
		
		if( chk == true){
			var url = "<%=request.getContextPath() %>/board/market/deletecomm";
			// 비동기 처리
			$.ajax({
				type : "POST",
				url: url,
				data: {mkCommNo : mkCommNo },
				success : function(result) {
					
					$(target).parents("div.commExist").html('<div class="deletedComm">삭제된 댓글입니다.</div>');
				},
				error : function(){
					alert("ajax 실패")
				}
			});
		}
	}
}

function singo(){
	
	$("#singoInfo").submit();
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
    <div style="text-align: right;"><button type="button" id="BtnGoList" onclick="goList();">글 목록</button></div>
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
            	  		<a href="javascript:void(0);" onclick="updateMK(${market.MK_NO });">수정</a> | <a  href="javascript:void(0);" onclick="deleteMK(${market.MK_NO });">삭제</a>
            	  	</c:if>
            	  	<c:if test="${!chkWriter }">
            	  		<a href="javascript:void(0);"  onclick="singo();">신고</a>
            	  		<form action="${pageContext.request.contextPath }/board/blacklist" id="singoInfo" method="post">
            	  			<input type="hidden" name="no" value="${market.MK_NO }" />
            	  			<input type="hidden" name="title" value="${market.MK_TITLE }" />
            	  			<input type="hidden" name="board" value="장터" />
            	  		</form>
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
			                  	 <button type="button" class="btn btn-success" onclick="finishSales(${market.MK_NO });">판매 끝내기</button>
	                   		</c:if>
	                   		<c:if test="${market.MK_STATE eq 1 }">
			                  	 <button type="button" class="btn btn-finish" disabled="disabled">판매완료</button>
	                   		</c:if>
                   		</c:if>
	                   <c:if test="${!chkWriter }">
	                   		<c:if test="${market.MK_STATE eq 0 }">
		                  		<a href="${pageContext.request.contextPath}/chat/chatRoom?toID=${market.USER_ID }"><button type="button" class="btn btn-info" id="BtnChat">채팅하기</button></a>
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
	                    <textarea class="form-control" required="required" placeholder="댓글 내용을 입력하세요" id="commContent" rows="3"></textarea>
	                    <button type="button" class="btn btn-info pull-right" onclick="addComm(${market.MK_NO } );" id="BtncommWrite">댓글 달기</button>
                    </div>
                    <div class="clearfix"></div>
                    <hr>
                    <ul class="media-list" id="commList">
                   	 	<c:forEach items="${comms }" var="comm">
                        <li class="media comm${comm.MK_PARENT_COMM_NO }">
                        <c:if test="${comm.MK_COMM_STATE eq 1 }">
                       		<c:if test="${comm.MK_COMM_CLASS eq 2 }">
                        		<span class="pull-left"><i class="fa fa-reply fa-rotate-180" aria-hidden="true"></i></span>
                            </c:if>
                        	<div class="deletedComm">삭제된 댓글입니다.</div>
                        </c:if>
                        <c:if test="${comm.MK_COMM_STATE eq 0 }">
                        	<c:if test="${comm.MK_COMM_CLASS eq 2 }">
                        		<span class="pull-left"><i class="fa fa-reply fa-rotate-180" aria-hidden="true"></i></span>
                            </c:if>
							<div class="commExist">
	                            <div class="text-muted pull-right userCommAct">
				            	  	<c:if test="${comm.MK_USER_NO eq commWriter }">
				            	  		<a href="javascript:void(0);" onclick="commUpdate(${comm.MK_COMM_NO }, this);">수정</a> | <a  href="javascript:void(0);" onclick="commDelete(${comm.MK_COMM_NO }, this);">삭제</a>
				            	  	</c:if>
						         </div>
	                            <a href="#" class="pull-left">
	                            	<c:if test="${empty comm.TCH_FILE_RENAME }">
		                                <img src="${pageContext.request.contextPath}/resources/images/rename1.png" alt="" class="img-circle">
	                            	</c:if>
	                            	<c:if test="${!empty comm.TCH_FILE_RENAME }">
		                                <img src="${pageContext.request.contextPath}/resources/upload/${comm.TCH_FILE_RENAME }" alt="" class="img-circle">
	                            	</c:if>
	                            </a>
	                            <div class="media-body comm-body">
	                                <strong class="text">${comm.USER_ID }</strong>
	                                <p class="pCommContent">${comm.MK_COMM_CONTENT }</p>
	                                <small>${comm.MK_COMM_DATE }</small>
	                                 <c:if test="${comm.MK_COMM_CLASS eq 1 }">
		                                &nbsp;&nbsp;&nbsp;<small><a href="javascript:void(0);" onclick="addRecomm(${market.MK_NO }, ${comm.MK_COMM_NO }, this );">답글달기</a></small>
		                            </c:if>
	                            </div>
	                         </div>
						</c:if>
                        </li>
                   	 	</c:forEach>
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