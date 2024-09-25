<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="/css/info/style_join03_success.css">
		
		<title>회원가입 - 회원가입완료</title>
	</head>
	<body id="body">
		<header>
			<%@ include file="../header.jsp" %>
		</header>
		
		
		<section>
			<div id="subBanner"></div>
			
			
			<div id="sub_top_area">
				<h3>회원가입</h3>
			</div>
			
			<div id="join_step_div">
				<ul>
					<li>
						<span>STEP.1</span>
						<p>약관동의</p>
					</li>
					<li>
						<span>STEP.2</span>
						<p>회원정보입력</p>
					</li>
					<li>
						<span>STEP.3</span>
						<p>회원가입완료</p>
					</li>
				</ul>
			</div>
			
			<div id="join_success_div">
				<p>
					감사합니다.
					<strong>회원가입이 완료되었습니다.</strong>
				</p>
				<button class="" onClick="location.href=''">로그인</button>
				<button class="" onClick="location.href='/'">메인화면</button>
			</div>	
			
				
				
		</section>
		
		

		
		
		<footer>
			<%@ include file="../footer.jsp" %>
		</footer>
	</body>
</html>