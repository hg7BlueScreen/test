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
			<div id="title2" style="font-size: 35px;">고객센터<span style="font-size: 13px;">고객지원</span></div>
				<ul >	
					<li style="height:40px;"><a href="blist" id="leftNavi1" style="height:40px; font-size: 15px; line-height: 270%;">게시판</a></li>
					<li style="height:40px;"><a href="#" id="leftNavi2" style="height:40px; font-size: 15px; line-height: 270%;">QnA</a></li>
					<li style="height:40px;"><a href="faq" id="leftNavi3" style="height:40px; font-size: 15px; line-height: 270%;">FAQ</span></a></li>
					<li class="last" style="height:40px;"><a href="#" id="leftNavi4" style="height:40px; font-size: 15px; line-height: 270%;">이용안내</a></li>
				</ul>				
			</div><script type="text/javascript">initSubmenu(3,0);</script>


			<!-- contents -->
	<div style="width:1000px; margin-right: auto; margin-left:auto;">					
   			<h2 style="margin-top:200px; text-align: center;">
   				<strong style="font-size: 55px; font-weight:600px; color:#444444; ">FAQ</strong>
   				<br>
   				<br>
   				<span style="font-size: 15px; color: #888888; font-weight: normal;">자주묻는질문</span>
   			</h2>
				 <div class="searchWrap">
								
						<div class="search" style="margin-left: 340px;">
							<ul>
								<li class="web"><p style="font-weight: bold; color:#666666; line-height: 28px; margin-right: 20px; font-size: 13px;">검색</p></li>
								<li class="se">
									<select>
										<option value="0"/>전체</option>
										<option value="title" />제목</option>
										<option value="content" />내용</option>
										<option value="plus">제목+내용</option>
									</select>
								</li>
								<li><input type="text" class="searchInput" style="margin:1px 0 0 1.5px;" /></li>
								<li class=""><a href="#" ><button class="bllist" style="margin:1px 0 0 9px;">검색</button></a></li>
							</ul>
						</div>
					</div> 
					<div class="faqTab">
						<ul>
							<li><a href="faq">전체</a></li>
							<li class="dep"><a href="faqUser">회원</a></li>
							<li><a href="faqMedi">의약품</a></li>
							<li class="last"><a href="#" class="on">기능</a></li>
						</ul>						
					</div>	
					
					<!-- FAQ -->
					<div class="faqList">
						<ul>
							<!-- list -->
							<!-- //list -->

							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question" style="padding: 15px 0;">
										<div class="blet">Q</div>
										<div class="category">기능</div>
										<div class="title">사전 사용하는 방법</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox">
										<div class="blet">A</div>
										<div class="text">
											<strong><u>소비자상담실(02-6959-3647)</u></strong>로 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 
										</div>
									</div>
								</div>
							</li>
							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question" style="padding: 15px 0;">
										<div class="blet">Q</div>
										<div class="category">기능</div>
										<div class="title">자가진단 안내</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox">
										<div class="blet">A</div>
										<div class="text">
											<strong><u>소비자상담실(02-6959-3647)</u></strong>로 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 
										</div>
									</div>
								</div>
							</li>
							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question" style="padding: 15px 0;">
										<div class="blet">Q</div>
										<div class="category">기능</div>
										<div class="title">즐겨찾기 목록 확인하는 방법</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox">
										<div class="blet">A</div>
										<div class="text">
											<strong><u>소비자상담실(02-6959-3647)</u></strong>로 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 
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