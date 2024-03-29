<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- nav include  -->
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
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

.form button{
	height: 60px;
}

.deleteFile{
	border: 1px solid black;
}

</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#thumbChange").change(function(){
		<c:if test="${!empty market.MK_THUMB_NO }">
			var mkThumbNo = ${market.MK_THUMB_NO };
			var target = $("#BtnThumbDelete");
			deleteThumb( mkThumbNo, target);	
		</c:if>
	})
})

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
	window.history.back();
}

// function deleteFile(questionFileNo, target){
<%-- 	var url = "<%=request.getContextPath() %>/board/question/deletefile"; --%>
// 	// 비동기 처리
// 	$.ajax({
// 		type : "POST",
// 		url: url,
// 		data: {questionFileNo : questionFileNo},
// 		success : function(result) {
// 			$(target).parent("span").remove();
// 			$(target).parent("span").next().remove();
// 			$(target).parent("span").children('br').remove();
// 			$("#" + questionFileNo).remove();
// // 			location.reload();
// 		},
// 		error : function(){
// 			alert("ajax 실패")
// 		}
// 	});
	
// }

function deleteFile(questionFileNo, target){
	
	var $input = "<input type='hidden' name='deleteFileNo' value='" + questionFileNo + "'/>";
	
	$("#questionUpdateForm").append($input);
	
	$(target).parent("span").remove();
	$(target).parent("span").next().remove();
	$(target).parent("span").children('br').remove();
	$("#" + questionFileNo).remove();
}


//사진 프리뷰
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$(document).ready(
	    function() {
	        // 태그에 onchange를 부여한다.
	        $('#file').change(function() {
	                addPreview($(this)); //preview form 추가하기
	        });
	    });
	 
	    // image preview 기능 구현
	    // input = file object[]
	    function addPreview(input) {
	        if (input[0].files) {
	            //파일 선택이 여러개였을 시의 대응
	            for (var fileIndex = 0 ; fileIndex < input[0].files.length ; fileIndex++) {
	                var file = input[0].files[fileIndex];
	                var reader = new FileReader();
	 
	                reader.onload = function (img) {
	                    //div id="preview" 내에 동적코드추가.
	                    //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
	                    $("#preview").append(
	                        "<img src=\"" + img.target.result + "\"\ style='width: 100%;'/>"
	                    );
	                };
	                
	                reader.readAsDataURL(file);
	            }
	        } else alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
	    }
	    
//파일선택 클릭 시 이미 선택된 이미지 삭제
  $(function() {
  	$("#file").click(function() {
  		$("#preview").html("");
  	});
  });	    
  
  

function submitContents(elClickedObj) {
	 var elClickedObj = $("#form");
	 // 에디터의 내용이 textarea에 적용된다.
	 oEditors.getById["questionContent"].exec("UPDATE_CONTENTS_FIELD", []);
	 var ir1 = $("#questionContent").val();
	 
	 if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
          alert("내용을 입력하세요.");
          oEditors.getById["questionContent"].exec("FOCUS"); //포커싱
          return;
     }else{
		 
		 // 에디터의 내용에 대한 값 검증은 이곳에서
		 // document.getElementById("ir1").value를 이용해서 처리한다.
		console.log(elClickedObj); 
		 try {
		     elClickedObj.form.submit();
		 } catch(e) {}
		 
	 }

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
<div id="marketWrite">
<form id="questionUpdateForm" class="form" method="post" action="${pageContext.request.contextPath}/board/question/update" enctype="multipart/form-data">
  <input type="hidden" name="questionNo" value="${detail.question.QUESTION_NO }" />
  <div class="form-group" style="font-weight: bold; font-size: 16px;">
	질문게시판 글쓰기
	<hr>
  </div>
  <div class="form-group">
    <label>제목</label>
    <input class="form-control" maxlength="100" type="text" name="questionTitle" placeholder="제목" required="required" value="${detail.question.QUESTION_TITLE }">
  </div>
<!--   <div class="form-group"> -->
<!--     <label>가격</label> -->
<%--     <input style="width: 200px;" class="form-control" type="number" min="0" name="mkPrice" id="mkPrice" required="required" value="${question.QUESTION_PRICE }"> --%>
<!--   </div> -->
    <div class="form-group">
      <label>내용</label>
      <textarea maxlength="2000" required="required" class="form-control" id="questionContent" name="questionContent" rows="10" style="width: 99%">${detail.question.QUESTION_CONTENT }</textarea>
    </div>
    <div class="form-group">
      <label>상세 사진&nbsp;&nbsp;&nbsp;</label><br>
		<input id="file" type="file" name="files" accept="image/*" multiple/>
		<div id="preview" style="width: 600px;"></div>
      <c:if test="${not empty detail.flist }">
	      <c:forEach items="${detail.flist }" var="f" >
		    <span>${f.Q_FILE_ORIGINAL }&nbsp;<i class="fa fa-times" aria-hidden="true" onclick="deleteFile(${f.QUESTION_FILE_NO }, this);"></i>&nbsp;<br></span>
		    <img id="${f.QUESTION_FILE_NO }" src="${pageContext.request.contextPath }/resources/upload/${f.Q_FILE_RENAME }" title="" alt="" style="width: 600px;"><br>
	      </c:forEach>
      </c:if>
  	  
    </div>
<div style="text-align: center;">
    <button class="btn btn-primary" onclick="submitContents();"><span>수정</span></button>
    <button class="btn btn-disable" type="button" onclick="location.href='${pageContext.request.contextPath }/board/question/detail?questionNo=${detail.question.QUESTION_NO }'"><span>취소</span></button>
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
 elPlaceHolder: "questionContent",
 sSkinURI: "${pageContext.request.contextPath }/resources/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});
</script>
</body>
</html>

