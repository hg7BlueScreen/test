<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>FAQ</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/top_navi.js"></script>
<script type="text/javascript" src="../js/left_navi.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="../js/html5.js"></script>
<script type="text/javascript" src="../js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
$(document).ready(function() {
	


});
</script>
</head>
<body>
<%@include file = "header.jsp" %>
	<!-- container -->
	<div id="" style="">

		<!-- <div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">고객센터</a></li>
				<li class="last">FAQ</li>
			</ol>
		</div> -->
		
		<div id="left" style="float:left; width:250px; height: 250px; margin: 100px 0 0 100px;">
			<div id="title2" style="font-size: 35px;">커뮤니티<span style="font-size: 13px;">FAQ</span></div>
				<ul >	
					<li style="height: 40px;"><a href="../announceList" id="leftNavi4"style="height: 40px; font-size: 15px; line-height: 270%; text-decoration-line: none;">공지사항</a></li>
					<li style="height:40px;"><a href="blist" id="leftNavi1" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">게시판</a></li>
					<li style="height:40px;"><a href="/qnaList" id="leftNavi2" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">QnA</a></li>
					<li  class="last" style="height:40px;"><a href="faq" id="leftNavi3" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">FAQ</span></a></li>
					
				</ul>				
			</div><script type="text/javascript">initSubmenu(3,0);</script>


			<!-- contents -->
	<div style="width:1000px; margin-right: auto; margin-left:auto;">					
   			<h2 style="margin:150px 0 70px 0; text-align: center;">
   				<strong style="font-size: 55px; font-weight:600px; color:#444444; ">FAQ</strong>
   				<br>
   				<br>
   				<span style="font-size: 15px; color: #888888; font-weight: normal;">자주묻는질문</span>
   			</h2>
				
					<div class="faqTab">
						<ul>
							<li><a class="on" style=" text-decoration-line:none;">전체</a></li>
							<li class="dep"><a href="faqUser" style=" text-decoration-line:none;">회원</a></li>
							<li><a href="faqMedi" style=" text-decoration-line:none;">의약품</a></li>
							<li class="last"><a href="faqTec" style=" text-decoration-line:none;">기능</a></li>
						</ul>						
					</div>	
					
					<!-- FAQ -->
					<div class="faqList">
						<ul>
							<!-- list -->
							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question" style="padding: 10px 0;">
										<div class="blet">Q</div>
										<div class="category">의약품</div>
										<div class="title">의약품 성분 확인</div>
									</div>
								</a>

								<div class="faqanswer" style="display: none;">
									<div class="faqbox" style="display: flex; align-items: center; font-size: 15px;">
										<div class="blet" style="color:#0a47ff; width:40px;">A</div>
										<div class="text">
											메인페이지&nbsp;&nbsp;-&nbsp;&nbsp;사전 메뉴에 들어가서 의약품 정보(제품명, 회사명 등)를 검색하시면 의약품 정보를 확인하실 수 있습니다.
										</div>
									</div>
								</div>
							</li>
							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question" style="padding: 10px 0;">
										<div class="blet">Q</div>
										<div class="category">의약품</div>
										<div class="title">의약품 버리는 방법</div>
									</div>
								</a>

								<div class="faqanswer" style="display: none;">
									<div class="faqbox" style="display: flex; align-items: center; font-size: 15px;">
										<div class="blet" style="color:#0a47ff; width:40px;">A</div>
										<div class="text">
											<h3>수거함</h3>
												<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가루약&nbsp;&nbsp;-&nbsp;&nbsp;포장지를 개봉하지 말고 그대로 배출</p>
												<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;알약(조제약)&nbsp;&nbsp;-&nbsp;&nbsp;포장지를 개봉하지 말고 그대로 배출</p>
												<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;알약(정제형)&nbsp;&nbsp;-&nbsp;&nbsp;겉 포장지(종이)만 제거 후 플라스틱 등으로 포장된 알약은 개봉하지 말고 배출</p>
												<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;물약&nbsp;&nbsp;-&nbsp;&nbsp;마개를 잘 잠그고 용기 그대로 배출</p>
												<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연고 등 특수 용기&nbsp;&nbsp;-&nbsp;&nbsp;겉포장(종이)박스만 제거 후 마개를 잠v그고 용기 그대로 배출</p>
												<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;폐의약품 수거함에 버리면 안되는 물품&nbsp;&nbsp;-&nbsp;&nbsp;폐의약품 외 물품(홍삼, 자양강장제 등 건강보조식품)</p>
											<h3>우체통</h3>
												<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 우체통 폐의약품 회수봉투를 사용하여 버려 주세요</p>
												<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 일반 봉투에소 폐의약품이라고 표시하고 버릴수 있어요</p>
												<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 물약은 우체통에 버리면 안돼요</p>
										</div>
									</div>
								</div>
							</li>
							</ul>
						</div>
							<!-- //list -->
					<!-- //FAQ -->


					<div class="btnAreaList" style="margin-bottom: 300px;">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">

						<a href="faq" class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="faq" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
						<a href="faq" class="faqq">1</a>
						<a style="color:#0a47ff; border:1px #0a47ff solid; background:#fff;">2</a>
						<a class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a><a class="n"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>

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
</div>
</div>
</body>
</html>