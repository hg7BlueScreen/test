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
		<title>회원가입 - 회원정보입력</title>
	</head>
	<body id="body">
		<header>
			<%@ include file="../header.jsp" %>
		</header>
		
		
		<section>
			<form name="agree" method="post" action="join4">
			<input type="hidden" id="ck" name="ck" value="agree"/>
			
				
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
				
				<h4>
					회원 정보 입력 
					<span>(*는 필수 입력사항입니다.)</span>
				</h4>
				<fieldset class="fieldset_class">
					<dl id="join_name_dl">
						<dt>
							<div></div>
							<label for="name">*이름</label>
						</dt>
						<dd>
							<input type="text" id="name" name="name" />
						</dd>
					</dl>
					<dl id="join_id_dl">
						<dt>
							<div></div>
							<label for="id">*아이디</label>
						</dt>
						<dd>
							<input type="text" id="id" name="id" onchange = "idchange()" />
							<input type="button" onclick="idOk()" value="중복확인"/>
							<span>4~16자리의 영문, 숫자, 특수기호(_)만 사용하실 수 있습니다.</span>
							<span>첫 글자는 영문으로 입력해 주세요.</span>
						</dd>
					</dl>
					</dl>
					<dl id="join_nickname_dl">
						<dt>
							<div></div>
							<label for="nickname">*닉네임</label>
						</dt>
						<dd>
							<input type="text" id="nickname" name="nickname" onchange = "nicknamechange()" />
							<input type="button" onclick="nicknameOk()" value="중복확인"/>
							<span>3~16자리의 한글, 영문, 숫자만 사용하실 수 있습니다.</span>
						</dd>
					</dl>
					<dl id="join_pw1_dl">
						<dt>
							<div></div>
							<label for="pw">*비밀번호</label>
						</dt>
						<dd>
							<input type="password" id="pw" name="pw"  />
							<span>영문, 숫자, 특수문자 모두 조합 8~20까지 입력할 수 있습니다.</span>
						</dd>
					</dl>
					<dl id="join_pw2_dl">
						<dt>
							<div></div>
							<label for="pwOk">*비밀번호 확인</label>
						</dt>
						<dd>
							<input type="password" id="pwOk" name="pwOk" onkeyup="pwkey()" />
							<span id="pwCheck"></span>
						</dd>
					</dl>
					<dl id="join_mail_dl">
						<dt>
							<div></div>
							<label for="mailId">*이메일</label>
						</dt>
						<dd>
							<div>
							<input type="text" id="emailId" name="emailId"/>
							<span>@</span>
							<input type="text" id="emailTail" name="emailTail"  />
							<select id="emailList" onchange="emailCk()">
								<option value="txt" selected="selected">직접입력</option>
								<option value="gmail.com">구글</option>
								<option value="naver.com">네이버</option>
								<option value="nate.com">네이트</option>
								<option value="daum.net">다음</option>
							</select>
							<input type="button" id="email_send" onclick="emailSend()" value="인증번호 발송"/>
							</div>
							<div id="emailCk"></div>
							
						</dd>
					</dl>
					
					<dl id="join_address_dl">
						<dt> 
							<div></div>
							<label for="addr1">주소</label>
						</dt>
						<dd>
							<input type="text" id="addr1" name="addr1"/>
							<input type="button" onclick="addressBtn()" value="우편번호"/>
							<input type="text" id="addr2" name="addr2"/>
							<input type="text" id="addr3" name="addr3" placeholder="상세주소를 입력해주세요." />
						</dd>
						
					</dl>
					
					<dl id="join_tell_dl">
						<dt>
							<div></div>
							<label for="phone1">전화번호</label>
						</dt>
						<dd>
							<input type="text" id="phone1" name="phone1" maxlength="3" value="010"/>
							<span> - </span>
							<input type="text" id="phone2" name="phone2" maxlength="4"  />
							<span> - </span>
							<input type="text" id="phone3" name="phone3" maxlength="4"  />
						</dd>
					</dl>
					<dl id="join_birth_dl">
						<dt>
							<div></div>
							<label for="year">생년월일</label>
						</dt>
						<dd>
							<select id="year" name="year">
								<script>
								for(var i=1920; i<=2024; i++){
									if(i==1990){
									document.write("<option value='"+i+"' selected>"+i+"</option>");
									}
									document.write("<option value='"+i+"'>"+i+"</option>");
								}
								</script>
							</select>
							<span>년</span>
							<select id="month" name="month" onchange="bmonth()" >
								<script>
								for(var i=1; i<=12; i++){
									if(i<10){
										document.write("<option value='"+i+"'>0"+i+"</option>");
									}else{
										document.write("<option value='"+i+"'>"+i+"</option>");
									}
								}
								</script>
							</select>
							<span>월</span>
							<select id="day" name="day" >
								<script>
								for(var i=1; i<=31; i++){
									if(i<10){
										document.write("<option value='"+i+"'>0"+i+"</option>");
									}else{
										document.write("<option value='"+i+"'>"+i+"</option>");
									}
								}
								function bmonth(){
									var dmonth = $("#month").val();
									var str = "";
									if(dmonth =="2"){
										for(var i=1;i<=29;i++){
											if(i<10){
												str += "<option value='"+i+"'>0" + i + "</option>";
											}else{
												str += "<option value='"+i+"'>" + i + "</option>";
											}
										}
									}else if(dmonth=="1" || dmonth=="3" || dmonth=="5" || dmonth=="7" || dmonth=="8" || dmonth=="10" || dmonth=="12"){
										for(var i=1;i<=31;i++){
											if(i<10){
												str += "<option value='"+i+"'>0" + i + "</option>";
											}else{
												str += "<option value='"+i+"'>" + i + "</option>";
											}
										}
									}else if(dmonth=="4" || dmonth=="6" || dmonth=="9" || dmonth=="11"){
										for(var i=1;i<=30;i++){
											if(i<10){
												str += "<option value='"+i+"'>0" + i + "</option>";
											}else{
												str += "<option value='"+i+"'>" + i + "</option>";
											}
										}
									}
									$("#day").html(str);
								}
								</script>
								
							</select>
							<span>일</span>
							<div>
								<input type="radio" name="calendar" id="lunar" value="lunar" checked="checked"/>
								<label for="lunar">양력</label>
								<input type="radio" name="calendar" id="solar" value="solar" />
								<label for="solar">음력</label>
							</div>
						</dd>
					</dl>
					<dl id="join_gender_dl">
						<dt>
							<div></div>
							<label for="gender">성별</label>
						</dt>
						<dd>
							<div>
								<input type="radio" name="gender" id="male" value="male" checked="checked"/>
								<label for="male">남성</label>
								<input type="radio" name="gender" id="female" value="female" />
								<label for="female">여성</label>
							</div>
						</dd>
					</dl>
					<dl id="join_job_dl">
						<dt>
							<div></div>
							<label for="job">직업</label>
						</dt>
						<dd>
							<select id="job" name="job">
								<option selected>선택</option>
								<option value="worker">회사원</option>
								<option value="slef">자영업</option>
								<option value="freelancer">프리랜서</option>
								<option value="housewife">전업주부</option>
								<option value="student">학생</option>
								<option value="etc">기타</option>						
							</select>
						</dd>
					</dl>
				</fieldset>
				
				<div id="info_input_button">
					<a href = "/"><input type="reset" value="취소" /></a>
					<a onclick="joinBtn()"><input type="button" style="color: rgb(255, 255, 255); background: rgb(0, 128, 255);" value="다음" /></a>
				</div>
				
			</form>
		</section>
		
