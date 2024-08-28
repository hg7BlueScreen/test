<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
{text-decoration:none;}
a:link, a:visited, a:hover, a:active
{text-decoration:none; color:white;}
</style>
</head>
<body>
	<header>
	 		<div id="nav_up">
	 			<ul>
	 			<% if(session.getAttribute("sessionId")==null){ %>
	 				<li>회원가입</li>
	 				<li><a href="login.jsp">로그인</a></li>
	 			<% }else{ %>
	 				<li><%= (String)session.getAttribute("sessionId") %>님</li>
	 				<li><a href="logout.jsp">로그아웃</a></li>
	 			<% } %>
	 			
	 			
	 				<li><a href="blist.jsp">고객행복센터</a></li>
	 				<li>배송정보검색</li>
	 				<li><a href="main.jsp">기프트카드 등록</a></li>
	 			</ul>
	 		</div>
	 		<nav>
	 			<h1></h1>
	 			<ul>
	 				<li>COOKIT소개</li>
	 				<li>COOKIT메뉴</li>
	 				<li>리뷰</li>
	 				<li>이벤트</li>
	 				<li>MY쿡킷</li>
	 			</ul>
	 			<ul>
	 				<li><a href="#"><span>장바구니</span></a></li>
	 				<li><a href="#"><span>메뉴찾기</span></a></li>
	 			</ul>
	 		
	 		</nav>
	 	</header>
</body>
</html>