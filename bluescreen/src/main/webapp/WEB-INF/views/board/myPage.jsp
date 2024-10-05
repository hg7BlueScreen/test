<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title> 마이페이지 | 내 정보 </title>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="../js/html5.js"></script>
<script type="text/javascript" src="../js/respond.min.js"></script>
<![endif]-->
  <script type="text/javascript">
	  $(function(){
		 if(${sessionId==null}){	 
			 alert("로그인이 필요한 서비스입니다.");
			 location.href="/login";
			 
		 }
	  }); //jquery
  console.log("${cList}");
	  </script>  
  
</head>
<body>
<%@include file = "header.jsp" %>
	<!-- container -->
	<div id="left" style="width:250px; height: 250px; overflow: hidden;margin:100px 0 0 100px;">
			<div id="title2" style="font-size: 35px;">마이페이지<span style="font-size: 13px;">내 정보</span></div>
				<ul >	
					<li style="height:40px;"><a href="myPage" id="leftNavi3" style="height:40px; font-size: 15px; line-height: 270%; text-decoration: none;">내 정보</a></li>
					<li style="height:40px;"><a href="myPageFind" id="leftNavi2" style="height:40px; font-size: 15px; line-height: 270%; text-decoration: none;">즐겨찾기</a></li>
					<li style="height:40px;"><a href="myPageMedi" id="leftNavi1" style="height:40px; font-size: 15px; line-height: 270%; text-decoration: none;">복용 중인 약</span></a></li>
					<li class="last" style="height:40px;"><a href="myPageFix" id="leftNavi4" style="height:40px; font-size: 15px; line-height: 270%; text-decoration: none;">회원정보</a></li>
				</ul>				
			</div><script type="text/javascript">initSubmenu(3,0);</script>
	
	<div id="mmypage" style="width:1000px;  margin:150px auto 200px auto;">
		
	
			<!-- contents -->

			
					<!-- <h2><strong>마이페이지</strong><span>내 정보</span></h2> -->
					<div class="myTab">
						<ul>
							<li><a href="" class="on">내 정보</a></li>
							<li class="dep"><a href="myPageFind">즐겨찾기</a></li>
							<li><a href="myPageMedi">복용 중인 약</a></li>
							<li class="last"><a href="myPageFix">회원정보</a></li>
						</ul>						
					</div>	
					
					
				
					<div style="margin-top:100px; font-size: 25px; width:100%;display: flex; margin-left: auto; margin-right:auto; align-items: center;">
						<img src="/image/Uuser.png"style="width:110px; height:110px; margin-right: 40px;">				
						<div>
						${sessionId} 님
						<br>
						<div style="font-size: 15px;">${bEmail }</div>
						</div>
						
						</div>
					<div style="width:100%; height:300px; display: flex; justify-content: space-around; align-items: center; margin:0 auto;">
					<div class="Mfind" style="width:245px; height:185px; background:none; color:#0a47ff; border-radius: 50px; 
					 font-family: MinSansVF, Min Sans, sans-serif; font-weight: bold; ">
						<p style=" margin:40px 0 0 0; font-size:27px;text-align: center;">
					<c:if test="${Ddate != null}">
						<fmt:formatDate value="${Ddate }" pattern="yyyy-MM-dd"/>
					</c:if>
					<c:if test="${Ddate == null}">
						0 회
					</c:if>
						<br>
						<br>
						<span style="color:#888888; font-weight:normal; font-size:17px;">최근 &nbsp;복용약 &nbsp;등록</span>
						</p>
					
					</div>
					<div class="Mfind" style="width:245px; height:185px; background:#none; color:#0a47ff; border-radius: 50px; 
					font-family: MinSansVF, Min Sans, sans-serif; font-weight: bold;">
						<p style=" margin:40px 0 0 0; font-size:27px; text-align: center;">
					<c:if test="${Mcount != null}">
						${Mcount } 개
					</c:if>
					<c:if test="${Mcount == null}">
						0 개
					</c:if>
						<br>
						<br>
						<span style="color:#888888; font-weight:normal; font-size:17px;">복용약</span>
						</p>
					
					</div>
					<div class="Mfind" style="width:245px; height:185px; background:none; color:#0a47ff; border-radius: 50px; 
					font-family: MinSansVF, Min Sans, sans-serif; font-weight: bold; ">
						<p id="" style="overflow: hidden; margin:40px 0 0 0; font-size:27px;text-align: center;">
					<c:if test="${Bcount != null}">
						${Bcount } 개
					</c:if>
					<c:if test="${Bcount == null}">
						0 개
					</c:if>
						<br>
						<br>
						<span style="color:#888888; font-weight:normal; font-size:17px;">즐겨찾기</span>
						</p>
					
					</div>
					<div class="Mfind" style="width:245px; height:185px; background:none; color:#0a47ff; border-radius: 50px; 
					font-family: MinSansVF, Min Sans, sans-serif; font-weight: bold; " >
						<p style=" margin:40px 0 0 0; font-size:27px;text-align: center;">
						<!-- <img src="/image/letter.png" style="overflow: hidden; width:20px; height:20px; margin-bottom: 4px;"> -->
					<c:if test="${Boardcount != null}">
						${Boardcount } 개
					</c:if>
					<c:if test="${Boardcount == null}">
						0 개
					</c:if>
						<br>
						<br>
						<span style="color:#888888; font-weight:normal; font-size:17px;">게시글</span>
						</p>
					
					</div>
					</div>
					<div style="width:1000px; margin-left: auto; margin-right: auto; margin-bottom: 20px;font-size:17px; color:#0a47ff; padding:0 0 0 35px;">최근 경고 내역</div>
					<div style="overflow:hidden; border: 1px solid #8497d3;border-radius: 40px; margin-right: auto; margin-left:auto; width:1000px;">
						<table>
							<colgroup>
								<col width="25%">
								<col width="75%">
							</colgroup>
							<tr>
								<th style="border-right: 1px solid #b9c4e8; border-bottom: 1px solid #b9c4e8; background-color: #F5F5F5; height:56px; font-weight: bold; font-size: 15px;">일자</th>
								<th style="border-bottom: 1px solid #b9c4e8;font-weight: bold; font-size: 15px; background: #f5f5f5;">사유</th>
							</tr>
						<c:if test="${cList != null }">
							<c:forEach var="c" items="${cList }">
							<tr>
								<c:if test="${c.cautionDate != null}">
									<td style="height:80px; font-size: 15px;"><fmt:formatDate value="${c.cautionDate }" pattern="yyyy-MM-dd"/></td>
								</c:if>
								<c:if test="${c.cautionReason != null}">
									<td style="font-size: 15px;">${c.cautionReason }</td>
								</c:if>
							</tr>
							</c:forEach>
						</c:if>
						<c:if test="${cList.size() == 0 }">
								<tr>
									<td style="height:80px; font-size: 15px;">-</td>
									<td style="font-size: 15px;">경고 내역이 없습니다.</td>
								</tr>
						</c:if>
						</table>
					</div>
				
					<div style="border-bottom:1px solid #edeef0; margin-top:100px;padding:30px 0;width:100%; margin-right: auto; margin-left: auto; font-size: 14px; font-weight: bold;">
						<p style="color:#999999; margin-left:30px; ">고객센터</p>
					</div>
					<div style="border-bottom:1px solid #edeef0;padding:30px 0;width:100%; margin-right: auto; margin-left: auto; font-size: 16px;">
						<a href="blist" class="myMenus"style="color:#444444; margin-left:30px; font-weight: bold;  text-decoration-line:none;">게시판</a>
					</div>
					<div style="border-bottom:1px solid #edeef0;padding:30px 0;width:100%; margin-right: auto; margin-left: auto; font-size: 16px;">
						<a href="#"style="color:#444444; margin-left:30px; font-weight: bold; text-decoration-line:none;">QnA</a>
					</div>
					<div style="border-bottom:1px solid #edeef0;padding:30px 0;width:100%; margin-right: auto; margin-left: auto; font-size: 16px;">
						<a href="faq" style="color:#444444; margin-left:30px; font-weight: bold; text-decoration-line:none;">FAQ</a>
					</div>
					<div style="border-bottom:1px solid #edeef0; margin-top:40px;padding:30px 0;width:100%; margin-right: auto; margin-left: auto; font-size: 14px; font-weight: bold;">
						<p style="color:#999999; margin-left:30px; ">사이트</p>
					</div>
					<div style="border-bottom:1px solid #edeef0;padding:30px 0;width:100%; margin-right: auto; margin-left: auto; font-size: 16px;">
						<a href=""style="color:#444444; margin-left:30px; font-weight: bold; text-decoration-line:none;">이용약관</a>
					</div>
					<div style="border-bottom:1px solid #edeef0;padding:30px 0;width:100%; margin-right: auto; margin-left: auto; font-size: 16px;">
						<a href=""style="color:#444444; margin-left:30px; font-weight: bold; text-decoration-line:none;">개인정보처리방침</a>
					</div>
					
					

				</div>
			
			<!-- //contents -->

		
	<!-- //container -->
<%@include file = "footer.jsp" %>

</body>
</html>