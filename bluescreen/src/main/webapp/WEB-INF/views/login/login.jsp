<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pages - Login</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- Font Awesome 추가 -->
  <link rel="stylesheet" href="css/login.css">	
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">
  $(function(){
      $("#loginForm").submit(function(event){
          event.preventDefault(); // 기본 제출 방지
          
          // 입력값 확인
          if($("#id").val().length < 1){
              alert("아이디를 입력하셔야 합니다.");
              $("#id").focus();
              return false;
          }
          if($("#pw").val().length < 1){
              alert("비밀번호를 입력하셔야 합니다.");
              $("#pw").focus();
              return false;
          }

          let id = $("#id").val();
          let pw = $("input[name='pw']").val();	

          $.ajax({
              url: "/login/ajaxLogin",
              method: "post",
              data: {"id": id, "pw": pw},
              dataType: "text",
              success: function(data){
                  if(data == "1"){
                      alert("로그인되었습니다");
                      location.href = "/";	
                  } else {
                      alert("아이디 또는 패스워드가 일치하지 않습니다.");
                      $("#pw").val(""); // 패스워드 삭제
                      $("#pw").focus(); 
                  }
              },
              error: function(){
                  alert('로그인 처리 중 오류가 발생했습니다.');
              }
          }); // ajax 
      }); // submit 이벤트 핸들러
      $("#togglePassword").click(function() {
          const passwordField = $("#pw");
          const passwordFieldType = passwordField.attr("type") === "password" ? "text" : "password";
          passwordField.attr("type", passwordFieldType);
          $(this).find("i").toggleClass("fa-eye fa-eye-slash"); // Font Awesome 아이콘 토글
      });

      // 비밀번호 입력 필드에 포커스 시 아이콘 보여주기
      $("#pw").focus(function() {
          $("#togglePassword").show(); // 포커스 시 아이콘 보이기
      }).blur(function() {
          if ($(this).val() === "") {
              $("#togglePassword").hide(); // 입력이 없을 경우 아이콘 숨기기
          }
      });
  }); // jquery
  </script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- Font Awesome 추가 -->
</head>

<body>
  <%@include file="../header.jsp"%>

  <section class="login-section">
      <div class="login-container">
          <h1>로그인</h1>
          <div id="contents">
              <div id="member">
                  <form action="/login" name="login" method="post" id="loginForm">
                      <div class="login_form_box">
                          <input type="text" name="id" id="id" size="30" placeholder="아이디" />
                      </div>
                      <div class="pw">
                          <input type="password" name="pw" id="pw" size="45" placeholder="비밀번호 영문, 특수문자, 숫자혼합 8~12자" />
                          <!-- 아이콘 -->
                          <span id="togglePassword" class="toggle-password">
                          	<div class="eyes"><i class="fas fa-eye"></i></div>
                          </span>
                      </div>
                      <div id="save">
                          <input type="checkbox" id="saveId" name="remember">
                          <label for="saveId"><span>아이디 저장</span></label>
                      </div>
                      <div id="find">
                          <span>아이디 찾기</span> <span class="separator">|</span> <span>비밀번호 찾기</span>
                      </div>
                      <button type="submit" class="loginBtn">로그인</button>
                  </form>
                  <div class="login-box">
                      <h3>카카오 로그인</h3>
                      <div class="informbox">
                          <div class="inform">
                              <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=7980f70fd5da76a168557ced9cb2c60e&redirect_uri=http://localhost:8000/kakao/oauth">
                                  <img src="/images/kakao_login_large_wide.png" alt="카카오 로그인">
                              </a>
                          </div>
                      </div>
                      <div class="sign-up-info">
                          <p class="sign_p">WDH 회원이 아니신가요?</p>
                          <p class="sign_p2">회원가입하시면 WDH의 다양한 서비스를 이용하실 수 있습니다.</p>
                          <div class="sign-up"><a href="/member/join1">회원 가입하기</a></div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <%@include file="../footer.jsp"%>
</body>
</html>