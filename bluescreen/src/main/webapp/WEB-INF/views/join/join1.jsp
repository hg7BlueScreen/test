<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="/css/info/style_join01_terms.css">
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<title>회원가입 - 약관동의</title>
	</head>
	<body id="body">
		<header>
	<%@ include file="../header.jsp" %>		
		</header>
		
		
		
		<section>
			<form name="agree" method="get" action="join2">
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
					이용약관 동의 
					<span>(필수동의)</span>
					
				</h4>
				<div class="agreebox">
					<article>
						<div>
							<h5>제1조 (목적)</h5>
							<ul>
								<li>이 약관은 WDH(이하"회사"라 표기합니다)가 제공하는 사이버 회원에 대한 서비스 제공 및 이용조건, 회원가입에 관련된 사항 및 절차 그리고 기타 필요한 사항의 규정을 목적으로 합니다.</li>
							</ul>
							<h5>제2조 (약관의 효력)</h5>
							<ul>
								<li>1. 이 약관은 전기통신사업법 제31조, 동법 시행규칙 제21조의 2에 따라 공시절차를 거친 후 서비스 화면에 게시하거나 전자우편, 기타의 방법으로 회원에게 통지함 으로써 효력을 발생합니다.</li>
								<li>2. 회사는 이 약관을 변경할 수 있으며, 변경된 약관은 변경된 사항에 대하여 공지 또는 통지함으로써 효력을 발생합니다.</li>
							</ul>
							<h5>제3조 (약관 이외의 준칙)</h5>
							<ul>
								<li>이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신 사업법 및 기타 관련법령에 규정되어있는 경우 그 규정에 따릅니다.</li>
							</ul>
							<h5>제4조 (용어의 정의)</h5>
							<ul>
								<li>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</li>
								<li><strong>1. WDH</strong> 사이버회원(이하"회원"이라 표기합니다) WDH 홈페이지를 통해 사이버 회원에 회원등록 하신 고객</li>
								<li><strong>2. 아이디(ID)</strong> 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자와 숫자의 조합</li>
								<li><strong>3. 비밀번호</strong> 회원의 비밀보호를 위하여 회원 자신이 설정한 문자와 숫자의 조합</li>
								<li><strong>4. 해지</strong> 회사 또는 회원이 서비스 이용 후 이용계약을 종료시키는 의사표시</li>
							</ul>
							
						</div>
					</article>
				</div>
				<div class="agreeRadio">
					<input type="radio" name="f_agree" id="f_agree" class="agree" value="agree" />
					<label for="f_agree">이용약관에 동의합니다.</label>
					<input type="radio" name="f_agree" id="f_disagree" class="disagree" value="disagree" />
					<label for="f_disagree">동의하지 않습니다.</label>
				</div>
				<div class="strong_div">
					<strong>※ 이용자는 해당 약관 대한 동의를 거부할 권리가 있으나, 미 동의시 회원가입을 하실 수 없습니다.</strong>
				</div>
				
				<h4>
					개인정보 수집, 이용 동의 
					<span>(필수동의)</span>
				</h4>
				<div class="agreebox">
					<article>
						<div>
							<h5>[수집하는 개인정보의 항목 및 수집방법]</h5>
							<ul>
								<li>이 약관은 WDH(이하"회사"라 표기합니다)가 제공하는 사이버 회원에 대한 서비스 제공 및 이용조건, 회원가입에 관련된 사항 및 절차 그리고 기타 필요한 사항의 규정을 목적으로 합니다.</li>
							</ul>
							<ul>
								<li>1.이 약관은 전기통신사업법 제31조, 동 법 시행규칙 제21조의 2에 따라 공시절차를 거친 후 서비스 화면에 게시하거나 전자우편, 기타의 방법으로 회원에게 통지함으로써 효력을 발생합니다.</li>
								<li>2.회사는 이 약관을 변경할 수 있으며, 변경된 약관은 변경된 사항에 대하여 공지 또는 통지함으로써 효력을 발생합니다.</li>
							</ul>
							<h5>* 개인정보의 수집 및 이용목적</h5>
							<ul>
								<li><strong>1) WDH 웹사이트는 다음과 같은 목적을 위하여 개인정보를 수집하고 있습니다.</strong></li>
								<li>가. 성명, 생년월일, ID, 비밀번호, 이동전화번호, 건강상태 : 회원제 서비스 이용에 따른 본인 식별 절차에 이용</li>
								<li>나. 주소, 유선전화번호, e-mail 주소 : 고지사항 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보, 새로운 서비스 안내</li>
								<li>다. 생년월일, 주소 : 인구통계학적 분석 자료(회원의 연령별, 성별, 지역별 통계분석)</li>
								<li>라. 그 외 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료</li>
								<li><strong>2) 단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 성생활 등)는 수집하지 않습니다.</strong></li>
							</ul>
						</div>
					</article>
				</div>
				<div class="agreeRadio">
					<input type="radio" name="s_agree" id="s_agree" class="agree" value="agree" />
					<label for="s_agree">개인정보 보호를 위한 이용자 동의사항에 동의합니다.</label>
					<input type="radio" name="s_agree" id="s_disagree" class="disagree" value="disagree" />
					<label for="s_disagree">동의하지 않습니다.</label>
				</div>
				<div class="strong_div">
					<strong>※ 이용자는 해당 개인정보 수집, 이용 동의를 거부할 권리가 있으나, 미 동의시 회원가입을 하실 수 없습니다.</strong>
				</div>
				
				<h4>
					개인정보 취급위탁 동의 
					<span>(필수동의)</span>
				</h4>
				<div class="agreebox">
					<article>
						<div>
							<h5>[개인정보 취급 위탁 안내]</h5>
							<ul>
								<li>이 약관은 주식회사 WDH(이하"회사"라 표기합니다)가 제공하는 사이버 회원에 대한 서비스 제공 및 이용조건, 회원가입에 관련된 사항 및 절차 그리고 기타 필요한 사항의 규정을 목적으로 합니다.</li>
							</ul>
							<ul>
								<li>1) WDH : 웹사이트 관리</li>
								<li>2) ㈜한도정보통신 : 전산시스템 구축 및 유지보수</li>
								<li>4) ㈜다우기술 : 회사 문자 메시지 전송</li>
							</ul>
						</div>
					</article>
				</div>
				<div class="agreeRadio">
					<input type="radio" name="t_agree" id="t_agree" class="agree" value="agree" />
					<label for="t_agree">개인정보 취급위탁에 동의합니다.</label>
					<input type="radio" name="t_agree" id="t_disagree" class="disagree" value="disagree" />
					<label for="t_disagree">동의하지 않습니다.</label>
				</div>
				<div class="strong_div">
					<strong>※ 이용자는 해당 개인정보 취급위탁 동의를 거부할 권리가 있으나, 미 동의시 회원가입을 하실 수 없습니다.</strong>
				</div>
				
				<h4>
					개인정보 수집, 이용 동의
					<span>(선택동의)</span>
				</h4>
				<div class="agreebox">
					<article>
						<div>
							<h5>[개인정보 수집, 이용 동의 안내]</h5>
							<ul>
								<li>이 약관은 주식회사 WDH(이하"회사"라 표기합니다)가 제공하는 사이버 회원에 대한 서비스 제공 및 이용조건, 회원가입에 관련된 사항 및 절차 그리고 기타 필요한 사항의 규정을 목적으로 합니다.</li>
							</ul>
						</div>
					</article>
				</div>
				<div class="agreeRadio">
					<input type="radio" name="ck" id="p_agree" class="p_agree" value="agree" />
					<label for="p_agree">개인정보 취급위탁에 동의합니다.</label>
					<input type="radio" name="ck" id="p_disagree" class="p_disagree" value="disagree" />
					<label for="p_disagree">동의하지 않습니다.</label>
				</div>
				<div class="strong_div">
					<strong>※ 이용자는 해당 개인정보 수집, 이용 동의(선택)를 거부할 권리가 있고, 미 동의시 서비스 이용에 제한이 있을 수 있습니다.</strong><br>
					<strong>※ 마이 페이지에서 수정가능합니다.</strong>
				</div>
							
				<div class = "aAgree" id = "aAgree">
					<input type = "checkbox" id = "allAgree" value="AllAgree"/> 
					<label for = "allAgree">전체 동의&nbsp;&nbsp;(선택 동의 포함)</label>
				</div>
				
				
				<div id="terms_button">
					<a href = "/"><input type="reset" value="취소" /></a>
					<a onclick="joinBtn()"><input type="button" style="color: rgb(255, 255, 255); background: rgb(0, 128, 255);" value="다음" /></a>
				</div>
				
	
			</form>
		</section>
