<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style type="text/css">

body {
    font-family: "Raleway", Arial, sans-serif;
    font-weight: 400;
    font-size: 16px;
    line-height: 1.7;
    color: #777;
    background: #fff;
}

#gtco-footer {
  background: #262626;
  padding: 7em 0 0 0 !important;
  margin-bottom: 0 !important;
  width: 100%;
  float: left;
}
#gtco-footer a:hover {
  color: #fff !important;
}
#gtco-footer .gtco-cta {
  margin-bottom: 30px;
}
#gtco-footer .gtco-cta h3 {
  color: #fff;
  font-size: 30px;
  font-weight: 300;
}
#gtco-footer .gtco-cta .btn-white {
  padding: 15px 20px !important;
}
#gtco-footer .gtco-cta .btn-white.btn-outline:hover {
  color: #000 !important;
}
#gtco-footer .gtco-footer-paragraph h3 {
  color: #fff;
    margin-bottom: 10px;  
  margin-top: -100px;
}
#gtco-footer .gtco-footer-link {
  padding-left: 30px;
}
@media screen and (max-width: 768px) {
  #gtco-footer .gtco-footer-link {
    padding-left: 15px;
  }
}
#gtco-footer .gtco-footer-link .gtco-list-link {
  padding: 0;
  margin: 0;
}
#gtco-footer .gtco-footer-link .gtco-list-link li {
  padding: 0;
  margin: 0;
  list-style: none;
}
#gtco-footer .gtco-footer-link .gtco-list-link li a {
  text-transform: uppercase;
  font-size: 13px !important;
}
#gtco-footer .gtco-footer-subscribe {
  padding-left: 30px;
}
@media screen and (max-width: 768px) {
  #gtco-footer .gtco-footer-subscribe {
    padding-left: 15px;
  }
}
#gtco-footer .gtco-footer-subscribe .form-control {
  background: #fff !important;
  border: none !important;
}
#gtco-footer .gtco-footer-subscribe .btn {
  margin-top: 4px;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  -ms-border-radius: 4px;
  border-radius: 4px;
  height: 54px !important;
  line-height: 1.5;
  padding-top: 10px; 
  padding-bottom: 10px;
  padding-left: 10px !important;
  padding-right: 10px !important;
}
#gtco-footer .gtco-copyright {
  background: #1a1a1a;
  padding: 30px 0; 
  float: left;
  width: 100%;
}
#gtco-footer .gtco-copyright p:last-child {
  margin-bottom: 0;
  
}

.footerMenu{
    text-align: center;
    padding-left: 42px;
    padding-right: 20px;
}

.footerMenu>li{
    display: flex;
    text-align: center;
}

.footerMenu a {
    color: #17B794;
    -webkit-transition: 0.5s;
    -o-transition: 0.5s;
    transition: 0.5s;
}

 p {   
   font-family: "Barlow", sans-serif !important;  
   font-weight: 300;   
   font-size: 13px;   
   color: #686c6d;   
   letter-spacing: 0.03rem;   
   margin-bottom: 10px;   
}   

.row-pb-md {
      padding-bottom: 4em !important;  
}


.gtco-container {
    max-width: 1140px;
    position: relative;
    margin: 0 auto;
    padding-left: 15px;  
    padding-right: 15px;  
}

.modal-dialog{
   overflow-y:initail !important;
}

.modal-body{
   max-height:400px;
   overflow-y:auto; 
}


</style>


<!-- footer -->
<style type="text/css">

.footer { 
   margin-top: 20px;
    background: #262626;
   text-align: center;
    padding: 25px 195px;
   height: 185px;
}


#footer_nav {
   
   display: flex;
    position: absolute;
    text-align: center;
    right: 23%;
}

#footer_nav p {

   color: #ccc;
    text-align: left;
}

#footer_nav a:hover {

   text-decoration: none;
   color: white;
}

#footer_nav li {
   
   font-size: 13px;
   color: #17B794;;
}

