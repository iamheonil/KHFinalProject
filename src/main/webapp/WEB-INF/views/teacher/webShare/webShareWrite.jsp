<!-- 이서연 200829 -->
<!-- 선생님페이지 > 과외 연결 > 자료실 (글쓰기) -->

<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 선생님 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>


<!-- 현위지 메뉴 -->
<style type="text/css">

#title{
	width: 100%;
	font-weight: bold;
}

#title a:hover { color: #777777; }

/* 최상위 메뉴만 청록색 */
#title a:last-child { color: #17B794; }

</style>


<style type="text/css">

#btnBox { float: right; }

#webShareTable {

	margin-top: 30px;
	border: none;
}

table th { 
	color: #262626;
	text-align: center; 
}

</style>

<!-- 버튼 -->
<style type="text/css">

.button2 { /* 글작성버튼 */
	background-color: #17B794; 
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	padding: 4px;
	border-radius: 3px;
	cursor: pointer;
	width: 65px;
}

.button3 { /* 취소버튼 */
	background-color: #474747; 
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	padding: 4px;
	border-radius: 3px;
	cursor: pointer;
	width: 65px;
}

</style>



<!-- <form>태그의 submit을 수행하면 Smarteditor에 작성한 내용을 <textarea>에 반영 -->
<script type="text/javascript">
function submitContents(elClickeObj){
	
	//에디터의 내용을 #content에 반영한다
	oEditors.getById["shareContent"].exec("UPDATE_CONTENTS_FIELD",[]);
	
	try {
		//<form>태그의 submit을 수행한다
		elClickeObj.form.submit();
	} catch (e) {
	}
}
</script>


<script type="text/javascript">
$(document).ready(function(){
	
	//작성버튼 동작
	$("#btnWrite").click(function(){
		
		//스마트 에디터의 내용을 <textarea>에 적용하는 함수를 호출한다
		submitContents($("#btnWrite"));
		
		//제목 작성했는지 검사
		if(($("#shareTitle").val()).trim() == ""){
			alert("제목을 5자 이상 작성해주세요");
			$("#shareTitle").focus();
			return false; 
		}
		
		//textarea 값 
		var value =  $("#shareContent").val()
  
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
				alert("본문을 5자 이상 작성해주세요");
				$("#shareContent").focus();
				return false; 
		}

		//제목 내용 둘다 작성하면 insert 
		if( $("#shareTitle").val().trim() != "" && (texttrim(value).length) > 11 ) {
			//alert("insert"+texttrim(value).length);
			//실제 <form>의 submit 수행
			$("#webShareForm").submit();
		} 
		
	});
	
	//취소 버튼 동작
	$("#btnCancel").click(function(){
		history.go(-1);
	});
	
});
</script>




<div id="title">과외 연결
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="${pageContext.request.contextPath}/teacher/connectedlesson">연결된 과외</a>
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">자료실</a>
</div>



<div id="content"> 


	<form action="<%=request.getContextPath() %>/teacher/webshare/insert" method="post" id="webShareForm" enctype="multipart/form-data">
		<table id="webShareTable" class="table text-center">
			<tr>
				<input type="hidden" id="connLessonNo" name="connLessonNo" value="${no} "/>
				<td><input style="width: 100%; height: 40px;" type="text" id="shareTitle" name="shareTitle" required="required" placeholder=" 제목을 입력하세요."/></td>
			</tr>
			<tr>
				<td>
				<textarea id="shareContent" name="shareContent" required="required" style="width: 100%; min-height: 500px;">
				</textarea>
				</td>
			</tr>
			<tr>
				<td><input type="file" name="files" id="contract_file" multiple="multiple"/></td>
			</tr>
		</table>
	</form>
	
	<div id="btnBox" style="text-align: center;">
		<button type="button" class="button button2" id="btnWrite">작성</button>
		<button type="button" class="button button3" id="btnCancel">취소</button>
	</div>
</div> 

<br><br><br><br>

<!-- 스마트 에디터 적용 -->
<!-- <textarea>에 스마트 에디터의 스킨을 입히는 코드 -->
<script type="text/javascript" src="/ss/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script> 

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "shareContent"  //에디터가 적용될 <textarea>의 id
	, sSkinURI : "/ss/resources/se2/SmartEditor2Skin.html" //에디터 스킨
	, fCreator : "createSEditor2"
	
})
</script>




<!-- 선생님 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>
