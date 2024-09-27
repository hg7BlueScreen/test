<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> JARDIN SHOP </title>
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
	<div id="" style="margin-top:150px; margin-bottom:200px;">
		

			<!-- contents -->

					<!-- <h2><strong>마이페이지</strong><span>내 정보</span></h2> -->
				<div id="left" style="float:left; width:250px; height: 250px; margin: 100px 0 0 100px;">
			<div id="title2" style="font-size: 35px;">마이페이지<span style="font-size: 13px;">내 정보</span></div>
				<ul >	
					<li style="height:40px;"><a href="myPage" id="leftNavi2" style="height:40px; font-size: 15px; line-height: 270%;">내 정보</a></li>
					<li style="height:40px;"><a href="myPageFind" id="leftNavi4" style="height:40px; font-size: 15px; line-height: 270%;">즐겨찾기</a></li>
					<li style="height:40px;"><a href="myPageMedi" id="leftNavi1" style="height:40px; font-size: 15px; line-height: 270%;">복용 중인 약</span></a></li>
					<li class="last" style="height:40px;"><a href="" id="leftNavi3" style="height:40px; font-size: 15px; line-height: 270%;">회원정보수정</a></li>
				</ul>				
			</div><script type="text/javascript">initSubmenu(3,0);</script>
			
					<!-- <h2><strong>마이페이지</strong><span>내 정보</span></h2> -->
					<div class="myTab">
						<ul>
							<li><a href="myPage" >내 정보</a></li>
							<li class="dep"><a href="myPageFind" >즐겨찾기</a></li>
							<li><a href="myPageMedi">복용 중인 약</a></li>
							<li class="last"><a href="" class="on">회원정보수정</a></li>
						</ul>						
					</div>	
				
					

				</div>
			</div>
			<!-- //contents -->

		</div>
	</div>
	<!-- //container -->
<%-- <%@include file = "footer.jsp" %> --%>
</div>
</div>
</body>
</html>