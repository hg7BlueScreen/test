<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="/css/info/style_join02_info_input.css">
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<title>내정보</title>
	</head>
	<body id="body">
		<header>
			<%@ include file="../header.jsp" %>
		</header>
		
		
		<section>
			<form name="agree" method="post" action="/join/modify">
			<input type="hidden" id="ck" name="ck" value="agree"/>
			
				
				<div id="subBanner"></div>
				
				<div id="sub_top_area">
					<h3>회원정보</h3>
				</div>
				
				<h4>
					내 정보 열람 
				</h4>
				<fieldset class="fieldset_class" >
					<dl id="join_name_dl">
						<dt>
							<div></div>
							<label for="name">이름</label>
						</dt>
						<dd>
							${mem.name }
						</dd>
					</dl>
					<dl id="join_id_dl">
						<dt>
							<div></div>
							<label for="id">아이디</label>
						</dt>
						<dd>
							${mem.id }
						</dd>
					</dl>
					</dl>
					<dl id="join_nickname_dl">
						<dt>
							<div></div>
							<label for="nickname">닉네임</label>
						</dt>
						<dd>
							${mem.nickname }
						</dd>
					</dl>
					<dl id="join_mail_dl">
						<dt>
							<div></div>
							<label for="mailId">이메일</label>
						</dt>
						<dd>
							${mem.email }
						</dd>
					</dl>
					
					<dl id="join_address_dl">
						<dt> 
							<div></div>
							<label for="addr1">주소</label>
						</dt>
						<dd>
							${mem.address }
						</dd>
						
					</dl>
					
					<dl id="join_tell_dl">
						<dt>
							<div></div>
							<label for="phone1">전화번호</label>
						</dt>
						<dd>
							${mem.phone }
						</dd>
					</dl>
					<dl id="join_birth_dl">
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
	<!-- 히든으로 아닌거 감추기 -->						<label for="gender">성별</label>
						</dt>
						<dd>
							${mem.gender }
						</dd>
					</dl>
					<dl id="join_job_dl">
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
	let str ="<dl id='pw3_dl'><dt><label for='pw3'>비밀번호 확인</label></dt><dd><div><input type='text' id='pw3' name='pw3'/><input type='button' onclick='pwCk()' value='확인'/></div></dd></dl>" 
	$(".fieldset_class").html(str);
}
function pwCk(){
	if("${mem.pw}"==$("#pw3").val()){
		location.href="/join/modify";
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