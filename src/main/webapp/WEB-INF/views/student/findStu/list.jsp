<!-- 이인주 20200903 : 학생 마이페이지  > 학생 찾기 list  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 학생 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/student/stuHeader.jsp"></c:import>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<style type="text/css">
@import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');

<!-- 기본 css -->
<style type="text/css">
#main {
	display: inline-block;
	float: right;
	width: 960px;
	padding: 0 20px;
}

#boardtitle {
    font-size: 16px;
    font-weight: bold;
}
</style>

<!-- list css -->
<style type="text/css">
.captionstyle{
	text-align: center;
	caption-side: top;
	font-weight: bold;
	font-size: large;
}

#divbtn{ 
    padding: 10px; 
} 

#footerbtn{
    position: absolute;
    right: 1.5%;
    top: 28.3%;
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

.txt_line_content { 
	width:270px; 
	padding:0 5px; 
	overflow:hidden; 
	text-overflow:ellipsis;
	white-space:nowrap;  
}

.txt_line_title { 
	width:150px; 
	padding:0 5px; 
	overflow:hidden; 
	text-overflow:ellipsis;
	white-space:nowrap; 
}
</style>

<!-- 모달 -->
<style>
        #modal {
          display: none;
          position:relative;
          width:100%;
          height:100%;
          z-index:3;
        }
        
        #modal button {
      	  float: right;
        }
        
        #modal .modal_content {
          width:500px;
          margin:100px auto;
          padding:20px 10px;
          background:#fff;
          border:2px solid #666;
          top : -500px;
          left : 100px;
          position: absolute;
          border-radius: 10px;
        }
        
        #modal .modal_layer {
          position:fixed;
          top:0;
          left:0;
          width:100%;
          height:100%;
          background:rgba(0, 0, 0, 0.5);
          z-index:-1;
        }   
</style> 

<!-- 모달 -->
<script>
$(document).ready(function() {
//     document.getElementById("modal_opne_btn").onclick = function XMLMODALClick(findStuNo) {}
   
    document.getElementById("modal_close_btn").onclick = function() {
        document.getElementById("modal").style.display="none";
    }   
});    
</script> 

<script type="text/javascript">
$(document).ready(function(){
	
	//삭제버튼 동작
	$("#deletebtn").click(function(){
		
		//실제 <form>의 submit 수행
		$("#checkboxlist").submit();
		
	});
	
	//수정버튼 동작
	$("#modal_modi_btn").click(function(){
		var findStuNo = $("#modal_modi_btn").val();
		location.href="<%=request.getContextPath()%>/student/findStu/modi?findStuNo="+findStuNo;
	});
	
});

/* 체크박스 전체선택, 전체해제 */
function checkAll(){
      if( $("#th_checkAll").is(':checked') ){
        $("input[name=checkRow]").prop("checked", true);
      }else{
        $("input[name=checkRow]").prop("checked", false);
      }
}
</script>

<!-- ajax -->
<script type="text/javascript">
function XMLSTATEClick(findStuNo,findStuState){
	var chk = confirm("게시글 상태를 변경 하시겠습니까?");
	
	if(chk == true){
		var url = "<%=request.getContextPath()%>/student/findStu/updatebtn";
		
		$.ajax({
			type : "POST",
			url: url,
			data : {
					findStuNo: findStuNo,
					findStuState: findStuState,
			},
			success : function(result) {
				if (result == "") {
					alert("변경되었습니다");
					location.reload();
				}else if(result != ""){
					alert(result);
				}
			},
			error : function(){
				alert("ajax 실패")
			}
		});
	}
	
}
</script>

<!-- ajax -->
<script type="text/javascript">
function XMLMODALClick(findStuNo) {

	var url = "<%=request.getContextPath()%>/student/findStu/detail";
	
	$.ajax({
		type : "POST",
		url: url,
		data : {findStuNo: findStuNo},
		success : function(result) {
			var res = result;
			console.log(res);
			
			$("#FIND_STU_TITLE").html(result.FIND_STU_TITLE);
			$("#FIND_STU_CONTENT").html(result.FIND_STU_CONTENT);
			$("#FIND_STU_LOC").text(result.FIND_STU_LOC);
			$("#FIND_STU_SUBJECT").text(result.FIND_STU_SUBJECT);
			$("#FIND_STU_DATE").text(result.FIND_STU_DATE);
			
			$("#modal_modi_btn").val(result.FIND_STU_NO);
			
			document.getElementById("modal").style.display="block";
			
// 			$("#FIND_STU_LOC").css("font-size","16px");
			
// 			document.getElementById("paging_import").style.display="none";
// 			document.getElementById("keyword").style.display="none";
// 			document.getElementById("Search").style.display="none";
			
		},
		error : function(){
			alert("ajax 실패")
		}
	});
		
// 	document.getElementById("modal").style.display="block";

}
</script>

