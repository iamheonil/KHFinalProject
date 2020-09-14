<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!-- 아임포트 API -->
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>
.menu-item#lessonM ul {
   height: 93px; 
}

#paymentM{
  background: #eee;
}
.container{
	width: 800px;
}
</style>



<script type="text/javascript">

window.onload = function(){
    var dt = new Date();
    var Year = dt.getFullYear();        
    var Month = "" + (dt.getMonth()+1);
    var Day = "" + dt.getDate();            
    
    if(Month.length < 2) Month = "0" + Month;
    if(Day.length < 2) Day = "0" + Day;
    
    var Today = Year.toString()+"/" + Month +"/" + Day;
    
    document.getElementById("paydate").innerText = Today;
} 

</script>

<!-- paymentchk가 체크되어야만 pay클릭 가능 -->
<script type="text/javascript">
$(document).ready(function(){
   $("#paymentchk").change(function(){
       if( $(this).is(":checked")){
          $("#pay").attr("disabled", false);  
       }else {
          $("#pay").attr("disabled", true);  
       }
    });
})
</script>


<!-- 아임포트  -->
<script type="text/javascript">
$(document).ready(function() {
   // iamport 변수 초기화
   var IMP = window.IMP;
   IMP.init('imp28306116');   // 가맹점 식별코드, 회원가입해서 직접 넣어야합니다
   // 결제 모듈 불러오기
   $("#pay").click(function() {
      requestPayment();
   });
});
// 결제 요청 - 결제 모듈 불러오기
function requestPayment() {
   IMP.request_pay({
       pg : 'html5_inicis', //PG사 - 'kakao':카카오페이, 'html5_inicis':이니시스(웹표준결제), 'nice':나이스페이, 'jtnet':제이티넷, 'uplus':LG유플러스, 'danal':다날, 'payco':페이코, 'syrup':시럽페이, 'paypal':페이팔
       pay_method : 'card', //결제방식 - 'samsung':삼성페이, 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
       merchant_uid : 'merchant_' + new Date().getTime(), //고유주문번호 - random, unique
       name : '${lesson.LESSON_TITLE }', //주문명 - 선택항목, 결제정보 확인을 위한 입력, 16자 이내로 작성
       amount : '1000', //결제금액 - 필수항목
       buyer_email : '${user.userEmail }', //주문자Email - 선택항목
       buyer_name : '${user.userName }', //주문자명 - 선택항목
       buyer_tel : '${user.userPhone}', //주문자연락처 - 필수항목, 누락되면 PG사전송 시 오류 발생
       
   }, function(rsp) { // callback - 결제 이후 호출됨, 이곳에서 DB에 저장하는 로직을 작성한다
       if ( rsp.success ) { // 결제 성공 로직
           var msg = '결제가 완료되었습니다.';
//            msg += '고유ID : ' + rsp.imp_uid;
//            msg += '상점 거래ID : ' + rsp.merchant_uid;
//            msg += '결제 금액 : ' + rsp.paid_amount;
//            msg += '카드 승인번호 : ' + rsp.apply_num;
//            msg += '[rsp.success]';
           
           // 결제 완료 처리 로직
         //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
         jQuery.ajax({
            url: "<%=request.getContextPath() %>/teacher/paycomplete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
            type: 'POST',
            dataType: 'json',
            data: {
               // rsp객체를 통해 전달된 데이터를 DB에 저장할 때 사용한다
               merchant_uid : 'merchant_' + new Date().getTime(), //고유주문번호 - random, unique
//                 name : '${classpayment.classname }', //주문명 - 선택항목, 결제정보 확인을 위한 입력, 16자 이내로 작성
                amount : '1000', //결제금액 - 필수항목
//                 buyer_email : '${classpayment.useremail }', //주문자Email - 선택항목
//                 buyer_name : '${classpayment.username }', //주문자명 - 선택항목
//                 buyer_tel : '${classpayment.userphone }', //주문자연락처 - 필수항목, 누락되면 PG사전송 시 오류 발생
                lessonNo :'${lesson.LESSON_NO}', // 과외 번호
                   
            }
         
         }).done(function(data) {
            //[2] 서버에서의 응답 처리
            if ( data == 'success' ) {
               var msg = '결제가 완료되었습니다.';
//                msg += '\n고유ID : ' + rsp.imp_uid;
//                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
//                msg += '\n결제 금액 : ' + rsp.paid_amount;
//                msg += '\n카드 승인번호 : ' + rsp.apply_num;
//                  msg += '\n[done]';
               alert(msg);
               location.href="<%=request.getContextPath() %>/teacher/paymentlist";
               
             } else {
                //[3] 아직 제대로 결제가 되지 않았습니다.
                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
             }
          });
           
       } else { // 결제 실패 로직
           var msg = '결제에 실패하였습니다.';
           msg += '에러내용 : ' + rsp.error_msg;
       }
       alert(msg);
      	 location.href="<%=request.getContextPath() %>/teacher/paymentlist";
   });
   
   
}
</script>



<body>
<div class="container">
<table class="table table-bordered">
        <caption> 회원 정보 </caption>
    <tbody>
            <tr>
                <th>이름 </th>
                <td>${user.userName }</td>
            </tr>
            <tr>
                <th>전화번호 </th>
                <td>${user.userPhone }</td>
            </tr>
            <tr>
                <th>이메일 </th>
                <td>${user.userEmail }</td>
            </tr>
    </tbody>
</table>
<table class="table table-bordered">
        <caption> 결제할 과외 정보 </caption>
    <tbody>
            <tr>
                <th>과외번호 </th>
                <td>${lesson.LESSON_NO }</td>
            </tr>
            <tr>
                <th>과외명 </th>
                <td>${lesson.LESSON_TITLE }</td>
            </tr>
            <tr>
                <th>과외내용 </th>
                <td>${lesson.LESSON_TITLE }</td>
            </tr>
            <tr>
                <th>위치 </th>
                <td>${lesson.LESSON_LOC }</td>
            </tr>
            <tr>
                <th>인원 </th>
                <td>${lesson.MAX_PEOPLE }</td>
            </tr>
            <tr>
                <th>과외비 </th>
                <td>${lesson.LESSON_PRICE }</td>
            </tr>
            <tr>
                <th>작성일 </th>
                <td>${lesson.LESSON_DATE }</td>
            </tr>
    </tbody>
</table>
<table class="table table-bordered">
        <caption> 결제 정보 </caption>
    <tbody>
            <tr>
                <th>결제날짜 </th>
                <td id="paydate" ></td>
            </tr>
            <tr>
                <th>결제금액 </th>
                <td style="color: red;">1000원</td>
            </tr>
    </tbody>
</table>
<br>
<p>※ 결제 완료 시 환불이 불가합니다.</p>
<label for="paymentchk">결제 내용에 동의하십니까?</label>   
<input type="checkbox" required="required" name="paymentchk" id="paymentchk">
<br><br>

<button id="pay" class="btn btn-default" disabled="disabled">결제</button>
<button id="cancel" class="btn btn-default" onclick="location.href='javascript:history.back()'">취소</button>
<br>
</div>



<br><br><br><br><br><br>

<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>


