<!-- 20200817 김성은 -->
<!-- 회원가입 페이지 -->
<!-- 2020.08.19 김헌일 수정 + 헤더 푸터 Import 작업-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%-- <c:import url="/WEB-INF/layout/login/joinHeader.jsp"/> --%>
<%@ include file="/WEB-INF/layout/main/header.jsp" %>

<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/header.jsp"></jsp:include> --%>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
body{
	background: #f3f3f3 !important;
}
.col-sm-6 h2{
	margin: 30px;
}
.join{
	margin-top: 80px;
}
.float{
	width: 300px;
	float: right;
}
.form-horizontal{
	width: 450px;
	margin-left: 30px;
/* 	border-bottom: 1px solid #d0d1d8; */
}
.signup-form {
	width: 500px;
	margin: 0 auto;
	padding: 30px 0;
}
.signup-form h2 {
	color: #333;
	margin: 0 0 30px 0;
	display: inline-block;
	padding: 0 30px 10px 0;
	border-bottom: 3px solid #5cd3b4;
}
.signup-form .form-group row {
	margin-bottom: 20px;
}
.signup-form label {
	font-weight: normal;
	font-size: 14px;
	line-height: 2;
}
.signup-form input[type="checkbox"] {
	position: relative;
	top: 1px;
}
.signup-form .btn {        
	font-size: 16px;
	font-weight: bold;
	background: #5cd3b4;
	border: none;
	margin-top: 20px;
	min-width: 140px;
}
.signup-form .btn:hover, .signup-form .btn:focus {
	background: #41cba9;
	outline: none !important;
}
.signup-form a {
	color: #5cd3b4;
	text-decoration: underline;
}
.signup-form a:hover {
	text-decoration: none;
}
.signup-form form a {
	color: #5cd3b4;
	text-decoration: none;
}	
.signup-form form a:hover {
	text-decoration: underline;
}
.offset-4{
	margin-left: 33.333333%;
}
.gtco-nav ul li a {
  text-decoration: none;
}
.glores-A-title:before{
	border-left: 3px solid #777;
}
.glores-A-title{
	font-size: 14px;
/* 	color: black; */
}
.form-control{
	width: 300px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {

$("#1").click(function(){
    $("#resume").html(
    		'<label class="col-form-label col-4">증빙서류</label>'+
			'<div class="col-8 float">'+
               ' <input type="file" name="resume" required="required">'+
            '</div>'		
    )
	
	
    })

    $("#2").click(function(){
        $("#resume").html("");
    })

});

function inputPhoneNumber(obj) {

    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}

</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                // document.getElementById("jibunAddress").value = data.jibunAddress;

            }
        }).open();
    }
</script>

<body>
     <div class="container">
    <div class="row">
    <div class="col-sm-12 " >
    <div class="col-sm-3"></div>
     
    <div class="col-sm-6">
<!--     <h2>회원가입</h2> -->
<!--     <img src="join_img.png"> -->
<div class="signup-form">
    <form action="/member/joinImpl" method="post" class="form-horizontal">
      	<div class="row">
        	<div class="col-8 offset-4 join">
				<h2>회원가입</h2>
			</div>	
      	</div>			
        <div class="form-group row">
			<label class="col-form-label col-4">아이디</label>
			<div class="col-8 float">
                <input type="text" class="form-control" name="userId" required="required">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">비밀번호</label>
			<div class="col-8 float">
                <input type="password" class="form-control" name="userPw" required="required">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">비밀번호 확인</label>
			<div class="col-8 float">
                <input type="password" class="form-control" name="confirm_password" required="required">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">Email</label>
                <%-- <input class="btn-info btn-xs" type="button" value="인증"> --%>
			<div class="col-8 float">
                <input type="email" class="form-control" name="userEmail" required="required" />
                
            </div>
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">구분</label>
			<div class="col-8 float">
				<label><input type="radio" name="userActor" id="2" value="2" /> 학생&emsp;&emsp;</label>
				<label><input type="radio" name="userActor" id="1" value="1"/> 선생님</label>
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-4">이름</label>
			<div class="col-8 float">
                <input type="text" class="form-control" name="userName" required="required">
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-4">전화번호</label>
			<div class="col-8 float">
                <input type="text" class="form-control" onKeyup="inputPhoneNumber(this);" maxlength="13" name="userPhone" required="required">
            </div>        	
        </div>

        <div class="form-group row">
			<label class="col-form-label col-4">주소</label>
			<!-- 주소 API 추가하기 -->
			<div class="col-8 float">

                <input type="text" id="postcode" placeholder="우편번호">
                <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" id="roadAddress" placeholder="도로명주소" size="35">