<script type="text/javascript">
function joinBtn(){ 
	$("label[for=f_agree]").css({"color":"#333"});
	$("label[for=s_agree]").css({"color":"#333"});
	$("label[for=t_agree]").css({"color":"#333"});
	$("label[for=p_agree]").css({"color":"#333"});
	if(!$("input[name=f_agree]").is(":checked")){
		alert("누락된 동의사항이 있습니다.");
		$("label[for=f_agree]").css({"color":"red"});
		$("#f_agree").focus();
		return false;
	}else if(!$("input[name=s_agree]").is(":checked")){
		alert("누락된 동의사항이 있습니다.");
		$("label[for=s_agree]").css({"color":"red"});
		$("#s_agree").focus();
		return false;
	}else if(!$("input[name=t_agree]").is(":checked")){
		alert("누락된 동의사항이 있습니다.");
		$("label[for=t_agree]").css({"color":"red"});
		$("#t_agree").focus();
		return false;
	}else if(!$("input[name=ck]").is(":checked")){
		alert("누락된 동의사항이 있습니다.");
		$("label[for=p_agree]").css({"color":"red"});
		$("#p_agree").focus();
		return false;
	}
 	$(function(){
		if($("input[class=agree]:checked").length != 3){
			if(confirm("필수 동의를 모두 하셔야 가입이 가능합니다.\n전체 동의(선택 동의 포함) 하시겠습니까?")){
				$("input[class=agree]").prop("checked",true);
				$("input[class=p_agree]").prop("checked",true);
				agree.submit();
			}
		}else{
			agree.submit();
		}//필수동의 if문
	});//jquery
}
$(function(){
	$("#allAgree").click(function(){
		if($("#allAgree").is(":checked")){
			$("input[class=agree]").prop("checked",true);
			$("input[class=p_agree]").prop("checked",true);
		}else{
			$("input[class=disagree]").prop("checked",true);
			$("input[class=p_disagree]").prop("checked",true);
		}
	});//
	$("input[type=radio]").click(function(){
		var total = $("input[class=agree]").length + $("input[class=p_agree]").length; //동의사항 전체 수
		var checked = $("input[class=agree]:checked").length + $("input[class=p_agree]:checked").length; //동의사항 동의한 수
		//alert("전체 동의 체크박스 수 : "+total);
		//alert("체크된 동의 체크박스 수 : "+checked);
		if(total != checked){
			$("#allAgree").prop("checked",false);
		}else{
			$("#allAgree").prop("checked",true);
		}
	});
});//jquary

</script>
		
		
		<footer style="margin-top:300px;">
			
			<%@ include file="../footer.jsp" %>		
		
		</footer>
	</body>
</html>