<script type="text/javascript">
let idCheck = false;
let pwCheck = false;
let nicknameCheck = false;
let email_check = false;
let nameCk = /^[가-힣]+$/;
let idCk = /^[a-zA-Z]{1}[a-zA-Z0-9_]{3,15}$/;
let nicknameCk = /^[가-힣a-zA-Z0-9]{3,16}$/;
let pwCk = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,20}$/;
let interval; //

function nicknamechange(){
	nicknameCheck=false;
}
function idchange(){
	idCheck=false;
}
function joinBtn(){
	if(!nameCk.test($("#name").val())){
		alert("이름은 한글만 입력 가능합니다.");
		$("#name").val("");
		$("#name").focus();
	}//nameCk
	else if(idCheck==false){
		alert("아이디 중복체크를 완료해주세요.");
		$("#id").focus();
	}//idCk
	else if(nicknameCheck==false){
		alert("닉네임 중복체크를 완료해주세요.");
		$("#nickname").focus();
	}//nicknameCk
	else if(!pwCk.test($("#pw").val())){
		alert("비밀번호가 조건에 부합하지 않습니다.\n(하나 이상의 영문, 숫자, 특수문자(!@#$%^&*?_)포함 8~20자리까지 가능)");
		$("#pw").val("");
		$("#pwOk").val("");
		$("#pw").focus();
	}//pwCk 
	else if(pwCheck==false){
		alert("비밀번호가 일치하지 않습니다.\n비밀번호와 비밀번호 확인이 일치하게 해주세요.");
	}else if($("#emailId").val()==""||$("#emailTail").val()==""){
		alert("이메일을 입력해주세요.");
		return false;
	}else if(email_check==false){
		alert("이메일 인증 받아주세요.");	
	}else{
		agree.submit();
	}
}
function pwkey(){
	if($("#pw").val()==$("#pwOk").val()){
		$("#pwCheck").text("*비밀번호가 일치합니다.").css('color','blue');
		pwCheck = true;
	}else{
		$("#pwCheck").text("*비밀번호가 일치하지 않습니다.").css('color','red');
		pwCheck = false;
	}
}
function idOk(){
	if(!idCk.test($("#id").val())){
		alert("조건에 부합하지 않는 아이디입니다.\n다시 입력해주세요.");
		idCheck = false;
	}else{
		$.ajax({
			url:"/join/idOk",
			method:"post",
			data:{"id":$("#id").val()},
			success:function(data){
				//alert("성공");
				//console.log(data); //겹치는 아이디 확인 
				if(data==""){
					alert("사용할 수 있는 아이디입니다.");
					idCheck = true;
				}else{
					alert("이미 사용중인 아이디입니다.");
					$("#id").val("");
					$("#id").focus();
					idCheck = false;
				}
			},
			error:function(){
				alert("다시 시도해주세요");
			}
		});//ajax
	}
}
function nicknameOk(){
	if(!nicknameCk.test($("#nickname").val())){
		alert("조건에 부합하지 않는 닉네임입니다.\n다시 입력해주세요.");
		nicknameCheck = false;
	}else{
		$.ajax({
			url:"/join/nicknameOk",
			method:"post",
			data:{"nickname":$("#nickname").val()},
			success:function(data){
				//alert();
				//console.log(data);
				if(data==""){
					alert("사용할 수 있는 닉네임입니다.");
					nicknameCheck = true;
				}else{
					alert("이미 사용중인 닉네임입니다.");
					$("#nickname").val("");
					$("#nickname").focus();
					nicknameCheck = false;
				}
			},
			error:function(){
				alert("다시 시도해주세요");
			}
		});//ajax
	}
}
function emailCk(){
	if($("#emailList").val() != "txt"){
		$("#emailTail").val($("#emailList").val());
	}else{
		$("#emailTail").val("");
	}
}
function addressBtn(){
	new daum.Postcode({
    	oncomplete: function(data) {
            console.log(data);
            $("#addr1").val(data.zonecode);
			$("#addr2").val(data.address);
        }
    }).open();
}
function emailSend(){ //이메일 인증번호 보내기 후 활성화
	var name = $("#name").val();
	var email = $("#emailId").val()+"@"+$("#emailTail").val();
	$.ajax({
		url:"/join/emailSend",
		type:"post",
		data:{"name":name, "email":email},
		success:function(data){
			alert("인증번호가 발송되었습니다.");
			console.log(data);
			startTimer();
			$("#emailCk").html('<input type="text" id="emailCheck" />&nbsp;&nbsp;');
			$("#emailCk").append('<input type="button" id="emailOk" onclick="emailk(\''+data+'\')" value="인증번호 확인"/>');
			$("#emailCk").append('<span id="timer"></span>'); 
			//console.log(name); console.log(email);
			
		},
		error:function(error, status){
			alert("다시 시도해주세요");
		}
	});//ajax
}

