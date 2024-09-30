<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pages - Login</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="css/login.css">
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
  <%@include file = "../header.jsp"%>

  <section class="login-section">
        <div class="login-container">
            <h1>로그인</h1>

    <form action="/login" name="login" method="post">
      <div class="id">
        <input type="text" name="id" size="30" placeholder="아이디"/>
      </div>
      <div class="pw">
        <input type="text" name="pw" size="45" placeholder="비밀번호 영문, 특수문자, 숫자혼합 8~12자"/>
      </div>

      <div id="save">
        <input type="checkbox" id="remember" name="remember">
        <span>아이디 저장</span>
      </div>
  
      <div id="find">
        <span>아이디 찾기</span> <span class="separator">|</span> <span>비밀번호 찾기</span>
      </div>

      <button type="submit">로그인</button>
    </form>

		<div class="login-box">
      <!-- 카카오 로그인 -->
      
      <h3>카카오 로그인</h3>
      
					<div class="informbox">
						<div class="inform">
							<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=7980f70fd5da76a168557ced9cb2c60e&redirect_uri=http://localhost:8000/kakao/oauth">
								<img src="/images/kakao_login_large_wide.png" >
							</a>
						</div>
					</div>

    <div class="sign-up-info">
      <h3>WDH 회원이 아니신가요?</h3>
      <p> 회원가입하시면 WDH의 다양한 서비스를 <br> 이용하실 수 있습니다.</p>
      <div class="sign-up"><a href="/member/join1"> 회원 가입하기 </a><div class="arrow">&emsp;</div></div>
    </div>
  </section>
	<%@include file = "../footer.jsp"%>
</body>
</html>