#footer_nav #short {

   border-right: 1px solid #333;
}

</style>


   <div class="clearfix"></div>  


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h6 class="modal-title" id="myModalLabel">개인정보 처리방침</h6>
      </div>
      <div class="modal-body">
           <p><p class="ls2 lh6 bs5 ts4"><em class="emphasis"><kh정보교육원>('http://localhost:8088'이하  '슬기로운 과외생활')</em>은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p><p class="ls2 lh6 bs5 ts4"><em class="emphasis"><kh정보교육원>('슬기로운 과외생활')</em> 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.</p><p class="ls2">○ 본 방침은부터 <em class="emphasis">2020</em>년 <em class="emphasis">8</em>월 <em class="emphasis">15</em>일부터 시행됩니다.</p></br><p class='lh6 bs4'><strong>1. 개인정보의 처리 목적 <em class="emphasis"><kh정보교육원>('http://localhost:8088'이하  '슬기로운 과외생활')</em>은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.</strong></p><ul class="list_indent2 mgt10"><p class="ls2">가. 홈페이지 회원가입 및 관리</p><p class="ls2">회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리 등을 목적으로 개인정보를 처리합니다.</p></br></ul><p class='sub_p mgt30'><strong>2. 개인정보 파일 현황</br>('http://localhost:8088'이하  '슬기로운 과외생활')가 개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.</strong></p><ul class='list_indent2 mgt10'><li class='tt'><b>1. 개인정보 파일명 : 슬기로운 과외생활</b></li><li>개인정보 항목 : 이메일, 휴대전화번호, 비밀번호, 로그인ID, 이름</li><li>수집방법 : 홈페이지</li><li>보유근거 : 홈페이지 회원관리등의 기록</li><li>보유기간 : 1년</li><li>관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년</li></ul><p class='sub_p mgt10'>※ 기타('http://localhost:8088'이하  '슬기로운 과외생활')의 개인정보파일 등록사항 공개는 개인정보보호위원회 개인정보보호 종합지원 포털(www.privacy.go.kr) → 개인정보민원 → 개인정보열람등 요구 → 개인정보파일 목록검색 메뉴를 활용해주시기 바랍니다.</p></br></br><p class='lh6 bs4'><strong>3. 개인정보의 처리 및 보유 기간</strong></br></br>① <em class="emphasis"><kh정보교육원>('슬기로운 과외생활')</em>은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리,보유합니다.</br></br>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</p><ul class='list_indent2 mgt10'><li class='tt'>1.<홈페이지 회원가입 및 관리></li><li class='tt'><홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<1년>까지 위 이용목적을 위하여 보유.이용됩니다.</li><li>보유근거 : 홈페이지 회원관리등의 기록</li><li>관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년</li><li>예외사유 : </li></ul>

