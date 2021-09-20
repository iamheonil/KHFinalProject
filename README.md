# Spring Framework 기반 웹 프로젝트

<br>

![GitHub release (latest by date)](https://img.shields.io/github/v/release/iamheonil/KHFinalProject) &nbsp; ![GitHub repo size](https://img.shields.io/github/repo-size/iamheonil/KHFinalProject) &nbsp; ![GitHub contributors](https://img.shields.io/github/contributors/iamheonil/KHFinalProject) &nbsp; ![GitHub top language](https://img.shields.io/github/languages/top/iamheonil/KHFinalProject)

### 슬기로운 과외생활 (온라인 과외 매칭 플랫폼)

<br>


### 프로젝트 기간 2020.07.21 ~ 2020.09.21
- 사진으로 간편하게 보시려면 (https://github.com/iamheonil/KHFinalProject/blob/master/images/images.md)


---


#### 구현파트 (Ctrl + F 를 사용하셔서 이름을 찾는게 빠릅니다.) 

#### 이인주 (https://github.com/inju521)

- 공지사항(관리자) : 글쓰기 (네이버 스마트 에디터 v.2.0 (API) 사용), 수정 , 삭제(check box 삭제) , 페이징
- 수익관리(관리자) : 부트스트랩을 이용한 막대 그래프로 2020년 월별 수익현황을 보여줌
- 회원정보 수정 (과외 선생님 & 학생)
- 개인정보 보안을 위한 2차 인증 절차 : 입력한 비밀번호와 DB에 있는 비밀번호가 일치하는지 확인(Spring Security & js ajax)
- 개인정보 확인 / 수정 / 회원 탈퇴 : 프로필 사진(FileUpload)  / 개인정보 확인& 수정 / 연결된 과외가 없으면 회원탈퇴진행
- 학생찾기(학생) :  글쓰기&  글 수정 (네이버 스마트 에디터 v.2.0 (API) 사용), 삭제(check box 삭제),  
- 개인 작성 목록 , 글 게시상태 변경(jquery  ajax) , 제목 & 내용 검색,글 상세보기 (모달) , 페이징
- 학생 찾기(일반 사용자 ) : 목록 / 상세보기 (모달,  카카오 지도 api)  / 조건 검색 / 페이징

#### 구동영 (https://github.com/GuDongyeong)

- 관리자
    - 중고장터/질문/후기 게시판 신고내역관리 - 신고 반려/삭제, 검색
- 선생님 페이지
    - 과외 종료
    - 학생 신청 내역 조회 및 승인/거절
    - 과외 및 학생 정보 조회
- 학생 페이지
    - 찜한 과외 조회 및 과외 신청
    - 중고장터에 작성한 글/댓글 조회 및 상세 페이지 이동
- 일반 사용자 페이지 - 중고장터
    - 중고장터 게시글 리스트 조회/상세보기
    - 게시글 작성/수정/삭제(네이버 스마트 에디터 v.2.0 API)
    - 댓글, 대댓글 작성/수정/삭제
    - 신고하기

#### 김성은 (https://github.com/KimSeongeun97)

- 관리자
    - 회원 관리 : 학생, 선생님 상세 정보 조회 및 작성 게시글 열람
- 선생님 페이지
    - 과외 등록
    - 과외 검토 : 관리자 검토 완료된 과외글 결제하기(아임포트 - 결제연동 API)
    - 내 과외 목록 : 과외찾기에 등록된 과외글 조회
 - 학생 페이지
    - 과외 신청 내역 조회 및 신청 취소
    - 질문게시판 : 본인이 작성한 게시글, 댓글 조회 및 상세 페이지 이동
    - 일반 사용자 : 질문게시판 - 게시글 조회, 게시글 작성/수정/삭제(네이버 스마트 에디터 v.2.0 (API) 사용), 댓글,대댓글 작성/수정/삭제, 신고하기

#### 김수현 (https://github.com/tngus2280)

- 

#### 김헌일 (https://github.com/iamheonil)

- Github 코드 형상관리 및 유지보수
- 회원가입 (Spring Security, Naver API)
    - 학생 회원가입
    - 선생님 회원가입
    - 네이버 아이디 로그인
- 로그인
    - 학생, 선생님 로그인
    - 네이버 아이디 로그인
    - 관리자 페이지 로그인
- 아이디/비밀번호 찾기
    - 학생, 선생님 아이디 찾기
    - 학생, 선생님 비밀번호 찾기
- 프론트앤드 (Kakao Maps API)
 - 로그인 후 페이지 구현, 중고장터, 문의하기, 제작자 소개 작성

#### 이서연 (https://github.com/2seoyeon)

- 공통 : 공지사항 목록 및 상세조회, 수강한 과외의 후기 작성 및 조회, 게시글 신고 기능 구현, 구현 페이지 내의 검색, 페이징 처리 구현
- 학생 페이지 : 게시글 신고 내역 및 신고 처리 현황 조회
- 선생님 페이지 : 파일 업로드 및 다운로드를 이용한 자료실 게시판 구현, 매칭 된 과외 목록 조회
- 관리자 : 전체 과외 목록 조회, 과외 상세정보 조회, 과외 검토(승인 및 반려)기능 구현, 학생 찾기 게시판 목록 조회, 학생 찾기 게시글 상세 조회
- Front : 메인 페이지 footer 구현, 관리자 페이지 header, footer 구현

#### 이효진 (https://github.com/lhg0314)

- 관리자
    -중고장터 삭제, 조회, 검색
- 선생님페이지 
    -채팅방 조회, 채팅 알림, 채팅방 이동
    -중고장터, 후기 신고내역 및 신고 상태
- 학생페이지
    -채팅방 목록 조회, 채팅 알림, 해당 채팅방으로 이동
    -연결된 과외목록 조회 
    -연결된 과외선생님 정보 모달 조회
    -자료실페이지
- 공통 
    -과외 찾기페이지
    -과외 검색 필터링
    -과외 상세 페이지(과외 리뷰,과외정보,과외사진 조회,과외 찜하기,과외 신청,과외문의)
- 프론트
    -로그인 전 메인페이지, footer(개인정보 처리방침,사이트 이용방침 모)

<br>

### 기능구현

 - 학생
    - 회원가입
       - 아이디 찾기
       - 비밀번호 찾기
       - 개인정보 관리(수정, 탈퇴 등)
    - 로그인
       - 일반 로그인
       - 네이버 아이디 로그인 (회원가입 연동)
   - 커뮤니티
     - 게시글 쓰기
     - 게시글 수정
     - 게시글 삭제
     - 댓글 작성
     - 댓글 수정
     - 댓글 삭제
     - 대댓글 작성
     - 대댓글 수정
     - 대댓글 삭제
     - 자료실
     - 중고장터
     - 게시글 신고기능
   - 마이페이지
     - 강의 신청 정보
     - 강의 찜 목록
   - 선생님 찾기
   
   <br>
   
   
 - 과외선생님
    - 회원가입
       - 아이디 찾기
       - 비밀번호 찾기
       - 이력서, 학력증빙자료 등록
       - 개인정보 관리(수정, 탈퇴 등)
     - 로그인
       - 일반 로그인
       - 네이버 아이디 로그인 (회원가입 연동)
   - 커뮤니티
     - 게시글 쓰기
     - 게시글 수정
     - 게시글 삭제
     - 댓글 작성
     - 댓글 수정
     - 댓글 삭제
     - 대댓글 작성
     - 대댓글 수정
     - 대댓글 삭제
     - 자료실
     - 중고장터
     - 게시글 신고기능
   - 마이페이지
     - 학생관리
       - 학생 리스트
       - 수강 학생의 개인정보 관리
     - 일정관리
   - 학생 찾기
   
   <br>
   
   
 - 관리자
    - 로그인
    - 학생관리
    - 선생님관리
    - 수익관리
    - 공지사항 등록
    - 과외선생님 회원등록시 증빙서류 검토 작업
    - 허가된 과외선생의 과외 게시글 등록 검토 작업
    - 커뮤니티 관리기능
       - 신고내역 관리
       - 공지사항
          - 글 작성
          - 글 수정
          - 글 삭제
       - 후기게시판 / 질문게시판   
          - 글 삭제

<br>

### 개발환경

 - Mac OS / Windows7 / Windows 10
 - Eclipse 2019-12 (4.14)
 - IntelliJ 2020.02
 - Spring Tools 3 (Standalone Edition) 3.9
 - JRE 1.8.0
 - JAVA - Spring Framework (5.2.7 Release)
 - MyBatis (3.5.5)
 - Oracle Database 11g
 - Apache Tomcat 9.0.35
 - Front FrameWork - Bootstrap
 - Spring Framework 5.2.7
 - 프로젝트 협업툴 & 기타 작업툴 - Github Desktop / SourceTree / Jira / SQL Developer / DataGrip
 
<br>

### 사용한 API 및 Dependency
 - Dependency
    - Spring Security / MyBatis / AspectJ / Logging / Inject / Servlet / JUnit Test / Mail Service / jackson-core / FileUpload / hamcrest / mockito

 - API
    - Kakao Maps / NAVER / AJAX
 
<br>

### 릴리즈 정보

https://github.com/iamheonil/KHFinalProject/releases

<br>

-------

<br>
