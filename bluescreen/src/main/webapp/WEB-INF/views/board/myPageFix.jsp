<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
		<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
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
				<ul>
					<li style="height:40px;"><a href="myPage" id="leftNavi1" style="height:40px; font-size: 15px; line-height: 270%; text-decoration: none;">내 정보</a></li>
					<li style="height:40px;"><a href="myPageFind" id="leftNavi2" style="height:40px; font-size: 15px; line-height: 270%; text-decoration: none;">즐겨찾기</a></li>
					<li style="height:40px;"><a href="myPageMedi" id="leftNavi4" style="height:40px; font-size: 15px; line-height: 270%; text-decoration: none;">복용 중인 약</span></a></li>
					<li class="last" style="height:40px;"><a id="leftNavi3" style="height:40px; font-size: 15px; line-height: 270%; text-decoration: none;">회원정보</a></li>
				</ul>
			</div>
			<script type="text/javascript">initSubmenu(3,0);</script>
			<!-- <h2><strong>마이페이지</strong><span>내 정보</span></h2> -->
			<div id="mmypage" style="width:1000px;  margin:150px auto 200px auto;">
			<div class="myTab">
				<ul>
					<li><a href="myPage" >내 정보</a></li>
					<li class="dep"><a href="myPageFind" >즐겨찾기</a></li>
					<li><a href="myPageMedi">복용 중인 약</a></li>
					<li class="last"><a class="on">회원정보</a></li>
				</ul>						
			</div>	
		
		<section>
			<form id = "frm" name="agree" method="post" action="/board/modify">
				<div style="margin:80px 0 0 40px; font-size: 20px; color:#0a47ff;">회원정보</div>
				<div id="fieldset_class" style="overflow:hidden; border: 1px solid #8497d3;border-radius: 40px; width:100%; margin:20px auto 0 auto;">
					<table>
						<colgroup>
							<col width="25%">
							<col width="75%">
						</colgroup>
						<tr>
							<td style="border-right: 1px solid #b9c4e8; border-bottom: 1px solid #b9c4e8; background-color: #F5F5F5; height:56px; font-weight: bold; font-size: 15px;">이름</th>
							<td style="font-size: 15px;  border-bottom: 1px solid #b9c4e8; padding-left:30px; text-align: left;">${mem.name }</td>
						</tr>
						<tr>
							<td style="border-right: 1px solid #b9c4e8; border-bottom: 1px solid #b9c4e8; background-color: #F5F5F5; height:56px; font-weight: bold; font-size: 15px;">아이디</th>
							<td style="font-size: 15px;  border-bottom: 1px solid #b9c4e8;padding-left:30px; text-align: left;">${mem.id }</td>
						</tr>
						<tr>
							<td style="border-right: 1px solid #b9c4e8; border-bottom: 1px solid #b9c4e8; background-color: #F5F5F5; height:56px; font-weight: bold; font-size: 15px;">닉네임</th>
							<td style="font-size: 15px;  border-bottom: 1px solid #b9c4e8;padding-left:30px; text-align: left;">${mem.nickname }</td>
						</tr>
						<tr>
							<td style="border-right: 1px solid #b9c4e8; border-bottom: 1px solid #b9c4e8; background-color: #F5F5F5; height:56px; font-weight: bold; font-size: 15px;">이메일</th>
							<td style="font-size: 15px;  border-bottom: 1px solid #b9c4e8;padding-left:30px; text-align: left;">${mem.email }</td>
						</tr>
						<tr>
							<td style="border-right: 1px solid #b9c4e8; border-bottom: 1px solid #b9c4e8; background-color: #F5F5F5; height:56px; font-weight: bold; font-size: 15px;">주소</th>
							<td style="font-size: 15px;  border-bottom: 1px solid #b9c4e8;padding-left:30px; text-align: left;">${mem.address }</td>
						</tr>
						<tr>
							<td style="border-right: 1px solid #b9c4e8; border-bottom: 1px solid #b9c4e8; background-color: #F5F5F5; height:56px; font-weight: bold; font-size: 15px;">전화번호</th>
							<td style="font-size: 15px;  border-bottom: 1px solid #b9c4e8;padding-left:30px; text-align: left;">${mem.phone }</td>
						</tr>
						<tr>
							<td style="border-right: 1px solid #b9c4e8; border-bottom: 1px solid #b9c4e8; background-color: #F5F5F5; height:56px; font-weight: bold; font-size: 15px;">생년월일</th>
							<td style="font-size: 15px;  border-bottom: 1px solid #b9c4e8;padding-left:30px; text-align: left;">${mem.birthday }</td>
						</tr>
						<tr>
							<td style="border-right: 1px solid #b9c4e8; border-bottom: 1px solid #b9c4e8; background-color: #F5F5F5; height:56px; font-weight: bold; font-size: 15px;">성별</th>
							<td style="font-size: 15px;  border-bottom: 1px solid #b9c4e8;padding-left:30px; text-align: left;">${mem.gender }</td>
						</tr>
						<tr>
							<td style="border-right: 1px solid #b9c4e8; background-color: #F5F5F5; height:56px; font-weight: bold; font-size: 15px;">직업</th>
							<td style="font-size: 15px; padding-left:30px; text-align: left;">${mem.job }</td>
						</tr>
					</table>
				</div>
				
				<div id="info_input_button">
					<a onclick="modifyBtn()"><input type="button" style="position:absolute; color: rgb(255, 255, 255); background: #0a47ff; border-radius:15px; margin:70px 0 0 200px; margin-bottom: 200px;margin-left:360px;" value="수정" /></a>
				</div>
			</form>
		</section>
		</div>
			</div>
<script type="text/javascript">
function modifyBtn(){
	let str ="<div id='subBanner'></div><div id='sub_top_area'></div>"
	str += '<div style="padding:0 0 0 220px; font-size: 20px; color:#0a47ff;">비밀번호 확인</div>'
	str += '<div style="overflow:hidden; border: 1px solid #8497d3;border-radius: 30px; margin: 0 auto; margin-top:40px; width:600px;">'
	str += '<table><colgroup><col width="20%"><col width="60%"><col width="20%"></colgroup>'
	str += '<tr><td style="border-right: 1px solid #b9c4e8; background-color: #F5F5F5; height:60px; font-weight: bold; font-size:13px;;">비밀번호</th>'
	str += '<td><input type="password" id="pw3" name="pw3" placeholder="비밀번호를 입력해주세요." style="width:360px; height:50px; font-size: 13px; border:0px; padding:15px;"></td><td>&nbsp;&nbsp;<input type="button" onclick="pwCk()" style="width:45px; height:45px; color: rgb(255, 255, 255); background: #0a47ff; border-radius:22.5px; border:0px; font-size:11px; font-weight:bold; margin-left:53px;" value="확인"/></td></tr></table></div>'
	 
	$("#frm").html(str);
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