<p class="lh6 bs4"><strong>4. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.</strong></p><p class="ls2">① 정보주체는 kh정보교육원에 대해 언제든지 개인정보 열람,정정,삭제,처리정지 요구 등의 권리를 행사할 수 있습니다.</p><p class='sub_p'>② 제1항에 따른 권리 행사는kh정보교육원에 대해 개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 kh정보교육원은(는) 이에 대해 지체 없이 조치하겠습니다.</p><p class='sub_p'>③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</p><p class='sub_p'>④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.</p><p class='sub_p'>⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</p><p class='sub_p'>⑥ kh정보교육원은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.</p></br></br><p class='lh6 bs4'><strong>5. 처리하는 개인정보의 항목 작성 </strong></br></br> ① <em class="emphasis"><kh정보교육원>('http://localhost:8088'이하  '슬기로운 과외생활')</em>은(는) 다음의 개인정보 항목을 처리하고 있습니다.</p><ul class='list_indent2 mgt10'><li class='tt'>1<홈페이지 회원가입 및 관리></li><li>필수항목 : 이메일, 휴대전화번호, 비밀번호, 로그인ID, 이름</li><li>- 선택항목 : </li></ul></br></br><p class='lh6 bs4'><strong>6. 개인정보의 파기<em class="emphasis"><kh정보교육원>('슬기로운 과외생활')</em>은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.</strong></p><p class='ls2'>-파기절차</br>이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.</br></br>-파기기한</br>이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.</p><p class='sub_p mgt10'></p></br></br><p class="lh6 bs4"><strong>7. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항</strong></p><p class="ls2">kh정보교육원 은 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키’를 사용하지 않습니다.<p class='sub_p mgt30'><strong>8. 개인정보 보호책임자 작성 </strong></p><p class='sub_p mgt10'> ①  <span class='colorLightBlue'>kh정보교육원(‘http://localhost:8088’이하 ‘슬기로운 과외생활)</span> 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.</p><ul class='list_indent2 mgt10'><li class='tt'>▶ 개인정보 보호책임자 </li><li>성명 :이효진</li><li>직책 :관리자</li><li>직급 :관리자</li><li>연락처 :010-0000-1111, abc123@naver.com, </li></ul><p class='sub_p'>※ 개인정보 보호 담당부서로 연결됩니다.<p/> <ul class='list_indent2 mgt10'><li class='tt'>▶ 개인정보 보호 담당부서</li><li>부서명 :</li><li>담당자 :</li><li>연락처 :, , </li></ul><p class='sub_p'>② 정보주체께서는 kh정보교육원(‘http://localhost:8088’이하 ‘슬기로운 과외생활) 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. kh정보교육원(‘http://localhost:8088’이하 ‘슬기로운 과외생활) 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</p><p class='sub_p mgt30'><strong>9. 개인정보 처리방침 변경 </strong></p><p class='sub_p mgt10'>①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p></br></br><p class='lh6 bs4'><strong>10. 개인정보의 안전성 확보 조치 <em class="emphasis"><kh정보교육원>('슬기로운 과외생활')</em>은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.</strong></p><p class='sub_p mgt10'>1. 정기적인 자체 감사 실시</br> 개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.</br></br></p></p>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
       
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h6 class="modal-title" id="myModalLabel">사이트 이용약관 </h6>
      </div>
      <div class="modal-body">
           <div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif;"><h4 style="margin: 0px 0px 0.5em;">제1조(목적)</h4><p style="font-size: 13px; line-height: 1.5em; margin-top: 15px; padding-left: 10px; list-style-type: none;">이 약관은 어바웃쌤 회사(전자상거래 사업자)가 운영하는 어바웃쌤 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리,의무 및 책임사항을 규정함을 목적으로 합니다.<br>※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」</p><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif;"><h4 style="margin: 0px 0px 0.5em;">제2조(정의)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰” 이란 어바웃쌤 회사가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">‘회원'이라 함은 “몰”에 개인정보를 제공하여 회원등록을 한 자로서, “몰”의 정보를 지속적으로 제공받으며, “몰”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">‘비회원'이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.</li></ol><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif;"><h4 style="margin: 0px 0px 0.5em;">제3조 (약관등의 명시와 설명 및 개정)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호?모사전송번호?전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회?배송책임?환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 전자상거래등에서의 소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다.<br>다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 ‘몰“에 송신하여 ”몰“의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다.</li></ol><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif;"><h4 style="margin: 0px 0px 0.5em;">제4조(서비스의 제공 및 변경)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 다음과 같은 업무를 수행합니다.<ol style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">재화 또는 용역에 대한 정보 제공 및 구매계약의 체결</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">구매계약이 체결된 재화 또는 용역의 배송</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">기타 “몰”이 정하는 업무</li></ol></li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li></ol><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif;"><h4 style="margin: 0px 0px 0.5em;">제5조(서비스의 중단)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 컴퓨터 등 정보통신설비의 보수점검?교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 e-Money 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.</li></ol><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif;"><h4 style="margin: 0px 0px 0.5em;">제6조(회원가입)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.<ol style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">등록 내용에 허위, 기재누락, 오기가 있는 경우</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우</li></ol></li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">회원가입계약의 성립시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 “몰”에 대하여 그 변경사항을 알려야 합니다.</li></ol><p class="sc_ptop" style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;"><br></p></div><div class="acon" style="font-family: &quot;Noto Sans&quot;, &quot;Nanum Gothic&quot;, &quot;Malgun Gothic&quot;, sans-serif;"><h4 style="margin: 0px 0px 0.5em; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);">제7조(회원 탈퇴 및 자격 상실 등)</h4><ol style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none; color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">회원이 다음 각호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.<ol style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;"><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">가입신청시에 허위내용을 등록한 경우</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”을 이용하여 구입한 재화등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">다른사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li></ol></li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이 회원 자격을 제한?정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.</li><li style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</li><li></li></ol></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
       
      </div>
    </div>
  </div>
</div>
      
     
     
   
                   
      <footer>
          <div class="footer">
          
	          	<div id="footer_nav">
	          	<div>
			        <img src="${pageContext.request.contextPath}/resources/images/footer_logo.png" 
		           				alt="슬기로운 과외생활" style="width: 120px; height: 120px;">
					<p>&copy; 슬기로운 과외생활</p>
	         	</div>
	        	
					<ul class="gtco-list-link footerMenu" id="short">
						<p>SUPPORT</p>
						<li><a href="#">문의하기</a></li>
					</ul>
					<ul class="gtco-list-link footerMenu" id="short">
						<p>ABOUT US</p>
						<li><a href="#">제작자 소개</a></li>
						<li><a href="#">사이트 소개</a></li>
					</ul>
					<ul class="gtco-list-link footerMenu" id="short">
						<p>POLICY</p>
						<li><a href="#" data-toggle="modal" data-target="#myModal">개인정보 처리방침</a></li>
						<li><a href="#" data-toggle="modal" data-target="#myModal2">사이트 이용약관</a></li>
					</ul>
					<ul class="gtco-list-link footerMenu">
						<p>CONTACT</p>
						<li>loc&nbsp; |&nbsp; 서울시 강남구 테헤란로 그랑프리빌딩 4F</li>
						<li>tel&nbsp; |&nbsp; 070 1234 5678</li>
						<li>e-mail&nbsp; |&nbsp; abc@kh.com</li>
						<li>고객센터&nbsp; |&nbsp; 월-금 9:00-17:00</li>
					</ul>
				</div>
				
			</div>
			
             
                <div id="footer_nav">
                <div>
                 <img src="${pageContext.request.contextPath}/resources/images/footer_logo.png" 
                             alt="슬기로운 과외생활" style="width: 120px; height: 120px;">
               <p>&copy; 슬기로운 과외생활</p>
               </div>
              
               <ul class="gtco-list-link footerMenu" id="short">
                  <p>SUPPORT</p>
                  <li><a href="#">문의하기</a></li>
               </ul>
               <ul class="gtco-list-link footerMenu" id="short">
                  <p>ABOUT US</p>
                  <li><a href="#">제작자 소개</a></li>
                  <li><a href="#">사이트 소개</a></li>
               </ul>
               <ul class="gtco-list-link footerMenu" id="short">
                  <p>POLICY</p>
                  <li><a href="#" data-toggle="modal" data-target="#myModal">개인정보 처리방침</a></li>
                  <li><a href="#" data-toggle="modal" data-target="#myModal2">사이트 이용약관</a></li>
               </ul>
               <ul class="gtco-list-link footerMenu">
                  <p>CONTACT</p>
                  <li>loc&nbsp; |&nbsp; 서울시 강남구 테헤란로 그랑프리빌딩 4F</li>
                  <li>tel&nbsp; |&nbsp; 070 1234 5678</li>
                  <li>e-mail&nbsp; |&nbsp; abc@kh.com</li>
                  <li>고객센터&nbsp; |&nbsp; 월-금 9:00-17:00</li>
               </ul>
            </div>
            
         </div>
         
      </footer>
                