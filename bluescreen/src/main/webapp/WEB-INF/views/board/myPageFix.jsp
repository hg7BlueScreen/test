<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
		<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
		<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />	
		<link rel="stylesheet" type="text/css" href="../css/info/member.css">
		<script type="text/javascript" src="../js/jquery.min.js"></script>
		<script type="text/javascript" src="../js/top_navi.js"></script>
		<script type="text/javascript" src="../js/left_navi.js"></script>
		<script type="text/javascript" src="../js/main.js"></script>
		<script type="text/javascript" src="../js/common.js"></script>
		<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
		<script type="text/javascript" src="../js/jquery.anchor.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<title>MYPAGE-Information</title>
	</head>
	<body id="body">
		<header>
			<%@ include file="../header.jsp" %>
		</header>
		<div id="" style="margin-top:150px; ">
			<!-- contents -->
			<!-- <h2><strong>마이페이지</strong><span>내 정보</span></h2> -->
			<div id="left" style="float:left; width:250px; height: 250px; margin: 100px 0 0 100px;">
			<div id="title2" style="font-size: 35px;">마이페이지<span style="font-size: 13px;">내 정보</span></div>
				<ul >	
					<li style="height:40px;"><a href="myPage" id="leftNavi1" style="height:40px; font-size: 15px; line-height: 270%;">내 정보</a></li>
					<li style="height:40px;"><a href="myPageFind" id="leftNavi2" style="height:40px; font-size: 15px; line-height: 270%;">즐겨찾기</a></li>
					<li style="height:40px;"><a href="myPageMedi" id="leftNavi4" style="height:40px; font-size: 15px; line-height: 270%;">복용 중인 약</span></a></li>
					<li class="last" style="height:40px;"><a id="leftNavi3" style="height:40px; font-size: 15px; line-height: 270%;">회원정보수정</a></li>
				</ul>				
			</div>
			<script type="text/javascript">initSubmenu(3,0);</script>
			<!-- <h2><strong>마이페이지</strong><span>내 정보</span></h2> -->
			<div class="myTab">
				<ul>
					<li><a href="myPage" >내 정보</a></li>
					<li class="dep"><a href="myPageFind" >즐겨찾기</a></li>
					<li><a href="myPageMedi">복용 중인 약</a></li>
					<li class="last"><a class="on">회원정보수정</a></li>
				</ul>						
			</div>	
		</div>
		
		<section>
			<form name="agree" method="post" action="/member/modify">
			<input type="hidden" id="ck" name="ck" value="agree"/>
			
				
				<div id="subBanner"></div>
				
				<div id="sub_top_area"></div>
				
				<fieldset class="fieldset_class" >
					<dl id="join_gender_dl">
						<dt>
							<div></div>
							<label for="name">이름</label>
						</dt>
						<dd>
							${mem.name }
						</dd>
					</dl>
					<dl id="join_gender_dl">
						<dt>
							<div></div>
							<label for="id">아이디</label>
						</dt>
						<dd>
							${mem.id }
						</dd>
					</dl>
					</dl>
					<dl id="join_gender_dl">
						<dt>
							<div></div>
							<label for="nickname">닉네임</label>
						</dt>
						<dd>
							${mem.nickname }
						</dd>
					</dl>
					<dl id="join_gender_dl">
						<dt>
							<div></div>
							<label for="mailId">이메일</label>
						</dt>
						<dd>
							${mem.email }
						</dd>
					</dl>
					
					<dl id="join_gender_dl">
						<dt> 
							<div></div>
							<label for="addr1">주소</label>
						</dt>
						<dd>
							${mem.address }
						</dd>
						
					</dl>
					
					<dl id="join_gender_dl">
						<dt>
							<div></div>
							<label for="phone1">전화번호</label>
						</dt>
						<dd>
							${mem.phone }
						</dd>
					</dl>
					<dl id="join_gender_dl">
						<dt>
							<div></div>
							<label for="year">생년월일</label>
						</dt>
						<dd>
							${mem.birthday }
						</dd>
					</dl>
					<dl id="join_gender_dl">
						<dt>
							<div></div>
							<label for="gender">성별</label>
						</dt>
						<dd>
							${mem.gender }
						</dd>
					</dl>
					<dl id="join_gender_dl">
						<dt>
							<div></div>
							<label for="job">직업</label>
						</dt>
						<dd>
							${mem.job }
						</dd>
					</dl>
					
				</fieldset>
				
				<div id="info_input_button">
					<a onclick="modifyBtn()"><input type="button" style="color: rgb(255, 255, 255); background: rgb(0, 128, 255);" value="수정" /></a>
				</div>
			</form>
		</section>
<script type="text/javascript">
function modifyBtn(){
	let str ="<dl id='pw3_dl'><dt><label for='pw3'>비밀번호 확인</label></dt><dd><div><input type='text' id='pw3' name='pw3'/>&nbsp;&nbsp;<input type='button' onclick='pwCk()' value='확인'/></div></dd></dl>" 
	$(".fieldset_class").html(str);
}
function pwCk(){
	if("${mem.pw}"==$("#pw3").val()){
		location.href="/board/modify";
	}else{
		alert("비밀번호가 일치하지 않습니다.");
	}
}
</script>
		<footer>
			<%@ include file="../footer.jsp" %>
		</footer>
	</body>
</html>