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
					<li style="height:40px;"><a href="blist" id="leftNavi1" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">게시판</a></li>
					<li style="height:40px;"><a href="#" id="leftNavi2" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">QnA</a></li>
					<li class="last"  style="height:40px;"><a href="faq" id="leftNavi3" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">FAQ</span></a></li>
					
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
							<li><a href="faq" style=" text-decoration-line:none;">전체</a></li>
							<li class="dep"><a class="on" style=" text-decoration-line:none;">회원</a></li>
							<li><a href="faqMedi" style=" text-decoration-line:none;">의약품</a></li>
							<li class="last"><a href="faqTec" style=" text-decoration-line:none;">기능</a></li>
						</ul>						
					</div>	
					
					<!-- FAQ -->
					<div class="faqList">
						<ul>
							<!-- list -->
							<!-- //list -->
							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question" style="padding: 10px 0;">
										<div class="blet">Q</div>
										<div class="category">회원</div>
										<div class="title">회원 정보 수정</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox" style="display: flex; align-items: center; font-size: 15px;">
										<div class="blet" style="color:#0a47ff; width:40px;">A</div>
										<div class="text">
											마이페이지 - 회원정보 수정으로 들어가신 뒤 수정을 원하는 정보를 수정하시면 됩니다. 
										</div>
									</div>
								</div>
							</li>

							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question" style="padding: 10px 0;">
										<div class="blet">Q</div>
										<div class="category">회원</div>
										<div class="title">회원 탈퇴</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox" style="display: flex; align-items: center; font-size: 15px;">
										<div class="blet" style="color:#0a47ff; width:40px;">A</div>
										<div class="text">
											마이페이지&nbsp;&nbsp;-&nbsp;&nbsp;회원탈퇴를 클릭하시면 별도의 과정을 거친 뒤 탈퇴가 가능합니다. 
										</div>
									</div>
								</div>
							</li>

							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question" style="padding: 10px 0;">
										<div class="blet">Q</div>
										<div class="category">회원</div>
										<div class="title">비밀번호 찾기</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox" style="display: flex; align-items: center; font-size: 15px;">
										<div class="blet" style="color:#0a47ff; width:40px;">A</div>
										<div class="text">
											로그인&nbsp;&nbsp;-&nbsp;&nbsp;비밀번호 찾기를 클릭하시면 본인 여부 확인 후 찾기가 가능합니다. 
										</div>
									</div>
								</div>
							</li>

							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question" style="padding: 10px 0;">
										<div class="blet">Q</div>
										<div class="category">회원</div>
										<div class="title">회원 등록 방법</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox" style="display: flex; align-items: center; font-size: 15px;">
										<div class="blet" style="color:#0a47ff; width:40px;">A</div>
										<div class="text">
											로그인&nbsp;&nbsp;-&nbsp;&nbsp;회원가입을 클릭하신 후 이용약관 등의 및 개인정보를 입력하시면 회원으로 등록하실 수 있습니다. 
										</div>
									</div>
								</div>
							</li>

							
						</ul>
					</div>
					<!-- //FAQ -->


					<div class="btnAreaList" style="margin-bottom: 300px;">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">

						<a class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a><a class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
						<a style="color:#0a47ff; border:1px #0a47ff solid; background:#fff;">1</a>
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