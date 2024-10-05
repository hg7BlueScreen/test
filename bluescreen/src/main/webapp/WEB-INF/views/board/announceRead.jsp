<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/read.css">

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

</head>
<body>
	<%@include file="header.jsp"%>

	<div id="" style="">
		<!-- <div id="location">
		<ol>
			<li><a href="#">HOME</a></li>
			<li><a href="#">고객센터</a></li>
			<li class="last">게시판</li>
		</ol>
	</div>	 -->
		<div id="left"
			style="float: left; width: 250px; height: 250px; margin: 100px 0 0 100px;">
			<div id="title2" style="font-size: 35px;">커뮤니티<span style="font-size: 13px;">게시판</span></div>
			
			<ul >	
				<li style="height:40px;"><a id="leftNavi3" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none; ">공지사항</a></li>
				<li style="height:40px;"><a href="board/blist" id="leftNavi4" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none; ">게시판</a></li>
				<li style="height:40px;"><a href="#" id="leftNavi2" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">QnA</a></li>
				<li class="last" style="height:40px;"><a href="board/faq" id="leftNavi1" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">FAQ</span></a></li>
			</ul>	
		</div>
		<script type="text/javascript">initSubmenu(3,0);</script>


		<!-- contents -->
		<div style="width: 1000px; margin-right: auto; margin-left: auto;">
			<h2 style="margin-top: 150px; text-align: center;">
				<strong style="font-size: 55px; font-weight: 600px; color: #444444;">공지사항</strong>
				<br> <br> <span
					style="font-size: 15px; color: #888888; font-weight: normal;">공지사항 보기</span>
					
			</h2>


			<div class="faqList" style="border: none; margin-left: auto; margin-right: auto; margin-top: 80px; margin-bottom: 100px;">
				<div class="Bread">
					<div colspan="3" style="color: #373f57; font-size: 20px; float: left; font-weight: bold; margin: 20px 0 17px 15px; bottom: 25px; width: 89%;">${announce.atitle }</div>
					<div colspan="3" class="article" style="font-size: 15px; bottom: 40px;  display: flex; align-items: center; margin-top:40px;">
						<div>관리자<br>
							<div style="font-size: 12px;"><fmt:formatDate value="${announce.adate }" pattern="yyyy-MM-dd"/></div>
						</div>
						
					<%-- <div class="articlee"><img src="/image/eye.png" style="width:20px; height:20px; vertical-align: middle;">&nbsp;&nbsp;&nbsp; ${board.bhit}</div> --%>
					</div>
					<div colspan="3" class="article"
						style="overflow: hidden; bottom: 25px; font-size: 16px; word-break: break-all; line-height: 27px;">${announce.acontent }</div>

					<%--  <div colspan="3" class="article">
        <strong>파일</strong> <span class="separator">|</span> 
         ${board.bfile }
        </div> --%>
					<div class="pnDiv web" style="border: none; padding: 15px 15px 0 15px;">
						<table summary="이전다음글을 선택하여 보실 수 있습니다." class="preNext" border="1"
							cellspacing="0">
							<caption>이전다음글</caption>
							<colgroup>
								<col width="100px" />
								<col width="*" />
								<col width="100px" />
							</colgroup>
							<tbody>
							<c:if test="${prev.ano !=null }">
								<tr>
									<th onclick="jumpPrev()" class="pre"
										style="border-radius: 12px; border-bottom: none; overflow: hidden; height: 45px;">이전글</th>
									<td><a href="announceRead?ano=${prev.ano }" style="font-size: 13px;">${prev.atitle }</a></td>
									<td>&nbsp;</td>
								</tr>
							</c:if>
								<tr>
									<td style="color: white; padding: 0;">이후글</td>
								</tr>
								<c:if test="${next.ano !=null }">
									<tr>
	
										<th onclick="jumpNext()" class="next" style="border-radius: 12px; border-bottom: none; overflow: hidden; height: 45px;"><a href="announceRead?ano=${next.ano }">다음글</a></th>
										<td><a href="announceRead?ano=${next.ano }" style="font-size: 13px;">${next.atitle }</a></td>
										
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>

				</div>



			</div>
		</div>
<script type="text/javascript">
	function delBtn(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="adelete?ano=${announce.ano}";
		}
	}
	function jumpPrev(){
		location.href="announceRead?ano=${prev.ano}";
	}
	function jumpNext(){
		location.href="announceRead?ano=${next.ano}";
	}
	
</script>
		<div style="width: 1000px; margin-right: auto; margin-left: auto; margin-bottom: 100px;">
			<a href="announceList"><div class="list" style="float: right; margin-right:20px;">목록</div></a>
		<c:if test="${sessionUno==0}">
			<a onclick="delBtn()" style="float: right;"><div class="list">삭제</div></a>
		</c:if>
		</div>

	</div>
	<div style = "margin-bottom: 150px; padding: 1px;"></div>

	<%@include file="footer.jsp"%>

</body>
</html>






