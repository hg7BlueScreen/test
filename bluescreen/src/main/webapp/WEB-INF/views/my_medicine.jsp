<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title> 복용약 </title>
<meta charset="UTF-8" />
<script type="text/javascript" src="../js/jquery.min.js"></script><!--  -->
<script type="text/javascript" src="../js/top_navi.js"></script>
<script type="text/javascript" src="../js/left_navi.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/common1.js"></script><!--  -->
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/my_medicine.css?v=Y" />
</head>
<body>
<%@include file = "header.jsp" %>
	<!-- container -->
	<div id="container">
		<div id="location">
			<ol>
				<li><a href="/">HOME</a></li>
				<li><a href="#">마이페이지</a></li>
				<li class="last">복용약 정보</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">마이페이지<span>복용약 정보</span></div>
				<ul>	
					<li class="last"><a href="#" id="leftNavi4">회원정보</a></li>
					<li><a href="#" id="leftNavi3">	복용약 정보</span></a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(3,0);</script>
<script type="text/javascript">
function medicineAdd(){//복용약 등록, 의약품 사전으로 이동
	location.href="/dict?category=drug";
}

function medicineDel(){// 복용약 삭제
	let dno = [];
	let uno = "${uno}";
	if($(".deleteCheck").is(":checked")){
		if(confirm("체크된 약품들을 목록에서 삭제하시겠습니까?")){
		//console.log("${uno}"); console.log($("input[class=deleteCheck]:checked").eq(0).val());
			for(var i=0;i<$("input[class=deleteCheck]:checked").length;i++){
				dno.push($("input[class=deleteCheck]:checked").eq(i).val());
			}
			console.log(dno);
			$.ajax({
				url:"/deleteCk",
				method:"post",
				data:{"dno":dno, "uno":uno},
				success:function(data){
					//alert("성공"); console.log(data);
					$("input[class=deleteCheck]:checked").parent().parent().parent().remove();
				},
				error:function(status){
					//alert("실패");
				}
			});
		}	
	}else{
		alert("체크된 약품이 없습니다.");
	}
}
function alram(){ // 소비기한 만료 알람 기간 선택 보내기
	console.log($('#alram').val());
	$.ajax({
		url:"/alramDate",
		method:"post",
		data:{"alDate":$("#alram").val()},
		success:function(data){
			//alert("성공"); console.log(data);
			alert("선택하신 기간으로 알람주기가 설정되었습니다.");
		},
		error:function(){
			alert("실패");
		}
	}); 
}
</script>

			<!-- contents -->
			<div id="contents">
				<div>
					<h2><strong>복용약 정보</strong></h2>
					<!-- FAQ -->
					<div class="faqList">
						<div id="myMedicineHd">
							<label for="alram">복용약 소비기한 임박알림 받기</label>
							<select id="alram" onchange="alram()" >
								<option value="365" >1년 전</option>
								<option value="180">6개월 전</option>
								<option value="90">3개월 전</option>
								<option value="30">1개월 전</option>
								<option value="15">15일 전</option>
								<option value="7" selected="selected">일주일 전</option>
								<option value="1">하루 전</option>
								<option value="0">당일</option>
								<option value=null>없음</option>
							</select>
							<button id="medicineAdd" onclick="medicineAdd()">복용약 추가</button>
							<button id="medicineDel" onclick="medicineDel()">복용약 삭제</button>
						</div>
						<ul>
							<!-- list -->
							<li>
								<div class="num">번호</div>
								<div class="na">이름</div>
								<div class="img">사진</div>
							</li>
							
						</ul>
					</div>
					<!-- //FAQ -->
	


					<div class="btnAreaList">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">

						<a href="#" class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="#" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
						<a style="color:#0a47ff; border:1px #0a47ff solid; background:#fff;">1</a>
						<a href="faq2" class="faqq">2</a>
						<a href="faq2" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a><a href="faq2" class="n"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>

						</div>
						<!-- //페이징이동1 -->
					</div>

				</div>
			</div>
			<!-- //contents -->

		</div>
	</div>
	<!-- //container -->

<%@include file = "footer.jsp" %>
</body>
</html>