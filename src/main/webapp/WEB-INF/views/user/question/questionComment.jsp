<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="/css/bootstrap.css">
</head>
<body>
<!-- <div class="container"> -->
<%--     <form id="commentForm" name="commentForm" method="post"> --%>
<!--     <br><br> -->
<!--         <div> -->
<!--             <div> -->
<!--                 <span><strong>Comments</strong></span> <span id="cCnt"></span> -->
<!--             </div> -->
<!--             <div> -->
<!--                 <table class="table">                     -->
<!--                     <tr> -->
<!--                         <td> -->
<!--                             <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea> -->
<!--                             <br> -->
<!--                             <div> -->
<%--                                 <a href='#' onClick="fn_comment('${result.code }')" class="btn pull-right btn-success">등록</a> --%>
<!--                             </div> -->
<!--                         </td> -->
<!--                     </tr> -->
<!--                 </table> -->
<!--             </div> -->
<!--         </div> -->
<%--         <input type="hidden" id="b_code" name="b_code" value="${result.code }" />         --%>
<%--     </form> --%>
<!-- </div> -->
<!-- <div class="container"> -->
<%--     <form id="commentListForm" name="commentListForm" method="post"> --%>
<!--         <div id="commentList"> -->
<!--         </div> -->
<%--     </form> --%>
<!-- </div> -->

<form id="commentForm" name="commentForm" method="post">
<input type="hidden" name="questionNo" id="questionNo" value="${detail.question.QUESTION_NO }">
          <div style="font-size: 14px; font-weight: bold;">
           	댓글 <i class="fa fa-comment-o" aria-hidden="true"></i><span id="cCnt"></span>
           </div>
           <hr style="margin: 5px 0;">
           
       <div class="comment-wrapper">
              <div class="panel-body">
              	<div>
                   <textarea class="form-control" id="commContent" name="commContent" placeholder="댓글 내용을 입력하세요" rows="3"></textarea>
                   <button type="button" class="btn btn-info pull-right" onClick="fn_comment('${result.code }')" id="BtncommWrite">댓글 달기</button>
                  </div>
                  <div class="clearfix"></div>
                  <hr>
                  <ul class="media-list">
                      <li class="media">
<!--                       <div id="commimg"></div> -->
                          <div class="media-body">
<!--                           <a href="#" class="pull-left"> -->
<!--                               <img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle"> -->
<!--                           </a> -->
<!--                               <span class="text-muted pull-right"> -->
<!--                                   <i class="fa fa-ellipsis-v" aria-hidden="true"></i> -->
<!--                               </span> -->
<!--                               <strong class="text-success" >@MartinoMont</strong> -->
<!-- 							  <div id="commName"></div> -->
<!--                               <p> -->
<!--                                   Lorem ipsum dolor sit amet, consectetur adipiscing elit. -->
<!--                                   Lorem ipsum dolor sit amet, <a href="#">#consecteturadipiscing </a>. -->
<!--                               </p> -->
							  <div id="commentList"></div>
                          </div>
<!-- 						</div> -->
                      </li>
                  </ul>
              </div>
          </div>
          
                <%-- <div class="comment-wrapper">
                <div class="panel-body">
                	<div>
	                    <textarea class="form-control" id="commContent" name="commContent" placeholder="댓글 내용을 입력하세요" rows="3"></textarea>
	                     <button type="button" class="btn btn-info pull-right" onClick="fn_comment('${result.code }')" id="BtncommWrite">댓글 달기</button>
                    </div>
                    <div class="clearfix"></div>
                    <hr>
                    <ul class="media-list">
                   	 <c:if test="${empty comm }">
                   	 	<div>댓글이 없습니다.</div>
                   	 </c:if>
                   	 <c:if test="${!empty comm }">
                   	 	<c:forEach items="${comm }" var="comm">
                        <li class="media">
                        	<c:if test="${comm.COMM_CLASS eq 2 }">
                        		<span class="pull-left"><i class="fa fa-reply fa-rotate-180" aria-hidden="true"></i></span>
                            </c:if>
                            <div class="text-muted pull-right userCommAct">
			            	  	<c:if test="${comm.USER_NO eq commWriter }">
			            	  		<a href="javascript:void(0);" onclick="commUpdate(${question.QUESTION_NO });">수정</a> | <a  href="javascript:void(0);" onclick="commDelete(${question.QUESTION_NO });">삭제</a>
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
                            <div class="media-body">
                                <strong class="text">${comm.USER_ID }</strong>
                                <p>${comm.COMM_CONTENT }</p>
                                <small>${comm.COMM_DATE }</small>
                            </div>
                        </li>
                   	 	</c:forEach>
                       </c:if>
                    </ul>
                </div>
            </div> --%>

    </form>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
 
<script>
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='/board/question/addcomment'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#commContent").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    getReCommentList();
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    $.ajax({
        url : '<c:url value='/board/question/commentlist'/>',
        type : 'get',
        data : $("#commentForm").serialize(),
        success : function(data){
            var a =''; 
            var name = '';
            console.log(data);
            var cCnt = data.length;
            $.each(data, function(key, value){ 
            	if(value.COMM_CLASS == 1){
            		a += '<span class="pull-left"><i class="fa fa-reply fa-rotate-180" aria-hidden="true"></i></span>'
            	}
                if(value.COMM_CLASS == 0){
                	
	            	if(value.TCH_FILE_RENAME == null || value.TCH_FILE_RENAME == ""){
		            	a += '<a href="#" class="pull-left">'+
		                '<img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">'+
		                '</a>';
	            	}else{
		            	a += '<a href="#" class="pull-left">'+
		                '<img src="${pageContext.request.contextPath }/resources/upload/'+value.TCH_FILE_RENAME+'" alt="" class="img-circle">'+
		                '</a>';
	            	}
	            	
		//                 a += '<div class="media-body">'+
		                a += '<span class="text-muted pull-right">'+
		                '<i class="fa fa-ellipsis-v" aria-hidden="true"></i>'+
		            	'</span>';
		//                 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
		//                 name += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.userNo;
		                a += '<strong class="text-success" >'+value.USER_ID+'<strong>';
		//                 a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>';
		//                 a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
		//                 a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.commContent +'</p>';
		                a += '<div class="commentContent'+value.cno+'"> <p>'+value.COMM_CONTENT + '<br>'+ '<small>'+value.COMM_DATE+'</small>'+'</p>';
		                a += '</div></div></div>';
		                a += '<div id="no'+value.COMM_NO +'"></div>';
		                a += '<hr>';
		//                 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
		//                 name += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.userNo;
		//                 a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>';
		//                 a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
		//                 a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.commContent +'</p>';
		//                 a += '</div></div>';
                }
            });
//             $("#commimg").html(img);
            $("#cCnt").html(cCnt);
            $("#commentList").html(a);
            
        }
    });

}
</script>
 
</body>
</html>    
