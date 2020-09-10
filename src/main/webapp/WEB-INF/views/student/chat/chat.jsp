<%@page import="com.privateplaylist.www.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   


<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 학생 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/student/stuHeader.jsp"></c:import>


<div id="title">1 : 1 문의
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">채팅목록</a>
</div>



	

<style>

.container {
    max-width: 900px;
    margin: auto;
}
</style>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/box.css">

<%
 String userID=null;
if(session.getAttribute("loginUser") !=null){
	userID=((Member)session.getAttribute("loginUser")).getUserId();//사용자의 정보가져오기
	
}
String toID=null;
if(request.getAttribute("toID") !=null){
	toID=(String)request.getAttribute("toID");//채팅하는 대상의 정보 가져오기
}

if(userID==null){
	
	String url=request.getContextPath()+"/member/login";
	session.setAttribute("messageContent", "로그인이 되어있지 않습니다");
	session.setAttribute("messageType", "오류메시지");
	
	response.sendRedirect(url);
	/* response.sendRedirect(url); */
}
%>




<script type="text/javascript">

//채팅 팝업창 띄욱
function openChat(toId){
	
	var url="${pageContext.request.contextPath}/chat/chatRoom?toID="+toId;
	
	window.open(url,"채팅창","width=500,height=300");
}

//안읽은 데이터 가져오기
function getUnread(){
	
	var userID='<%=userID%>';
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/chat/unread",
		data:{
			userID:encodeURIComponent(userID)
		},
		success:function(data){
			
			$("#chkUnread").html(data);
		}
	});
	
}

function getChatBox(){
	var userID='<%=userID%>'
	$.ajax({
		
	type:"POST",
	url:"${pageContext.request.contextPath}/get/box",
	data:{
		userID:encodeURIComponent(userID)
	},
	success:function(data){
		data = data.replace(/\\n/g, "\\n")  
        .replace(/\\'/g, "\\'")
        .replace(/\\"/g, '\\"')
        .replace(/\\&/g, "\\&")
        .replace(/\\r/g, "\\r")
        .replace(/\\t/g, "\\t")
        .replace(/\\b/g, "\\b")
        .replace(/\\f/g, "\\f");
		
		data = data.replace(/[\u0000-\u0019]+/g,""); 
		if(data==0) return;
		$("#boxList").html('');
		var parsed=JSON.parse(data);
		var result=parsed.result;
		var profile=null;
		for(var i=0;result.length;i++){
			if(result[i][0].value==userID){//fromid가 자기자신일때
				result[i][0].value = result[i][1].value;
				profile = result[i][5].value;
			}else{//자신이 아닐때
				result[i][1].value = result[i][0].value;
				profile = result[i][4].value;
			}
			addBox(result[i][0].value,result[i][1].value,result[i][2].value,result[i][3].value,result[i][6].value,profile);
		}
	}
	});
	
	
}

function addBox(lastID,toID,chatContent,chatTime,unread,profile){
	$("#boxList").append(
			'<div class="chat_list" onclick="location.href= \'${pageContext.request.contextPath}/chat/chatRoom?toID=' +encodeURIComponent(toID)+ '\' ">' +
			'<div class="chat_people">'+		
			'<div class="chat_img"> <img src="${pageContext.request.contextPath}/resources/images/icon.png" alt="sunil"> </div>'+		
			'<div class="chat_ib">'+		
			'<h5>'+lastID+'<span class="chat_date pull-right">'+chatTime+'</span></h5>'+
			'<p>'+chatContent+
			'<span class="label label-info pull-right">'+ unread +'</span></p>'+
			'</div>'+
			'</div>'+
			'</div>');
}

function getInfiniteBox(){
	setInterval(function(){
		getChatBox();
		/* getUnread(); */
	},3000);
}



</script>


<%
			String messageContent = null;
		if (session.getAttribute("messageContent") != null) {
			messageContent = (String) session.getAttribute("messageContent");
		}
		String messageType = null;
		if (session.getAttribute("messageType") != null) {
			messageType = (String) session.getAttribute("messageType");
		}
		if (messageContent != null) {
		%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div
					class="modal-content <%if (messageType.equals("오류메시지"))
	out.println("panel-warning");
else
	out.println("panel-success");%>">
					<div class="modal-header panel heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times</span> <span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							<%=messageType%>
						</h4>
					</div>
					<div class="modal-body">
						<%=messageContent%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn primary close"
							data-dimiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
			 $("#messageModal").modal("show"); 
		</script>
	<%
			session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
		%>




<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<div class="">

<div class="messaging">
  <div class="inbox_msg">
    <div class="inbox_people">
    
      <div class="headind_srch">
        <div class="recent_heading">
          <h4><%=userID%></h4>
        </div>
        <!-- 검색 기능 : 필요할시 삽입 -->
        <!-- <div class="srch_bar">
          <div class="stylish-input-group">
            <input type="text" class="search-bar"  placeholder="Search" >
            <span class="input-group-addon">
            <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
            </span> </div>
        </div> -->
      </div>
      <div class="inbox_chat" id="boxList">
      </div>
    </div>
   
  </div>
</div>
</div>


<script type="text/javascript">
 $(document).ready(function(){
	getChatBox();
	/* getUnread(); */
	getInfiniteBox();
}) 
</script>


<!-- 학생 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/student/stuFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuFooter2.jsp"></c:import>



	