<div id="main">
	<span id="boardtitle">학생 찾기</span>
	<hr>
	
	
	<!-- 제목 검색 -->
	<div id="serchbox" >
	<form action="${pageContext.request.contextPath}/student/findStu/search" method="post">
	
	<div class="row">
	  <div class="col-lg-6">
	    <div class="input-group">
	      <input type="text" class="form-control" placeholder="키워드검색" style="width: 180px;" name="keyword" id="keyword">
	      <span class="input-group-btn">
	        <button class="btn btn-default" type="submit" id="Search" style="margin-left: 4px;">Search</button>
	      </span>
	    </div><!-- /input-group -->
	  </div><!-- /.col-lg-6 -->
	</div><!-- /.row -->

	</form>
	</div>
	
	<!-- 글쓰기 삭제 버튼 -->
	<div id="footerbtn">
	
	<div id="divbtn">
		<a href="${pageContext.request.contextPath}/student/findStu/write" class="anone"><button type="button" class="btn btn-default" id="writebtn">글쓰기</button></a>
		<button type="button" class="btn btn-default" id="deletebtn">삭제</button>
	</div> 
	</div>
 
 	<!-- 체크박스 리스트 전송 -->
 	<form action="${pageContext.request.contextPath}/student/findStu/chkdelete" method="post" id="checkboxlist">
 	
	<!-- 학생찾기 리스트 -->
	<table class="table table-striped table-hover table-condensed textcenter" >
	<caption  class="captionstyle">학생찾기</caption>  
	
	<!-- 테이블 th -->
	<tr>
	    <th style="width: 5%"><input type="checkbox" name="th_checkAll" id="th_checkAll" onclick="checkAll();"/></th>
		<th style="width: 5%">번호</th>
		<th style="width: 10%">제목</th>
		<th style="width: 15%">내용</th>
		<th style="width: 10%">지역</th>
		<th style="width: 10%">과목</th>
		<th style="width: 12%">날짜</th>
		<th style="width: 8%">상태</th>
	</tr>
	
	<!-- 게시글이 없을 때  -->
	<c:if  var="findStu" test="${empty findStuList }">
	<tr>
	<td colspan="8" style="font-weight: bold; text-align: center;">게시글이  없습니다</td>
	</tr>
	</table>
	</c:if>
	
	<!--게시글이 있을 때 -->
	<c:if  var="findStu" test="${!empty findStuList }">
	<!-- 값 출력 -->
	<c:forEach items="${findStuList }" var="findStu" >
	<tr>
	    <td><input type="checkbox" name="checkRow" value="${findStu.findStuNo}" id="checkRow"/></td>
		<td id="findStuNo">${findStu.findStuNo }</td>
		<td>
			<div class="txt_line_title">
				<a href="#" id="modal_opne_btn" class="anone" onclick="XMLMODALClick(${findStu.findStuNo });">${findStu.findStuTitle }</a>
			</div>
		</td>
		<td><div class="txt_line_content">${findStu.findStuContent }</div></td>
		<td>${findStu.findStuLoc }</td>
		<td>${findStu.findStuSubject }</td>
		<td>${findStu.findStuDate }</td>
		
		<c:if test="${findStu.findStuState eq 0}">
			<td>
			<button type="button" class="btn btn-default" id="updatebtn" value="${findStu.findStuState }" onclick="XMLSTATEClick(${findStu.findStuNo},${findStu.findStuState });">모집</button>
			</td>
		</c:if>			
		<c:if test="${findStu.findStuState eq 1}">
			<td><button type="button" class="btn btn-default" id="updatebtn" value="${findStu.findStuState }" onclick="XMLSTATEClick(${findStu.findStuNo},${findStu.findStuState });">마감</button></td>
		</c:if>			
	</tr>
	</c:forEach>
	</table>
	</form>
	
	<!-- 페이징 -->
	<div id="paging_import">
	<c:import url="/WEB-INF/paging/student/findStu/listPaging.jsp"></c:import>
	</div>
	</c:if>
	
	<!-- modal -->
	<div id="modal">
	   
	    <div class="modal_content">
	       <h5 id="FIND_STU_TITLE" style="font-weight: bold;"></h5>
	       <hr>
				<i class="glyphicon glyphicon-map-marker" style="margin-right: 16px; margin-left: 0;"></i><h6 id="FIND_STU_LOC" style="display: inline-block;"></h6><br>
				<i class="glyphicon glyphicon-tags" style="margin-right: 16px; margin-left: 0;"></i><h6 id="FIND_STU_SUBJECT" style="display: inline-block;"></h6><br>
				<i class="glyphicon glyphicon-check" style="margin-right: 16px; margin-left: 0;"></i><h6 id ="FIND_STU_DATE" style="display: inline-block;"></h6><br>
				
				<i class="glyphicon glyphicon-list" style="margin-right: 16px; margin-left: 0;"></i><p id="FIND_STU_CONTENT" style="display: inline-block;"></p>
	       <hr>
	        <button type="button" class="btn btn-default btn-xs" id="modal_modi_btn">수정</button>
	        <button type="button" id="modal_close_btn" class="btn btn-default btn-xs" data-dismiss="modal">취소</button>
	    </div>
	   
	    <div class="modal_layer"></div>
	</div>
	
	

</div>

<!-- 학생 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/student/stuFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuFooter2.jsp"></c:import>
