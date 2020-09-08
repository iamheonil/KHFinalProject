<!-- 200904 이서연 -->
<!-- 메인 > 상단메뉴 > 커뮤니티 > 후기게시판 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script type="text/javascript"
src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- nav include  -->
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>


<!-- 배너 css link -->
<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/HisearchBar.css">	

<!-- content css ling -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<!-- 배너 -->
<style type="text/css">

@import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');

.banner h1,.banner h2{
	font-family: 'NanumSquareRound', sans-serif !important;
    font-weight: bolder !important;
}

.banner h1{ margin-top:20px; }

.banner{ margin-top:120px; }

</style>


<!-- 본문 -->
<style type="text/css">
	
h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
    font-weight: 600;
}
	
.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid transparent;
	border-radius: 0;
	margin-bottom: 30px;


}
.card-body {
    flex: 1 1 auto;
    padding: 1.3rem;
    
    background: #f0f0f087;
    border: 1px solid #eee;
   	
    height: 350px;
    position: relative;
}

.card p{
	font-family: "Raleway", Arial, sans-serif;
    font-weight: 400;
    font-size: 16px;
    line-height: 1.7;
}
.note-has-grid .nav-link {
    padding: .5rem
}
.note-has-grid .single-note-item .card {
    border-radius: 10px;
}
.note-has-grid .single-note-item .favourite-note {
    cursor: pointer
}

.note-has-grid .single-note-item .category-dropdown.dropdown-toggle:after {
    display: none
}

.note-has-grid .single-note-item .category [class*=category-] {
    height: 15px;
    width: 15px;
    display: none
}

.note-has-grid .single-note-item .category [class*=category-]::after {
    content: "\f0d7";
    font: normal normal normal 14px/1 FontAwesome;
    font-size: 12px;
    color: #fff;
    position: absolute
}

.note-has-grid .single-note-item.note-business .category .category-business {
    display: inline-block
}
.note-has-grid .single-note-item.note-social .category .category-social {
    display: inline-block
}
.note-has-grid .single-note-item.note-important .category .category-important {
    display: inline-block
}

.note-has-grid .single-note-item.all-category .more-options,
.note-has-grid .single-note-item.all-category.note-favourite .more-options {
    display: block
}

.note-has-grid .single-note-item.all-category.note-business .more-options,
.note-has-grid .single-note-item.all-category.note-favourite.note-business .more-options,
.note-has-grid .single-note-item.all-category.note-favourite.note-important .more-options,
.note-has-grid .single-note-item.all-category.note-favourite.note-social .more-options,
.note-has-grid .single-note-item.all-category.note-important .more-options,
.note-has-grid .single-note-item.all-category.note-social .more-options {
    display: none
}

@media (max-width:767.98px) {
	.note-has-grid .single-note-item {
	    max-width: 100%
	}
}

@media (max-width:991.98px) {
    .note-has-grid .single-note-item {
        max-width: 216px
    }
}
 
.modal-header { background: #17b7945e; } 
 
.modal-header .close {
    margin-top: -20px;
} 

.note-title {
	margin: 10px 0 0;
	text-align: center;
}
                
.star { 
	color: #ffeb00;
	font-size: 20px;
}

.note-content {
	height: 135px;
    margin: 10px;
    overflow: auto;
}
                    
.note-info {
    position: absolute;
    text-align: left;
    left: 8%;
    bottom: 5%;
}

p.note-title {
	color: black;
	font-size: 16px;
	font-weight: bolder;
}

span#singo a {
	color: #777777;
    font-size: 12px;
    position: absolute;
    right: 8%;
    bottom: 18px;
}

span#singo:hover a {
	color: #777777;
	text-decoration: underline;
}

div.col-md-12 { margin-bottom: 15px; }

.star_on { color: #ffeb00; }

.buttonA { 
	background-color: #17B794; 
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
    font-size: 16px;
    padding: 10px;
    border-radius: 5px;
    cursor: pointer;
    margin-right: 1px;
}

.buttonB { 
	background-color: #555555;
    border: none;
    color: white;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    padding: 10px;
    border-radius: 5px;
    cursor: pointer;
}

.buttonC { /* 검색버튼 */
	background-color: #eee; 
	color: #666;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	padding: 4px;
	border: 1px solid #aaa;
	border-radius: 3px;
	cursor: pointer;
	width: 60px;
    height: 35px;
    margin-left: 7px;
}

.buttonC:hover { /* 검색버튼 */
	background-color: #dfdfdf; 
	
}
.pagingstyle{
 	width: 50%; 
 	margin: 0 auto;
}

#serchbox{
    float: right;
    width: 270px;
    margin: 0 auto;
    padding: 20px;
}

