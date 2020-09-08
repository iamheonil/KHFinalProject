<%@page import="com.privateplaylist.www.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layout/main/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/chat.css">

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
}
%>

<script type="text/javascript">


function searchParam(key) {//파라미터 값을 가져오는 함수
	  return new URLSearchParams(location.search).get(key);
	};
function autoCloseAlert(selector,delay){//메세지가 전달된 후의 결과메시지를 띄우는 함수
	var alert=$(selector).alert();
	alert.show();
	window.setTimeout(function() {alert.hide()},delay)
}
function submitFunction(){//메시지를 전달받아 db에넣고 결과값출력후 채팅창을 비움
var userID='<%=userID%>'
var toID=searchParam('toID')
var chatContent=$('#chatContent').val();

if(chatContent==null || chatContent==''){
	alert("문자를 입력하지 않았습니다")
	return
}
var url="${pageContext.request.contextPath}/chat/submit";
$.ajax({
	type:"POST",
	url:url,
	data:{
		fromID:encodeURIComponent(userID),
		toID:encodeURIComponent(toID),
		chatContent:encodeURIComponent(chatContent)
		
		
	},
	success:function(result){
		if(result==1){
			autoCloseAlert('#successMessage',2000);
		}else if(result==0){
			
			autoCloseAlert('#dangerMessage',2000);
		}else{
			autoCloseAlert('#warningMessage',2000);
			
		}
	}
});
	$('#chatContent').val('');
	
}
var lastID=0;//처음에는 0으로 설정해주어 채팅방의 모든 리스트를 가져온다
function chatListFunction(type){//채팅리스트를 ajax로 가져와서 파싱하는 함수
	
	var userID='<%=userID%>'
	var toID=searchParam('toID')
	var url="${pageContext.request.contextPath}/chat/list";
	$.ajax({
		type:"POST",
		url:url,
		data:{
			fromID:encodeURIComponent(userID),
			toID:encodeURIComponent(toID),
			listType:type
		},
		success:function(data){
			var newdate=encodeURIComponent(data);
			
			
			if(data=="")return;
			data = data.replace(/\\n/g, "\\n")  
            .replace(/\\'/g, "\\'")
            .replace(/\\"/g, '\\"')
            .replace(/\\&/g, "\\&")
            .replace(/\\r/g, "\\r")
            .replace(/\\t/g, "\\t")
            .replace(/\\b/g, "\\b")
            .replace(/\\f/g, "\\f");
			
			data = data.replace(/[\u0000-\u0019]+/g,""); 
			
			var parsed=JSON.parse(data);
			var result=parsed.result;
			
			lastID=Number(parsed.last);
			
			for(var i=0;result.length;i++){
				if(result[i][0].value==userID){
					result[i][0].value='나';
				}
				addChat(result[i][0].value,result[i][2].value,result[i][3].value);
			}
			
		}
	});
}
function addChat(chatName,chatContent,chatTime){//채팅창에 내가보낸 메시지를 append해주는 함수
	
	if(chatName=='나'){
		
		$('#chatList').append('<li class="mar-btm">'+
				'<div class="media-right">'+
				'<img class="media-object img-circle"style="width:30px; height:30px;" src="${pageContext.request.contextPath}/resources/images/icon.png">'+
				'</div>'+
				'<div class="media-body pad-hor speech-right">'+
				'<div class="speech">'+
				'<a href="#" class="media-heading">'+chatName+'</a>'+
				'<p>'+chatContent+'</p>'+
				'<p class="speech-time">'+
				
				'<i class="fa fa-clock-o fa-fw"></i>'+chatTime+
				
				'</p>'+
				'</div>'+
				'</div>'+
				'</li>'
				
				);
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
		
	}else{
	
	$('#chatList').append('<li class="mar-btm">'+
			'<div class="media-left">'+
			'<img class="media-object img-circle"style="width:30px; height:30px;" src="${pageContext.request.contextPath}/resources/images/icon.png">'+
			'</div>'+
			'<div class="media-body pad-hor">'+
			'<div class="speech">'+
			'<a href="#" class="media-heading">'+chatName+'</a>'+
			'<p>'+chatContent+'</p>'+
			'<p class="speech-time">'+
			
			'<i class="fa fa-clock-o fa-fw"></i>'+chatTime+
			
			'</p>'+
			'</div>'+
			'</div>'+
			'</li>'
			
			);
	$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	
var Div=document.getElementById("chatListBox");
console.dir(Div)
Div.scrollTop=Div.scrollHeight;
}
function getInfinateChat(){//채팅리스트를 가져오는 함수를 계속 하여 채팅방을 계속 업데이트한다
	setInterval(function(){
		
		chatListFunction(lastID);
	},500)
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

<div class="gtco-services gtco-section">
		<div class="gtco-container">

	<!-- 실시간 채팅창  -->

	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
		rel="stylesheet">
	<div class="container bootstrap snippet col-xs-9" style=" margin-left: 10%;">
		
			<div class="panel">
				<!--Heading-->
				<div class="panel-heading">
					<div class="panel-control"></div>
					<h3 class="panel-title"><%=userID%></h3>
				</div>

				<!--Widget body-->
				<div id="demo-chat-body" class="collapse in">
					<div class="nano has-scrollbar"   style="height: 380px;">
						<div class="nano-content pad-all" tabindex="0"
							style="right: -17px;" id="chatListBox">
							<ul class="list-unstyled media-block" id="chatList">



							</ul>
						</div>
						<div class="nano-pane">
							<div class="nano-slider"
								style="height: 141px; transform: translate(0px, 0px);"></div>
						</div>
					</div>

					<!--Widget footer-->
					<div class="panel-footer">
						<div class="row">
							<div class="col-xs-9">
								<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="Enter message..."></textarea>
							</div>
							<div class="col-xs-3">
								<button type="button" class="btn btn-primary btn-block" style="margin-top: 15px; height:50px;" id="submit"  onclick="submitFunction();">Send</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		
	</div>
	
	</div>
	</div>


	<div class="alert alert-success" id="successMessage"
		style="display: none;">
		<strong>메시지 전송에 성공했습니다</strong>
	</div>
	<div class="alert alert-danger" id="dangerMessage"
		style="display: none;">
		<strong>이름과 내용을 모두 입력해주세요</strong>
	</div>

	<div class="alert alert-warning" id="warningMessage"
		style="display: none;">
		<strong>데이터 베이스 오류가 발생했습니다</strong>
	</div>

	<script type="text/javascript">
	
	$(document).ready(function() { //채팅창이 빈칸이면 보낼수없음
	   
	    	$('#submit').attr('disabled', true);
	    
	    $('#chatContent').on('keyup',function() {
	    	
	    	$('#submit').attr('disabled', true);
	        var textarea_value = $("#chatContent").val();
	        var text_value = $('#chatContent').val();
	        
	        if(textarea_value != '' && text_value != ''  && text_value != null  && text_value != null) {
	        	console.log(textarea_value);
	            $('#submit').attr('disabled', false);
	            text_value='';
	            textarea_value='';
	        } else {
	            $('#submit').attr('disabled', true);
	        }
	    });
	});
	
	
$(document).ready(function(){
	chatListFunction('ten');
	getInfinateChat();
	
	$('#chatContent').on('keydown', function(event) {
        if (event.keyCode == 13)
            
                
                $('#submit').click();
	})
            
})
</script>
<%@ include file="/WEB-INF/layout/main/footer.jsp"%>





	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>