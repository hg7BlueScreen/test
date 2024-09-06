<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="/css/info/style_join03_info_input.css">
		<title>회원가입 - 회원정보입력</title>
		
	</head>
	<body id="body">
		<header>
			<%@ include file="../header.jsp" %>
		
		</header>
		
		
		<section>
			<form name="agree" method="get" action="join4">
			<input type="hidden" name="uno" value="${uno }"/>
		
			
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
							<p>회원 기본 정보</p>
						</li>
						<li>
							<span>STEP.3</span>
							<p>회원 의료 정보</p>
						</li>
						<li>
							<span>STEP.4</span>
							<p>회원가입완료</p>
						</li>
					</ul>
				</div>
				
				<h4>
					의료 정보 입력 
					<span>(마이페이지에서 수정 가능합니다.)</span>
				</h4>
				<fieldset class="fieldset_class">
<!-- 검색어 포함한 자료들 창으로 띄워주기. 창에서 선택한 것 이름 기입하기 -->
					<dl class="join_id_dl">
						<dt>
							<div></div>
							<label for="id">앓고있는 질환</label>
						</dt>
						<dd>
							<input type="button" value="검색"/ onclick="disease()"><br>
							<input type="text" id="diseaseSearch" name="diseaseSearch" />
							<input type="text" id="diseaseSearch" name="diseaseSearch" />
						</dd>
					</dl>
					<dl class="join_id_dl">
						<dt>
							<div></div>
							<label for="id">과거 질환</label>
						</dt>
						<dd>
							<input type="button" value="검색" onclick="pastDisease()"/><br>
							<input type="text" id="pastDiseaseSearch" name="pastDiseaseSearch" />
							
						</dd>
					</dl>
					<dl class="join_id_dl">
						<dt>
							<div></div>
							<label for="id">가족의 유전성 질환</label>
						</dt>
						<dd>
							<input type="button" value="검색" onclick="hereditaryDisease()"/><br>
							<input type="text" id="hereditaryDisease" name="hereditaryDisease" />
						</dd>
					</dl>
					</dl>
					<dl class="join_id_dl">
						<dt>
							<div></div>
							<label for="n_id">복용중인 약</label>
						</dt>
						<dd>
							<input type="button" value="검색" onclick="medicine()"/><br>
							<input type="text" id="medicineSearch" name="medicineSearch" />
						</dd>
					</dl>

				</fieldset>
				
				<div id="info_input_button">
					<a onclick = "deleteBtn()"><input type="reset" value="취소" /></a>
					<a onclick="joinBtn()"><input type="button" style="color: rgb(255, 255, 255); background: rgb(0, 128, 255);" value="다음" /></a>
				</div>
				
			</form>
		</section>
		<script type="text/javascript">
		pOption()
		function disease(){ //지금 앓고있는 질병
			var pOption = "width = 1000px, height = 500px, top = 100, left = 200, location = no";
			window.open("/dict1?category=disease",'pop', pOption);
			/* $.ajax({
				url:"disease",
				method:"post",
				success:function(data){
					alert("성공");
					console.log(data);
				},
				error:function(error){
					alert("실패");
					console.log(error);
				}
			});//ajax */
		}
		
		function pastDisease(){ //과거 질환
			
		}
		function hereditaryDisease(){ //가족이 앓고있는 유전성 질환
			
		}
		function medicine(){ //복용중인 약
			
		}
		
		
		function joinBtn(){	//회원가입 완료
			//agree.submit();
		}
		function deleteBtn(){ //회원가입 취소 -> 회원정보 삭제
			//alert(); 
			
		}
	
		</script>
		
		
		<footer>
			<%@ include file="../footer.jsp" %>
		</footer>
	</body>
</html>