#row {
    position: relative;
    margin-top: 97px;
}

#form-control {
	width: 180px;
    position: absolute;
    right: 25%;
    height: 35px;
}

.input-group-btn{
	position: absolute;
    right: 25%;
}


</style>



<script type="text/javascript">
$(function() {

	//모달창 띄우기
    $('#add-notes').on('click', function(event) {
        $('#addnotesmodal').modal('show');
        $('#btn-n-add').show();

    })

    //작성 버튼 클릭 시
    $("#btn-n-add").on('click', function(event) {
    	
        var noteTitle = document.getElementById('note-has-title').value; //conn_lesson_no
        var noteStar = document.getElementById('note-has-star').value; //내용
        var noteDesc = document.getElementById('note-has-description').value; //별점
        
//         console.log(noteTitle)
//         console.log(noteStar)
//         console.log(noteDesc)
        
        
        if(noteTitle == 0 || noteStar == "" || noteDesc == ""){
        	
        	alert('모든 항목을 작성해주세요.')
        }
        
        if(noteTitle != 0 && noteStar != "" && noteDesc != "" && noteDesc.length < 20) {
        	
        	alert('최소 20글자 이상 작성하셔야 합니다.')
        }
        
		if(noteTitle != 0 && noteStar != "" && noteDesc != "" && noteDesc.length > 300) {
        	
        	alert('최대 300글자 이하 작성하셔야 합니다.')
        }
        
        if(noteTitle != 0 && noteStar != "" && noteDesc != "" && noteDesc.length >= 20 && noteDesc.length <= 300){ //전부 작성해야 submit
        	
        	alert('후기를 등록하시겠습니까?')
	        $('#addnotesmodal').modal('hide');
        	$("#addnotesmodalTitle").submit();
        }
        
    });

    
    //모달이 닫히면서 실행되는 함수 - 모달 내용 초기화
    $('#addnotesmodal').on('hidden.bs.modal', function (event) {
    	
        event.preventDefault();
        
        document.getElementById('note-has-title').value = '';
        document.getElementById('note-has-description').value = '';
        $('#mstar i').parent().children("i").removeClass("star_on"); 
        document.getElementById('note-has-star').value = '';
        
    })
    
})
</script>


<!-- 모달 - 별점 -->
<script type="text/javascript">
$(document).ready(function(){
	
	$('#mstar i').click(function (){
		
// 		console.log('clicked')
		
	    $(this).parent().children("i").removeClass("star_on");  /* 별점의 star_on 클래스 전부 제거 */ 
	    $(this).addClass("star_on").prevAll("i").addClass("star_on"); /* 클릭한 별과, 그 앞 까지 별점에 star_on 클래스 추가 */
	    
	    var starpoint = this.id;
		
	    console.log(starpoint);
	    
	    $('#note-has-star').attr("value", starpoint)
		    
	    return false;
	});
	
});
</script>


<!-- 신고 -->
<script type="text/javascript">

function singo(REVIEW_NO, REVIEW_CONTENT){
	
	var no = REVIEW_NO;
	var content = REVIEW_CONTENT;
	
    document.getElementById('singoNo').value = no;
	document.getElementById('singoTitle').value = content;
	
	$("#singoInfo").submit();

}

</script>



<header id="gtco_header" class="gtco-cover gtco-cover-xs gtco-inner" role="banner">
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-12 col-md-offset-0 text-left">
				<a href="${pageContext.request.contextPath}/board/review"><div class="display-t">
					<div class="display-tc">
						<div class="row">
							<div class="col-md-8 animate-box">
								<div class="row padding-horizontal-md pull-left banner">
									<div class="row margin-top-xs text title title-xxl text-bold text-white">
										<p><h1>후기 게시판</h1></p>
									</div>
									<br>
									<div class="row margin-top-xl text title title-xl text-bold text-white pull-left">
										<p><h2>과외 후기를 작성하거나 볼 수 있어요</h2></p>
									</div>
								</div>
