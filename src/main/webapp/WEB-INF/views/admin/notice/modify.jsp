<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   

<!-- 관리자 페이지 header -->   
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>

<!-- 스마트 에디터 -->
<!-- <script type="text/javascript" src="/ss/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>  -->

<style type="text/css">
.captionstyle{
	text-align: center;
	caption-side: top;
	font-weight: bold;
	font-size: large;
}

#btnWrite{
	color: #17B794;
}

#btnCancel{
	color: red;
}

 #divbtn{ 
    padding: 10px; 
} 

.pagingstyle{
 	width: 100%; 
 	padding-left: 40%;
}

#footerbtn{
    position: absolute;
    right: 1.5%;
    top: 18%;
}

#serchbox{
	width: 500px;
}

.anone{
	text-decoration: none;
	color: black;
}

.anone:hover{
	text-decoration: none;
	color: black;
}

#noticeTable th {
	text-align: center;
	background: #17B794;
}

</style>

<!-- <form>태그의 submit을 수행하면 Smarteditor에 작성한 내용을 <textarea>에 반영 -->
<script type="text/javascript">
function submitContents(elClickeObj){
	
	//에디터의 내용을 #content에 반영한다
	oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD",[]);
	
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
		
		//스마트 에이터의 내용을 <textarea>에 적용하는 함수를 호출한다
		submitContents($("#btnWrite"));
		
		//실제 <form>의 submit 수행
		$("#noticeForm").submit();
		
	});
	
	//취소 버튼 동작
	$("#btnCancel").click(function(){
		history.go(-1);
	});
	
	$("#noticeContent").val('${noticeone.noticeContent }');
	
});
</script>


    <div id="title">게시판
    	<i class="fas fa-angle-right"></i>
    	<a href="<%=request.getContextPath() %>/admin/notice/list">공지사항 </a>
   	</div>

 <div id="content"> 
 
 	<h4>공지사항 수정</h4>
 
	<form action="<%=request.getContextPath() %>/admin/notice/modify?noticeNo=${noticeone.noticeNo }" method="post" id="noticeForm">
		<table id="noticeTable" class="table table-condensed text-center">
			<tr>
				<th>글제목</th>
				<td><input style="width: 100%;" type="text" name="noticeTitle" required="required" value="${noticeone.noticeTitle }"/></td>
			</tr>
			<tr>
				<th style="vertical-align: middle;">본문</th>
				<td>
				<textarea id="noticeContent" name="noticeContent" required="required" style="width: 90%; min-height: 500px;">
				${noticeone.noticeContent }
				</textarea>
				</td>
			</tr>
		</table>
	</form>
		
	<div id="btnBox" style="text-align: center;">
		<button type="button" class="btn btn-default" id="btnWrite">수정</button>
		<button type="button" class="btn btn-default" id="btnCancel">취소</button>
	</div>
</div> 

<!-- 스마트 에디터 적용 -->
<!-- <textarea>에 스마트 에디터의 스킨을 입히는 코드 -->
<script type="text/javascript" src="/ss/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script> 

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "noticeContent"  //에디터가 적용될 <textarea>의 id
	, sSkinURI : "/ss/resources/se2/SmartEditor2Skin.html" //에디터 스킨
	, fCreator : "createSEditor2"
// 	, oEditors.getById["noticeContent"].setIR(${noticeone.noticeContent });

})
</script>

     
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  