<%--                <input type="text" id="jibunAddress" placeholder="지번주소" size="35">--%>
                <input type="text" id="detailAddress" placeholder="상세주소" size="35">

            </div>
        </div>

        <div class="form-group row" id="resume" >
        </div>

        <div class="form-group row">
			<label class="col-form-label col-4">성별</label>
			<div class="col-8 float">
				<label><input type="radio" name="userGender" value="m"/> 남&emsp;&emsp;</label>
				<label><input type="radio" name="userGender" value="w"/> 여</label>
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-4">생년월일</label>
			<div class="col-8 float">
				<p><input type="date" name="userBirth" value="2000-01-01"
                          min="1940-01-01" max="2020-12-31" /></p>
            </div>        	
        </div>
        
        <div style="margin-left:-15px;">
	       <h4 class="glores-A-title">개인정보처리방침</h4>
		       <div class="glores-A-agree" style="width: 600px; height: 200px; overflow: scroll; overflow-x: hidden; magin:0 auto; border: 1px solid #ccc; padding: 10px; background: white">
		       <h5 style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; margin: 0px; padding: 0px; font-size: 15px;">수집하는 개인정보의 항목</h5><p style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; margin-top: 15px; padding-left: 10px; font-size: 13px; list-style-type: none; color: rgb(68, 68, 68);">회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p><ul style="margin: 15px 0px 0px; padding: 0px; font-size: 13px; list-style-type: none; color: rgb(68, 68, 68); font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif;"><li style="margin-top: 10px; padding-left: 10px;"><strong>- 수집항목</strong>&nbsp;:&nbsp;<span class="privacy_column_list">아이디, 별명, 패스워드, 성명, e-mail, 주소, 전화번호, 휴대전화, 생년월일, 결혼, 추천인 아이디</span></li><li style="margin-top: 10px; padding-left: 10px;"><strong>- 개인정보 수집방법</strong>&nbsp;:&nbsp;홈페이지(회원가입)</li></ul><h5 style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; margin: 40px 0px 0px; padding: 0px; font-size: 15px;">개인정보의 수집 및 이용목적</h5><p style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; margin-top: 15px; padding-left: 10px; font-size: 13px; list-style-type: none; color: rgb(68, 68, 68);">회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p><ul style="margin: 15px 0px 0px; padding: 0px; font-size: 13px; list-style-type: none; color: rgb(68, 68, 68); font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif;"><li style="margin-top: 10px; padding-left: 10px;"><strong>- 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</strong><p style="margin-top: 15px; padding-left: 10px; list-style-type: none;">구매 및 요금 결제, 물품배송 또는 청구지 등 발송</p></li><li style="margin-top: 10px; padding-left: 10px;"><strong>- 회원 관리</strong><p style="margin-top: 15px; padding-left: 10px; list-style-type: none;">회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 연령확인</p></li></ul><h5 style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; margin: 40px 0px 0px; padding: 0px; font-size: 15px;">개인정보의 보유 및 이용기간</h5><p style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; margin-top: 15px; padding-left: 10px; font-size: 13px; list-style-type: none; color: rgb(68, 68, 68);">회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.</p>
		       </div>
		    
				<p><label class="form-check-label"><input type="checkbox" required="required"> 위 이용약관에 동의합니다.</label></p>
		    
		    
		    
	       <h4 class="glores-A-title">이용약관</h4>
		       <div class="glores-A-agree" style="width: 600px; height: 200px; overflow: scroll; overflow-x: hidden; magin:0 auto; border: 1px solid #ccc; padding: 10px; background: white">
		    	<div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);"><h4 style="margin: 0px 0px 0.5em;">제1조(목적)</h4><p style="font-size: 13px; line-height: 1.5em; margin-top: 15px; padding-left: 10px; list-style-type: none;">이 약관은 어바웃쌤 회사(전자상거래 사업자)가 운영하는 어바웃쌤 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리,의무 및 책임사항을 규정함을 목적으로 합니다.<br>※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」</p><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);"><h4 style="margin: 0px 0px 0.5em;">제2조(정의)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰” 이란 어바웃쌤 회사가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">‘회원'이라 함은 “몰”에 개인정보를 제공하여 회원등록을 한 자로서, “몰”의 정보를 지속적으로 제공받으며, “몰”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">‘비회원'이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.</li></ol><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);"><h4 style="margin: 0px 0px 0.5em;">제3조 (약관등의 명시와 설명 및 개정)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호?모사전송번호?전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회?배송책임?환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 전자상거래등에서의 소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다.<br>다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 ‘몰“에 송신하여 ”몰“의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다.</li></ol><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);"><h4 style="margin: 0px 0px 0.5em;">제4조(서비스의 제공 및 변경)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 다음과 같은 업무를 수행합니다.<ol style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">재화 또는 용역에 대한 정보 제공 및 구매계약의 체결</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">구매계약이 체결된 재화 또는 용역의 배송</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">기타 “몰”이 정하는 업무</li></ol></li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li></ol><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);"><h4 style="margin: 0px 0px 0.5em;">제5조(서비스의 중단)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 컴퓨터 등 정보통신설비의 보수점검?교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 e-Money 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.</li></ol><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);"><h4 style="margin: 0px 0px 0.5em;">제6조(회원가입)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.<ol style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">등록 내용에 허위, 기재누락, 오기가 있는 경우</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우</li></ol></li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">회원가입계약의 성립시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 “몰”에 대하여 그 변경사항을 알려야 합니다.</li></ol><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);"><h4 style="margin: 0px 0px 0.5em;">제7조(회원 탈퇴 및 자격 상실 등)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">회원이 다음 각호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.<ol style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">가입신청시에 허위내용을 등록한 경우</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”을 이용하여 구입한 재화등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">다른사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li></ol></li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이 회원 자격을 제한?정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</li></ol><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);"><h4 style="margin: 0px 0px 0.5em;">제8조(회원에 대한 통지)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.</li></ol><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);"><h4 style="margin: 0px 0px 0.5em;">제9조(구매신청)</h4><div style="font-size: 13px; line-height: 1.4em;">“몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.<ol style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">재화등의 검색 및 선택</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">약관내용, 청약철회권이 제한되는 서비스, 배송료?설치비 등의 비용부담과 관련한 내용에 대한 확인</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">결제방법의 선택</li></ol></div><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);"><h4 style="margin: 0px 0px 0.5em;">제10조 (계약의 성립)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.<ol style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">신청 내용에 허위, 기재누락, 오기가 있는 경우</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">미성년자가 담배, 주류등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우</li></ol></li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소등에 관한 정보등을 포함하여야 합니다.</li></ol><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);"><h4 style="margin: 0px 0px 0.5em;">제11조(지급방법)</h4><div style="font-size: 13px; line-height: 1.4em;">“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.<ol style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">선불카드, 직불카드, 신용카드 등의 각종 카드 결제</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">온라인무통장입금</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">전자화폐에 의한 결제</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">수령시 대금지급</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">마일리지 등 “몰”이 지급한 포인트에 의한 결제</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">기타 전자적 지급 방법에 의한 대금 지급 등</li></ol></div><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);"><h4 style="margin: 0px 0px 0.5em;">제12조(수신확인통지.구매신청 변경 및 취소)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">수신확인통지를 받은 이용자는 의사표시의 불일치등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송전에 이용자의 요청이 있는 경우에는 지체없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.</li></ol><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);"><h4 style="margin: 0px 0px 0.5em;">제13조(재화등의 공급)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 이용자와 재화등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 2영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의?과실이 없음을 입증한 경우에는 그러하지 아니합니다.</li></ol></div>
		       </div>
        </div>
        
		<div class="form-group row">
				<p><label class="form-check-label"><input type="checkbox" required="required"> 위 이용약관에 동의합니다.</label></p>
			<div class="col-8 offset-4">
				<button type="submit" class="btn btn-primary btn-lg">회원가입</button>
			</div>  
		</div>		      
    </form>
</div>


     
    </div>
    </div>
</div>    
</div>
<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/footer.jsp"></jsp:include> --%>
</body>

<%@ include file="/WEB-INF/layout/main/footer.jsp" %>