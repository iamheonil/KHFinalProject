<!-- 이인주 20200818 : 학생 마이페이지 body test  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 학생 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/student/stuHeader.jsp"></c:import>

<style>
body{
    margin-top:20px;
    background:#f5f5f5;
}
/**
 * Panels
 */
/*** General styles ***/
.panel {
  box-shadow: none;
}
.panel-heading {
  border-bottom: 0;
}
.panel-title {
  font-size: 17px;
}
.panel-title > small {
  font-size: .75em;
  color: #999999;
}
.panel-body *:first-child {
  margin-top: 0;
}
.panel-footer {
  border-top: 0;
}

.panel-default > .panel-heading {
    color: #333333;
    background-color: transparent;
    border-color: rgba(0, 0, 0, 0.07);
}

form label {
   color: #999999;
   font-weight: 200;
}

.form-horizontal .form-group {
  margin-left: -15px;
  margin-right: -15px;
}

@media (min-width: 768px) {
  .form-horizontal .control-label {
    text-align: right;
    margin-bottom: 0;
    padding-top: 7px;
  }
}
#title{
	width: 100%;
	font-weight: bold;
}
#title a {
	color: #17B794; /* 청록색 */
}

#btnboard{
	width: 700px;
	text-align: center;
}

#findStuContent{
	min-width: 500px;
}

#findStuContent{
	width: 670px;
	min-width:670px;
}
</style>

<!-- <form>태그의 submit을 수행하면 Smarteditor에 작성한 내용을 <textarea>에 반영 -->
<script type="text/javascript">
function submitContents(elClickeObj){
	
	//에디터의 내용을 #content에 반영한다
	oEditors.getById["findStuContent"].exec("UPDATE_CONTENTS_FIELD",[]);
	
	try {
		//<form>태그의 submit을 수행한다
		elClickeObj.form.submit();
	} catch (e) {
	}
}

function findurl() {
	location.href='${pageContext.request.contextPath}/student/findStu/list';
}
</script>

<script type="text/javascript">
$(document).ready(function(){
	
	//작성버튼 동작
	$("#btnWrite").click(function(){
		
		//스마트 에이터의 내용을 <textarea>에 적용하는 함수를 호출한다
		submitContents($("#btnWrite"));
		
		//제목 작성했는지 검사
		if(($("#findStuTitle").val()).trim() == ""){
			alert("제목을 5자 이상 작성해주세요");
			$("#findStuTitle").focus();
			return false; 
		}

		//textarea 값 
		var value =  $("#findStuContent").val()
  
		//textarea value 모든 공백 제거
		function texttrim(value){
			value = value.replace(/\s+/, "");//왼쪽 공백제거
			value = value.replace(/\s+$/g, "");//오른쪽 공백제거
			value = value.replace(/\n/g, "");//행바꿈제거
			value = value.replace(/\r/g, "");//엔터제거
			return value;
		}
		
		//textarea 의 공백 제거한 최소 길이 : 11
		// 11 이하 : 공백
		if( (texttrim(value).length) <= 11){
				alert("본문을 5 글자 이상 작성해주세요");
				$("#findStuContent").focus();
				return false; 
		}

		//제목 내용 둘다 작성하면 insert 
		if( $("#findStuTitle").val().trim() != "" && (texttrim(value).length) > 11 ) {
			//alert("insert"+texttrim(value).length);
			//실제 <form>의 submit 수행
			$("#findStuForm").submit();
		} 
		
	});
	
});
</script>
             
<div class="container bootstrap snippets bootdeys">

	<div id="title">학생찾기
		<i class="glyphicon glyphicon-menu-right"></i>
		<a href="">글 등록</a>
	</div>
	
<br>

<div class="row">

  <div class="col-xs-12 col-sm-9">
    <form id="findStuForm" class="form-horizontal" action="${pageContext.request.contextPath}/student/findStu/insert" method="post">
    <div class="panel panel-default">
    
		 <div class="panel-heading">
		 	<h4 class="panel-title">과외 정보</h4>
		 </div>
		 
		 <div class="panel-body">
		 
		    <div class="form-group">
		    	<label class="col-sm-2 control-label">제목</label>
			     <div class="col-sm-10">
			       <input type="text" class="form-control" name="findStuTitle" id="findStuTitle" required="required">
			     </div>
		    </div>
		 
		    <div class="form-group">
		        <label class="col-sm-2 control-label">지역</label>
		        <div class="col-sm-10">
			        <select class="form-control" name="findStuLoc" id="findStuLoc">
							<option selected value="무관">-선택-</option>
							<option value="서울">서울</option>
							<option value="부산">부산</option>
							<option value="대구">대구</option>
							<option value="인천">인천</option>
							<option value="대전">대전</option>
							<option value="울산">울산</option>
							<option value="광주">광주</option>
							<option value="세종">세종</option>
							<option value="경남">강원</option>
							<option value="경북">경북</option>
							<option value="전남">경남</option>
							<option value="전북">충북</option>
							<option value="광주">충남</option>
							<option value="부산">전북</option>
							<option value="제주">전남</option>
							<option value="제주">제주</option>
			        </select>
		     	</div>
		     </div>
		       
		     
		    <div class="form-group">
		       <label class="col-sm-2 control-label">과목</label>
		       <div class="col-sm-10">
		       <select class="form-control" name="findStuSubject" id="findStuSubject">
					<option selected value="무관">-선택-</option>
					<option value="수학">수학</option>
					<option value="국어">국어</option>
					<option value="영어">영어</option>
					<option value="과학">과학</option>
					<option value="논술">논술</option>
					<option value="사회">사회</option>
					<option value="예체능">예체능</option>
					<option value="제2외국어">제2외국어</option>
					<option value="컴퓨터(IT)">컴퓨터(IT)</option>
					<option value="자격증">자격증</option>
					<option value="대학전공">대학전공</option>
					<option value="기타">기타</option>
		       	</select>
		       </div>
		    </div>
		     
		     <div class="form-group">
		       <label class="col-sm-2 control-label">본문</label>
		       <div class="col-sm-10">
		         <textarea rows="4" class="form-control" name="findStuContent" id="findStuContent" required="required"></textarea>
		       </div>
		     </div>
		     
		  </div>
		  </div>
		 </form>
		 		
		    <div id="btnboard">  
				<div class="form-group">
				  <div class="col-sm-10 col-sm-offset-2">
					  <button type="button" class="btn btn-default" id="btnWrite">등록</button>
					  <button type="button" class="btn btn-default" onclick="findurl();">취소</button>
				  </div>
				</div>
			</div>	
				
  	</div>
	</div>
</div>

<!-- 스마트 에디터 적용 -->
<!-- <textarea>에 스마트 에디터의 스킨을 입히는 코드 -->
<script type="text/javascript" src="/ss/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script> 

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "findStuContent"  //에디터가 적용될 <textarea>의 id
	, sSkinURI : "/ss/resources/se2/SmartEditor2Skin.html" //에디터 스킨
	, fCreator : "createSEditor2"
	
})
</script>

<!-- 학생 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/student/stuFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuFooter2.jsp"></c:import>
