# [개인 프로젝트 #1] 일정 관리 사이트 / 앱 <br> (mediCal = medical + calendar)

## 기획 의도

언제 시력 검사 받았지? 언제 구강 검진 받았지? 검사 받을 때가 되었나? <br>
이런 건강 검진 일정, 이젠 한 눈에 관리하자!!

## 개발 기간

- 2021.11.18 ~ 2022.01.30

## 기술 스택

- front : HTML, CSS, Javascript, jQuery, Ajax
- back : Java(1.8), Spring framework(5.0.7), Oracle(11.2.0.1.0), MyBatis(3.4.6), Tomcat(8.5)

## 주요 기능

- 전체적인 스타일은 Bootstrap SB Admin 2 테마 적용
- 회원 가입
- 로그인 / 로그아웃 : Spring Security를 이용
- 일반 일정 추가 : 일정이 어떤 내용인지만 선택하면 주기가 자동으로 결정되는 일정
- 커스텀 일정 추가 : 사용자가 직접 주기를 결정하는 일정
- 단순 일정 추가 : 주기 없이 단순히 일자만 기록하는 일정
- 유효성 검증 : 모든 input에 프론트 단에서의 유효성 검증을 적용
- 계정 정보 조회 / 비밀번호 수정
- 회원 탈퇴
- Android Studio의 Web View를 이용해 모바일 앱 형태로 구현

## DB 설계

![image](https://user-images.githubusercontent.com/48465072/159702634-31f11468-573b-41d7-9492-7b9254646f4c.png)

## 실행 화면

<details><summary>회원 관련 페이지</summary>

  <br>
  
  ![image](https://user-images.githubusercontent.com/48465072/159705200-099cd487-7ee7-4367-a80c-8c73f718f852.png)
  <br>회원가입 화면에서 아무 입력이 없는 경우 입력해달라는 메시지가 표시됩니다.

  ![image](https://user-images.githubusercontent.com/48465072/159705749-7d17b0ef-6f85-4d37-a237-60ad5b5a1c93.png)
  <br>입력이 유효성 검증을 통과하지 못하거나, ID가 이미 존재하거나, 비밀번호 체크가 틀려도 메시지가 출력됩니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159706774-ffde9a61-a473-46c7-8130-bc9d8c057e81.png)
  <br>로그인 폼에서도 빈칸이면 메시지가 출력되며, ID나 비밀번호가 틀리면 알림 창으로 알려줍니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159718203-1017687a-56f4-4254-b3e9-8f708bf95801.png)
  <br>로그인 후 볼 수 있는 계정 관련 페이지입니다. 로그아웃이나 계정 탈퇴하면 로그인 페이지 이동 후 알림 창으로 알려줍니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159716981-3b834cf8-319c-4d7f-8c31-6f2e6ee1ddb1.png)
  <br>계정 정보를 조회하고 비밀번호를 변경하는 페이지입니다. 유효성 검증이 적용되어 있습니다.
  
</details>

<details><summary>일정 관련 페이지</summary>

  <br>
  
  ![image](https://user-images.githubusercontent.com/48465072/159725929-33673d7d-e061-4b3e-8f1e-898d92a6e43d.png)
  <br>로그인 후 나오는 개인 일정 목록 페이지로, Paging 기능이 적용되어 있습니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159726408-2fc8fcb8-56e9-4013-9cb4-80a90a0bdb25.png)
  <br>키워드 검색 기능도 적용되어 있습니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159735689-9d26c72d-cc42-470a-a61f-d46b518d19f9.png)
  <br>개인 일정 목록 페이지에서 등록 버튼을 누르면 3가지 유형의 일정 등록을 선택할 수 있습니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159727497-508fc006-cd86-46cb-b5fd-f739b13afbe1.png)
  <br>먼저 일반 일정 등록입니다. 분류를 선택하면 바로 아래 표에 해당 내용이 활성화되며, 
  <br>체크박스를 누르면 아래에 선택한 종류를 표시합니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159728674-04da1e1e-508e-4876-8261-b32cef1ae322.png)
  <br>표에서 선택한 종류에 대한 주기도 자동으로 입력되며, 
  <br>검사/복용 일자를 선택하면 다음 일자도 자동으로 계산해 입력됩니다. 
  <br>여기 페이지 이외에도 입력 가능한 곳에는 유효성 검증이 적용되어 있습니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159732308-ae4143d8-5e36-4ab1-a727-3984b7917146.png)
  <br>그 다음으로 커스텀 일정 등록입니다. 종류 명과 주기를 입력하면 다음 일자가 계산되어 입력됩니다. 
  
  ![image](https://user-images.githubusercontent.com/48465072/159738680-e451145a-cb95-4680-8e4e-c6b994d4f29a.png)
  <br>마지막으로 단순 일정 등록입니다. 주기 없이 단순히 일자만 입력합니다.

  ![image](https://user-images.githubusercontent.com/48465072/159734545-9cabc20b-09a8-4c6e-932d-fe63506f9c60.png)
  <br>단순 일정은 개인 일정 목록에서 다음 일자가 생략됩니다. 종류를 선택하면 해당 일정 조회/변경/삭제 페이지로 이동합니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159737577-3df9174c-3bf4-4f27-8501-3ae822fbfb42.png)
  <br>일정 조회/변경/삭제 페이지입니다. 일자나 메모를 변경할 수 있으며, 삭제도 가능합니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159738053-5c9b162e-c9ed-41f9-9928-becdd93a0389.png)
  <br>DB에 저장되어 있는 사용 설명서를 보여주는 페이지입니다.
  
</details>

<details><summary>Android App</summary>

  <br>

  ![image](https://user-images.githubusercontent.com/48465072/160073647-68bf7c5b-c906-4e10-8cff-e51acebf5572.png)
  <br>Android Studio의 Web View를 이용해 구현한 모바일 App에서 실행 화면입니다.

</details>
  
## 마치며

구현한 앱은 완전한 하나의 앱이라 보긴 어렵고 부가 기능에 적합하다고 생각합니다. 그래서 이 기능이 어디에 쓰일 수 있을지 생각해봤습니다.

- 일반 달력 앱의 부가 기능
- 병원 예약 앱의 부가 기능

이런 앱에서 부가 기능으로 쓰인다면 접근성도 좋고 사용자가 관리하기에 수월할 것이라 생각합니다.

<br>

원래 계획한 것을 모두 구현한 것은 아닙니다. 아래 내용도 추가로 구현할 계획입니다.

- 개인 일정 목록에서 필터링 기능 (대분류, 날짜 등)
- 각종 표에서 제목을 클릭하면 일정 명 혹은 날짜 별로 정렬하는 기능
- 의료 관련 내용에 대한 정보를 알 수 있는 의료 지식 사전
- 의료와 생활 뿐만 아니라 일정과 관련된 다른 분야도 탐색해 적용
- App 관리자를 추가하고 사용자가 선택할 수 있는 일정을 늘리는 기능 적용
- Android app 뿐만 만드는 것이 아니라 IOS app도 같이 만들 수 있는 방법 탐색, 구현
- 모바일 app에서의 자동 로그인 구현
- Front-end 뿐만 아니라 Back-end에서의 유효성 검증도 구현