function startTimer(){ //타이머
	var timeLeft = 300; //5분
	const timerElement = $("#timer");
	interval = setInterval(function(){
		if(timeLeft <= 0){
			clearInterval(interval);
			$("#timer").html("시간 초과!\n새로운 인증번호를 발송하세요").css('color','red');
			$("#emailOk").attr("disabled", true); // 버튼 비활성화
			$("#email_send").attr("disabled", false); //버튼 활성화
			
		}else{
			const minutes = Math.floor(timeLeft/60);
			const seconds = timeLeft%60;
			//console.log(minutes);	console.log(seconds);
			$("#timer").html("남은 시간 ("+minutes+" : "+seconds+")");
			timeLeft--;
			$("#email_send").attr("disabled", true); // 버튼 비활성화
		}
	}, 1000);
}
function emailk(data){
	//console.log(data);
	 if(data==$("#emailCheck").val()){
		clearInterval(interval);
		$("#timer").html("인증 완료되었습니다.");
		email_check = true; //이메일 인증 완료
		$("#emailOk").attr("disabled", true); // 버튼 비활성화
		$("#emailId").attr("readonly", true); // 인증 후 수정 불가
		$("#emailTail").attr("readonly", true); //인증 후 수정 불가
		$("#emailList").attr("disabled", true); //인증 후 수정 불가
	}else{
		alert("인증 번호가 다릅니다.\n다시 입력해주세요.");
	} 
	
}

</script>	
		<footer>
			<%@ include file="../footer.jsp" %>
		</footer>
	</body>
</html>