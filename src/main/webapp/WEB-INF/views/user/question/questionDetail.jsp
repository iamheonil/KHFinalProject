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

#questionBox{
	width: 1000px;
	margin: 0 auto;
}

#questionBox{
	width: 1000px;
	margin-top: 20px;
/*     border: 1px solid #ccc; */
	border-radius: 5px;

}

.questionBan{
	font-size: 30px;
	background: linear-gradient(to right, rgba(61,205,188,1) 0%, rgba(51,161,189,1) 100%);
	height: 200px;
	vertical-align: middle;
}

.questionBan h1{
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
/*     overflow:auto; */
 	display: inline-block; 
}

.comment-wrapper .panel-body textarea{
	width: 750px;
	display: inline-block;
	margin-right: 10px;

}

.comment-wrapper .media-list .media img {
    width:50px;
    height:50px;
    border:2px solid #e5e7e8;
    margin-right: 10px;
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
	display: block;
	margin: 5px auto;
}
.article-content p{
	font-size: 20px;
}

.media-body p{
	font-size: 15px;
	color: black;
}
.media-body small{
	font-size: 12px;
}

.fa-mail-reply:before, .fa-reply:before{
	margin-left: 15px;
}
.media-body strong{
	color: black;
}
</style>

<script type="text/javascript">

function update(mkno){
	
	location.href = "${pageContext.request.contextPath}/board/question/update?mkno=" + mkno;
	
}

function deleteMK(mkno){
	
	var chk = confirm("게시글을 삭제하시겠습니까?");
	
	if( chk == true){
		location.href = "${pageContext.request.contextPath}/board/question/delete?mkno=" + mkno;
	}
}

function updateQuestion(questionNo){
	
	var chk = confirm("게시글을 수정하시겠습니까?");
	
	if( chk == true){
		location.href = "${pageContext.request.contextPath}/board/question/update?questionNo=" + questionNo;
	}
}
function deleteQuestion(questionNo){
	
	var chk = confirm("게시글을 삭제하시겠습니까?");
	
	if( chk == true){
		location.href = "${pageContext.request.contextPath}/board/question/delete?questionNo=" + questionNo;
	}
}


/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='/board/question/addcomment'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
//                 getCommentList();
                $("#commContent").val("");
                location.reload();
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}


/*
 * 대댓글 등록하기(Ajax)
 */
function recommQuestion(commNo){
	
	var a =''; 
	console.log(commNo);
	
	a += '<span class="pull-left"><i class="fa fa-reply fa-rotate-180" aria-hidden="true"></i></span>';
	
	a += '<div class="reComm">'
    	+'<textarea class="form-control" placeholder="댓글 내용을 입력하세요" name="recommContent" id="recommContent" rows="3"></textarea>'
	    + '<button type="button" class="btn btn-info pull-right" id="BtncommWrite" onClick="fn_recomment('+commNo+')">등록</button>'
		+ '</div>';
	
	$("#recomment"+ commNo).html(a);
	
    
//     $.ajax({
//         type:'POST',
//         url : "<c:url value='/board/question/addrecomment'/>",
//         data:$("#commentForm").serialize(),
//         success : function(data){
//             if(data=="success")
//             {
// //                 getCommentList();
//                 $("#commContent").val("");
//                 location.reload();
//             }
//         },
//         error:function(request,status,error){
//             //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//        }
        
//     });
}

/*
 * 대댓글 등록하기(Ajax)
 */