<!-- 								<div class="row padding-horizontal-md pull-right banner" id="bannerImg"> -->
<%-- 									<img alt="" src="${pageContext.request.contextPath}/resources/images/people.png" style="height: 350px;"> --%>
<!-- 								</div> -->
							</div>	
						</div>
					</div>
				</div></a>
			</div>
		</div>
	</div>
</header>

<!-- <div class="clearfix"></div>   -->



<!-- 후기 작성 버튼 -->
<div class="container">
	<div class="row bootstrap snippets bootdeys">
	    <div class="page-content container note-has-grid">
	    
				<!--  검색 -->
				<div id="serchbox" >
					<form action="${pageContext.request.contextPath}/board/review/search" method="get">
						<div class="row" id="row">
							<input type="text" id="form-control" placeholder="과외명을 입력하세요" name="keyword">
							<span class="input-group-btn">
								<button class="buttonC" type="submit">검색</button>
							</span>
						</div>
					</form>
				</div>
			
			
			<c:if test="${session.userActor eq 1 }">
			    <ul class="nav nav-pills p-3 bg-white mb-3 rounded-pill align-items-center">  
			        <li class="nav-item ml-auto" style="margin-top: 115px;">
		            	<span class="d-none d-md-block font-14"></span>
			        </li>
			    </ul>
		    </c:if>
			
	    	<c:if test="${session.userActor eq 2 }">
			    <ul class="nav nav-pills p-3 bg-white mb-3 rounded-pill align-items-center">  
			        <li class="nav-item ml-auto" style="margin-top: 115px;">
			            <a href="javascript:void(0)" class="nav-link btn-primary rounded-pill d-flex align-items-center px-3" id="add-notes">
			            	<span class="d-none d-md-block font-14">후기 작성</span>
			           	</a>
			        </li>
			    </ul>
		    </c:if>
	    
	    	<br><br>
	    
	    	<c:if test="${empty review}">
	    		<div style="text-align: center; margin: 100px 0 150px;">
	    			<span >등록된 후기가 없습니다</span>
	    		</div>
	    	
	    	</c:if>
	    
	    	<c:if test="${not empty review}">
	    	
			    <div class="tab-content bg-transparent">
			        <div id="note-full-container" class="note-has-grid row">
			        
			        	<c:forEach items="${review}" var="r">

				            <div class="col-md-3 single-note-item all-category">
				                <div class="card card-body">
				                
				                    <p class="note-title">${r.LESSON_TITLE}</p>
				                    <h5 class="note-title">${r.USER_NAME} 선생님</h5>
				                    <c:if test="${r.STAR_POINT eq 1}">
					                    <span class="note-title star"><i class="fa fa-star"></i></span>
				                    </c:if>
				                    <c:if test="${r.STAR_POINT eq 2}">
				                    	<span class="note-title star">
					                    	<c:forEach begin="0" end="1">
						                  		<i class="fa fa-star"></i>
						                    </c:forEach>
					                    </span>
				                    </c:if>
				                    <c:if test="${r.STAR_POINT eq 3}">
				                    	<span class="note-title star">
					                    	<c:forEach begin="0" end="2">
						                  		<i class="fa fa-star"></i>
						                    </c:forEach>
					                    </span>
				                    </c:if>
				                    <c:if test="${r.STAR_POINT eq 4}">
				                    	<span class="note-title star">
					                    	<c:forEach begin="0" end="3">
						                  		<i class="fa fa-star"></i>
						                    </c:forEach>
					                    </span>
				                    </c:if>
				                    <c:if test="${r.STAR_POINT eq 5}">
				                    	<span class="note-title star">
					                    	<c:forEach begin="0" end="4">
						                  		<i class="fa fa-star"></i>
						                    </c:forEach>
					                    </span>
				                    </c:if>
				                    <div class="note-content">
				                        <span class="note-inner-content">${r.REVIEW_CONTENT}</span>
				                    </div>
				                    <div class="note-info">
					                    <span>${r.USER_ID}</span><br>
					                    <span>${r.REVIEW_DATE}</span> 
					                </div>
				                    <span id="singo"><a href="javascript:void(0);" onclick="singo('${r.REVIEW_NO}','${r.REVIEW_CONTENT}');">신고</a></span>
				                </div>
				            </div>
				            			        	
		        		   <form action="${pageContext.request.contextPath}/board/blacklist" method="post" id="singoInfo">
						    	<input type="hidden" name="no" id="singoNo" value=""/>
						    	<input type="hidden" name="title" id="singoTitle" value=""/>
						    	<input type="hidden" name="board" value="후기"/>
						   </form>
			            
			            </c:forEach>
			            
			        </div>
			    </div>
	    	
	    	</c:if>
	    
	    
	    
	
		    <!-- Modal Add notes -->
		    <div class="modal fade" id="addnotesmodal" tabindex="-1" role="dialog" aria-labelledby="addnotesmodalTitle" style="display: none;" aria-hidden="true">
		        <div class="modal-dialog modal-dialog-centered" role="document">
		            <div class="modal-content border-0">
		            
		                <div class="modal-header bg-info text-white">
		                    <h5 class="modal-title text-white">후기 작성</h5>
		                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
		                        <span aria-hidden="true"><i class="fa fa-times"></i></span>
		                    </button>
		                </div>
		                
		                <div class="modal-body">
		                    <div class="notes-box">
		                    
		                        <div class="notes-content">
		                            <form action="${pageContext.request.contextPath}/board/review/insert" method="post" id="addnotesmodalTitle">
		                                <div class="row">
		                                
		                                    <div class="col-md-12 mb-3">
		                                        <div class="modal-title">
		                                            <label>과외</label><br>
		                                            <select name="lessonList" id="note-has-title">
		                                            	<c:if test="${empty lesson}">
		                                            		<option value="0">---후기를 작성할 수 있는 과외가 없습니다---</option>
		                                            	</c:if>
		                                            	<c:if test="${not empty lesson}">
		                                            			<option value="0">---후기를 작성할 과외를 선택하세요---</option>
		                                            		<c:forEach items="${lesson }" var="l" varStatus="">
		                                            			<option value="${l.CONN_LESSON_NO}">${l.LESSON_TITLE} / ${l.USER_NAME} 선생님</option>
		                                            		</c:forEach>
		                                            	</c:if>
		                                            </select>
		                                        </div>
		                                    </div>
		                                    <div class="col-md-12 mb-3">
		                                        <div class="modal-star">
		                                            <label>별점</label>
		                                            <div id="mstar">
		                                            	<i class="fa fa-star fa-2x" id="1"></i>
		                                            	<i class="fa fa-star fa-2x" id="2"></i>
		                                            	<i class="fa fa-star fa-2x" id="3"></i>
		                                            	<i class="fa fa-star fa-2x" id="4"></i>
		                                            	<i class="fa fa-star fa-2x" id="5"></i>
		                                            </div>
		                                            <input type="hidden" id="note-has-star" name="modal-star" class="form-control" minlength="25" placeholder="Title" />
		                                        </div>
		                                    </div>
		
		                                    <div class="col-md-12">
		                                        <div class="modal-description">
		                                            <label>내용</label>
		                                            <textarea id="note-has-description" name="modal-desc" class="form-control" minlength="60" rows="5" 
		                                            placeholder="※ 등록된 후기는 수정이 불가능합니다 .&#13;&#10;※ 최소 20글자, 최대 300글자를 입력하실 수 있습니다."></textarea>
		                                        </div>
		                                    </div>
		                                    
		                                </div>
		                            </form>
		                        </div>
		                        
		                    </div>
		                </div>
		                
		                <div class="modal-footer">
	                       <button id="btn-n-add" class="buttonA">작성</button>
		                   <button class="buttonB" data-dismiss="modal">취소</button>
		                </div>
		                
		            </div>
		        </div>
		    </div> <!-- end modal -->
		    
		    
		</div>
	</div>
</div> <!-- end .container -->


<!-- 페이징 -->
<c:if test="${not empty review}">
	<br>
	<div class="pagingstyle">
		<c:import url="/WEB-INF/paging/user/review/userReviewPaging.jsp"></c:import>
	</div>
	<br><br>
</c:if>



<!-- footer include  -->
<c:import url="/WEB-INF/layout/main/footer.jsp"></c:import>


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

