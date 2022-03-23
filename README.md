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

- 회원 가입
- 로그인 / 로그아웃 : Spring Security를 이용
- 일반 일정 추가 : 일정이 어떤 내용인지만 선택하면 주기가 자동으로 결정되는 일정
- 커스텀 일정 추가 : 사용자가 직접 주기를 결정하는 일정
- 단순 일정 추가 : 주기 없이 단순히 일자만 기록하는 일정
- 유효성 검증 : 모든 input에 프론트 단에서의 유효성 검증을 적용
- 비밀번호 수정
- 회원 탈퇴
- Android Studio Web View 구현

## DB 설계

![image](https://user-images.githubusercontent.com/48465072/159702634-31f11468-573b-41d7-9492-7b9254646f4c.png)

## 실행 화면

<details><summary>회원 관련</summary>
  
  ![image](https://user-images.githubusercontent.com/48465072/159705200-099cd487-7ee7-4367-a80c-8c73f718f852.png)
  회원가입 화면에서 아무 입력이 없는 경우 입력해달라는 메시지가 표시됩니다.
  
  ![image](https://user-images.githubusercontent.com/48465072/159704998-3eab1571-6489-4f03-b3a5-5033290fdf97.png)
  입력이 유효성 검증을 통과하지 못하거나, ID가 이미 존재하거나, 비밀번호 체크가 틀려도 메시지가 출력됩니다.

  
</details>

## 마치며