function fn_recomment(parentCommNo){
	
	 var objParams = {
			 questionNo      : $("#questionNo").val(),
             commContent     : $("#recommContent").val(), 
             parentCommNo    : parentCommNo,
     };
	
	var commContent = $('#commContent').val();
    $.ajax({
        type:'POST',
        url : "<c:url value='/board/question/addrecomment'/>",
        data: objParams,
//         $('#commentForm').serialize() + "&parentCommNo="+parentCommNo,
        success : function(data){
            if(data=="success")
            {
		        console.log(data)
//                 getCommentList();
                $("#commContent").val("");
                location.reload();
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
function commUpdateOpen(commNo, commContent, target){
	var a =''; 
	console.log(commNo);
	
// 	if(	$(target).parents("li.media").next().hasClass('reComm') === true ){
// 		alert("답글을 다는 중에는 댓글을 수정할 수 없습니다.");
// 	}
	
	a += '<p class="reComm">'
    	+'<textarea class="form-control" name="recommContent" id="recommContent" rows="3" style="width: 670px;">'+commContent+'</textarea>'
	    + '<button type="button" class="btn btn-info pull-right" id="BtncommWrite" onClick="commUpdate('+commNo+')">완료</button>'
		+ '</p>';
	
// 	$("#update"+commNo).remove();
	$("#update"+ commNo).html(a);
}
	
/*
 * 댓글 수정하기(Ajax)
 */
function commUpdate(commNo){
	
	 var objParams = {
// 			questionNo      : $("#questionNo").val(),
            commContent     : $("#recommContent").val(), 
//             parentCommNo    : parentCommNo,
			commNo : commNo
    };
	 
	var commContent = $('#commContent').val();
    $.ajax({
        type:'POST',
        url : "<c:url value='/board/question/updatecomment'/>",
        data: objParams,
//         $('#commentForm').serialize() + "&parentCommNo="+parentCommNo,
        success : function(data){
            if(data=="success")
            {
		        console.log(data)
//                 getCommentList();
                $("#commContent").val("");
                location.reload();
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}

//댓글 삭제
function commDelete(commNo){
	
	var result = confirm('해당 댓글을 삭제하시겠습니까?');
	if(result){
		
		 var objParams = {
					commNo : commNo
		    };
		 
		console.log(commNo);
	    $.ajax({
	        type:'POST',
	        url : "<c:url value='/board/question/deletecomment'/>",
	        data: objParams,
	//         $('#commentForm').serialize() + "&parentCommNo="+parentCommNo,
	        success : function(data){
	            if(data=="success")
	            {
	// 		        console.log(data)
	//                 getCommentList();
	//                 $("#commContent").val("");
	                location.reload();
	                alert('댓글이 삭제되었습니다.');
	            }
	        },
	        error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	        
	    });
	}else{
		
		alert('삭제가 취소되었습니다.');
	}
	
	
	
}

// 신고
function singo(){
	$("#singoInfo").submit();
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
												<p><h1>질문게시판</h1></p>
											</div>
											<br>
											<div class="row margin-top-xl text title title-xl text-bold text-white pull-left">
												<p><h2>궁금하신 점을 질문하시면 답변해드립니다.</h2></p>
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
    <div id="questionBox">
           <div class="article">
           
           <!-- 신고하기 -->
           <form action="${pageContext.request.contextPath }/board/blacklist" method="post" id="singoInfo">
           		<input type="hidden" name="no" value="${detail.question.QUESTION_NO }">
           		<input type="hidden" name="title" value="${detail.question.QUESTION_TITLE }">
           		<input type="hidden" name="board" value="질문">
           </form>
           
           
           <button onclick="location.href='${pageContext.request.contextPath }/board/question'" style="float: right;">목록</button>
				<h2>${detail.question.QUESTION_TITLE }</h2>
               <div class="userImg">
               		<c:if test="${not empty detail.question.TCH_FILE_RENAME }" >
	                  <img src="${pageContext.request.contextPath }/resources/upload/${detail.question.TCH_FILE_RENAME }" title="" alt="">
               		</c:if>
               		<c:if test="${empty detail.question.TCH_FILE_RENAME }" >
	                  <img src="${pageContext.request.contextPath }/resources/images/rename1.png" title="" alt="">
               		</c:if>
            	  <div class="userInfo">
            	  	<div class="userId">${detail.question.USER_ID }</div>
<%--             	  	<div class="date"><fmt:parseDate value="${question.QUESTION_DATE }" pattern="yyyyMMdd" var="date"/><fmt:formatDate value="${date }" pattern="yyyy.MM.dd."/></div> --%>
            	  	<div class="date">${detail.question.QUESTION_DATE }</div>
            	  </div>
               </div>
                  <div class="text-muted pull-right userAct">
            	  	<c:if test="${loginUser.userNo == detail.question.USER_NO}">
            	  		<a href="javascript:void(0);" onclick="updateQuestion(${detail.question.QUESTION_NO });">수정</a> | <a  href="javascript:void(0);" onclick="deleteQuestion(${detail.question.QUESTION_NO });">삭제</a>
            	  	</c:if>
            	  	<c:if test="${loginAdmin ne null }">
                    <span class="fa-stack" onclick="deleteQuestion(${detail.question.QUESTION_NO });">
                  <i class="fa fa-square fa-stack-2x"></i> <i class="fa fa-trash fa-stack-1x fa-inverse "></i></span>
                    </c:if>
                    
            	  	<c:if test="${loginUser.userNo != detail.question.USER_NO}">
            	  		<span id="singo"><a href="javascript:void(0);" onclick="singo();">신고</a></span>
            	  	</c:if>
		          </div>
               <div class="clearfix" ></div>	
               <hr>
               <div class="article-content">
                   
                   <div class="mkFiles">
                   <c:if test="${not empty detail.flist }">
	                   <c:forEach items="${detail.flist }" var="file">
		               			<img class="files" alt="" style="width: 400px; height: auto;" src="${pageContext.request.contextPath }/resources/upload/${file.Q_FILE_RENAME }"/>
	                   </c:forEach>
                   </c:if>
                   </div>
                   
                   <p>${detail.question.QUESTION_CONTENT }</p>
               </div>
               <br><br>
<form id="commentForm" name="commentForm" method="post">
<input type="hidden" name="questionNo" id="questionNo" value="${detail.question.QUESTION_NO }">               
		               <div style="font-size: 14px; font-weight: bold;">
               	댓글 <i class="fa fa-comment-o" aria-hidden="true"></i><span id="cCnt">${cnt }</span>
               </div>
               <hr style="margin: 5px 0;">
               
        <div class="comment-wrapper">
                <div class="panel-body">
                	<div>
	                    <textarea class="form-control" placeholder="댓글 내용을 입력하세요" name="commContent" rows="3"></textarea>
	                    <button type="button" class="btn btn-info pull-right" id="BtncommWrite" onClick="fn_comment()">댓글 달기</button>
                    </div>
                    <div class="clearfix"></div>
                    <hr>
                    <ul class="media-list">
                   	 <c:if test="${empty comms }">
                   	 	<div>댓글이 없습니다.</div>
                   	 </c:if>
                   	 <c:if test="${!empty comms }">
                   	 	<c:forEach items="${comms }" var="comm">
                        <li class="media">
                        	<c:if test="${comm.COMM_CLASS eq 1 }">
                        		<span class="pull-left"><i class="fa fa-reply fa-rotate-180" aria-hidden="true"></i></span>
                            </c:if>
                            <div class="text-muted pull-right userCommAct">
			            	  	<c:if test="${comm.USER_NO eq commWriter  && comm.Q_COMM_STATE ne 1 }">
			            	  		<c:if test="${comm.COMM_CLASS eq 0 }">
			            	  			<a href="javascript:void(0);" onclick="recommQuestion(${comm.COMM_NO});" id="comment">댓글</a> |
			            	  		</c:if>
			            	  		<a href="javascript:void(0);" onclick="commUpdateOpen(${comm.COMM_NO }, '${comm.COMM_CONTENT }',this);">수정</a> | <a  href="javascript:void(0);" onclick="commDelete(${comm.COMM_NO });">삭제</a>
			            	  	</c:if>
					         </div>
                        <c:if test="${comm.Q_COMM_STATE == 0 }">
                            <a href="#" class="pull-left">
                            	<c:if test="${empty comm.TCH_FILE_RENAME }">
	                                <img src="${pageContext.request.contextPath}/resources/images/rename1.png" alt="" class="img-circle">
                            	</c:if>
                            	<c:if test="${!empty comm.TCH_FILE_RENAME }">
	                                <img src="${pageContext.request.contextPath}/resources/upload/${comm.TCH_FILE_RENAME }" alt="" class="img-circle">
                            	</c:if>
                            </a>
                            <div class="media-body" style="display: inline;" >
                                <strong class="text">${comm.USER_ID }</strong>
                                <p id="update${comm.COMM_NO }">${comm.COMM_CONTENT }</p>
                                <c:if test="${comm.COMM_CLASS eq 1 }">
                                	<small>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;${comm.COMM_DATE }</small>
                                </c:if>
                                <c:if test="${comm.COMM_CLASS eq 0 }">
                                	<small>&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;${comm.COMM_DATE }</small>
                                </c:if>
                            </div>
                        </c:if>    
                        <c:if test="${comm.Q_COMM_STATE == 1 }">
                            <div class="media-body" >
                            	<br>
                                <p>삭제된 댓글입니다.</p>
                                <br>
                            </div>
                        </c:if>    
                        
                        </li>
                        <div id="recomment${comm.COMM_NO }"></div>
                   	 	</c:forEach>
                       </c:if>
                    </ul>
                </div>
            </div>
	</form>               
           </div>
        </div>
<%--       <%@ include file="questionComment.jsp" %> --%>
               
<!--            </div> -->
<!--         </div> -->

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

