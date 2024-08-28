<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<form name="agree" method="get" action="/join4">
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
							<input type="button" value="검색"/><br>
							<input type="text" id="b_search" name="b_search" minlength="4" maxlength="16"  />
						</dd>
					</dl>
					<dl class="join_id_dl">
						<dt>
							<div></div>
							<label for="id">과거 질환</label>
						</dt>
						<dd>
							<input type="button" value="검색"/><br>
							<input type="text" id="b_search" name="b_search" minlength="4" maxlength="16" />
							
						</dd>
					</dl>
					<dl class="join_id_dl">
						<dt>
							<div></div>
							<label for="id">가족의 유전성 질환</label>
						</dt>
						<dd>
							<input type="button" value="검색"/><br>
							<input type="text" id="b_search" name="b_search" minlength="4" maxlength="16" />
						</dd>
					</dl>
					</dl>
					<dl class="join_id_dl">
						<dt>
							<div></div>
							<label for="n_id">복용중인 약</label>
						</dt>
						<dd>
							<input type="button" value="검색"/><br>
							<input type="text" id="m_search" name="m_search" minlength="4" maxlength="16" />
						</dd>
					</dl>

				</fieldset>
				
				<div id="info_input_button">
					<input type="reset" value="취소" />
					<input type="submit" value="가입" />
				</div>
				
			</form>
		</section>
		
		
		
		
		
		
		
		<footer>
			<%@ include file="../footer.jsp" %>
		</footer>
	</body>
</html>