<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title> 복용약 </title>
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="../css/my_medicine.css?v=Y" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/top_navi.js"></script>
<script type="text/javascript" src="../js/left_navi.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
	//alert();
	location.href="/dict?category=medicine";
}

function medicineDel(){// 복용약 삭제
	let mno = [];
	let uno = "${uno}";
	if($(".deleteCheck").is(":checked")){
		if(confirm("체크된 약품들을 목록에서 삭제하시겠습니까?")){
		//console.log("${uno}"); console.log($("input[class=deleteCheck]:checked").eq(0).val());
			for(var i=0;i<$("input[class=deleteCheck]:checked").length;i++){
				mno.push($("input[class=deleteCheck]:checked").eq(i).val());
			}
			console.log(mno);
			$.ajax({
				url:"/deleteCk",
				method:"post",
				data:{"mno":mno, "uno":uno},
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
</script>

			<!-- contents -->
			<div id="contents">
				<div id="customer">
					<h2><strong>복용약 정보</strong></h2>
					<!-- FAQ -->
					<div class="faqList">
						<button id="medicineAdd" onclick="medicineAdd()">복용약 추가</button>
						<button id="medicineDel" onclick="medicineDel()">복용약 삭제</button>
						<ul>
							<!-- list -->
							<li>
								<div class="num">번호</div>
								<div class="na">이름</div>
								<div class="img">사진</div>
							</li>
							<c:forEach var="m" items="${mList }" varStatus="status">
								<li>
									<a href="javascript:;" class="faqbtn">
										<div class="list">
											<input type="checkbox" class="deleteCheck" value="${m.mno }"/>
											<div class="number">${status.count }</div>
											<div class="name">${m.itemName }</div>
											<div class="image"><img src="${m.imageURL }"></div>
										</div>
									</a>
									<div class="faqanswer" style="display: none;">
										<div class="faqbox">
											<c:if test="${m.useMethodQesitm!=null }">
												<div class="blet">복용법</div>
												<div class="text">
													${m.useMethodQesitm }
												</div>
											</c:if>
											<c:if test="${m.depositMethodQesitm!=null }">
												<div class="blet">보관방법</div>
												<div class="text">
													${m.depositMethodQesitm } 
												</div>
											</c:if>
												<div class="blet">주의사항</div>
												<div class="text">
											<c:if test="${m.atpnWarnQesitm!=null }">
													<strong><u>복용 전 주의</u></strong><p>${m.atpnWarnQesitm}</p>
											</c:if>
											<c:if test="${m.atpnQesitm!=null }">
													<strong><u>복용 중 주의</u></strong><p>${m.atpnQesitm}</p>
											</c:if>
											<c:if test="${m.intrcQesitm!=null }">
													<strong><u>복용 후 주의</u></strong><p>${m.intrcQesitm}</p>
											</c:if>
												</div>
											<c:if test="${m.seQesitm!=null }">
												<div class="blet">부작용</div>
												<div class="text">
													${m.seQesitm } 
												</div>
											</c:if>
										</div>
									</div>
								</li>
							</c:forEach>
							<!-- //list -->
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