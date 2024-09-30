<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> 마이페이지 </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="마이페이지" />
<meta name="keywords" content="마이페이지" />
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
<!-- <script type="text/javascript">
	  $(function(){
		 if(${sessionId==null}){	 
			 location.href="/login";
		 }
	  }); //jquery
  </script> -->
</head>
<body>
<%@include file = "header.jsp" %>
	<!-- container -->
	<div id="" style="margin-top:150px; margin-bottom:200px;">
		
	
			<!-- contents -->
<div id="left" style="width:250px; height: 250px; overflow: hidden;margin:100px 0 0 100px;">
			<div id="title2" style="font-size: 35px;">마이페이지<span style="font-size: 13px;">내 정보</span></div>
				<ul >	
					<li style="height:40px;"><a href="myPage" id="leftNavi3" style="height:40px; font-size: 15px; line-height: 270%;">내 정보</a></li>
					<li style="height:40px;"><a href="myPageFind" id="leftNavi2" style="height:40px; font-size: 15px; line-height: 270%;">즐겨찾기</a></li>
					<li style="height:40px;"><a href="myPageMedi" id="leftNavi1" style="height:40px; font-size: 15px; line-height: 270%;">복용 중인 약</span></a></li>
					<li class="last" style="height:40px;"><a href="myPageFix" id="leftNavi4" style="height:40px; font-size: 15px; line-height: 270%;">회원정보수정</a></li>
				</ul>				
			</div><script type="text/javascript">initSubmenu(3,0);</script>
			
					<!-- <h2><strong>마이페이지</strong><span>내 정보</span></h2> -->
					<div class="myTab">
						<ul>
							<li><a href="" class="on">내 정보</a></li>
							<li class="dep"><a href="myPageFind">즐겨찾기</a></li>
							<li><a href="myPageMedi">복용 중인 약</a></li>
							<li class="last"><a href="myPageFix">회원정보수정</a></li>
						</ul>						
					</div>	
					
					
					
					<div style="margin-top:100px; font-size: 25px; width:1000px;display: flex; margin-left: 450px; margin-right:auto; align-items: center;">
						<img src="/image/Uuser.png"style="width:110px; height:110px; margin-right: 40px;">				
						<div>
						ddd님
						<br>
						<div style="font-size: 15px;">aaa@naver.com</div>
						</div>
						
						</div>
					<div style="width:1000px; height:300px; display: flex; justify-content: space-around; align-items: center; margin-right:auto; margin-left:450px;">
					<div class="Mfind" style="width:245px; height:185px; background:none; color:#0a47ff; border-radius: 50px; 
					 font-family: MinSansVF, Min Sans, sans-serif; font-weight: bold; ">
						<p style="overflow: hidden; margin:40px 0 0 0; font-size:27px;text-align: center;">
						5 회
						<br>
						<br>
						<span style="color:#888888; font-weight:normal; font-size:17px;">수거함 방문 횟수</span>
						</p>
					
					</div>
					<div class="Mfind" style="width:245px; height:185px; background:#none; color:#0a47ff; border-radius: 50px; 
					font-family: MinSansVF, Min Sans, sans-serif; font-weight: bold;">
						<p style="overflow: hidden; margin:40px 0 0 0; font-size:27px; text-align: center;">
						12 개
						<br>
						<br>
						<span style="color:#888888; font-weight:normal; font-size:17px;">즐겨찾기 항목</span>
						</p>
					
					</div>
					<div class="Mfind" style="width:245px; height:185px; background:none; color:#0a47ff; border-radius: 50px; 
					font-family: MinSansVF, Min Sans, sans-serif; font-weight: bold; ">
						<p style="overflow: hidden; margin:40px 0 0 0; font-size:27px;text-align: center;">
						5 개
						<br>
						<br>
						<span style="color:#888888; font-weight:normal; font-size:17px;">알림</span>
						</p>
					
					</div>
					<div class="Mfind" style="width:245px; height:185px; background:none; color:#0a47ff; border-radius: 50px; 
					font-family: MinSansVF, Min Sans, sans-serif; font-weight: bold; " >
						<p style="overflow: hidden; margin:40px 0 0 0; font-size:27px;text-align: center;">
						<!-- <img src="/image/letter.png" style="overflow: hidden; width:20px; height:20px; margin-bottom: 4px;"> -->
						1,202 p
						<br>
						<br>
						<span style="color:#888888; font-weight:normal; font-size:17px;">마일리지</span>
						</p>
					
					</div>
					</div>
					<div style="width:1000px; margin-left: auto; margin-right: auto; margin-bottom: 20px;font-size:17px; color:#0a47ff; padding:0 0 0 35px;">최근 수거함 방문 내역</div>
					<div style="overflow:hidden; border: 1px solid #8497d3;border-radius: 40px; margin-right: auto; margin-left:auto; width:1000px;">
						<table>
							<colgroup>
								<col width="25%">
								<col width="75%">
							</colgroup>
							<tr>
								<th style="border-right: 1px solid #b9c4e8; border-bottom: 1px solid #b9c4e8; background-color: #F5F5F5; height:56px; font-weight: bold; font-size: 15px;">일자</th>
								<th style="border-bottom: 1px solid #b9c4e8;font-weight: bold; font-size: 15px; background: #f5f5f5;">위치</th>
							</tr>
							<tr>
								<td style="height:80px; font-size: 15px;">2024/09/09</td>
								<td style="font-size: 15px;">서울 강서구</td>
							</tr>
							<tr>
								<td style="height:80px; font-size: 15px;">2024/09/16</td>
								<td style="font-size: 15px;">서울 마포구</td>
							</tr>
							<tr>
								<td style="height:80px; font-size: 15px;">2024/09/23</td>
								<td style="font-size: 15px;">서울 서대문구</td>
							</tr>
						</table>
					</div>

					<div style="border-bottom:1px solid #edeef0; margin-top:100px;padding:30px 0;width:1000px; margin-right: auto; margin-left: auto; font-size: 14px; font-weight: bold;">
						<p style="color:#999999; margin-left:30px; ">고객센터</p>
					</div>
					<div style="border-bottom:1px solid #edeef0;padding:30px 0;width:1000px; margin-right: auto; margin-left: auto; font-size: 16px;">
						<a href="blist"style="color:#444444; margin-left:30px; font-weight: bold;">게시판</a>
					</div>
					<div style="border-bottom:1px solid #edeef0;padding:30px 0;width:1000px; margin-right: auto; margin-left: auto; font-size: 16px;">
						<a href="#"style="color:#444444; margin-left:30px; font-weight: bold;">QnA</a>
					</div>
					<div style="border-bottom:1px solid #edeef0;padding:30px 0;width:1000px; margin-right: auto; margin-left: auto; font-size: 16px;">
						<a href="faq" style="color:#444444; margin-left:30px; font-weight: bold;">FAQ</a>
					</div>
					<div style="border-bottom:1px solid #edeef0; margin-top:40px;padding:30px 0;width:1000px; margin-right: auto; margin-left: auto; font-size: 14px; font-weight: bold;">
						<p style="color:#999999; margin-left:30px; ">사이트</p>
					</div>
					<div style="border-bottom:1px solid #edeef0;padding:30px 0;width:1000px; margin-right: auto; margin-left: auto; font-size: 16px;">
						<a href=""style="color:#444444; margin-left:30px; font-weight: bold;">이용약관</a>
					</div>
					<div style="border-bottom:1px solid #edeef0;padding:30px 0;width:1000px; margin-right: auto; margin-left: auto; font-size: 16px;">
						<a href=""style="color:#444444; margin-left:30px; font-weight: bold;">개인정보처리방침</a>
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