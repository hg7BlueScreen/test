<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QNA</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
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
	<%@include file="../header.jsp"%>

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
			<div id="title2" style="font-size: 35px;">
				커뮤니티<span style="font-size: 13px;">QNA</span>
			</div>

			<ul>
				<li style="height: 40px;"><a href="../announceList" id="leftNavi4"style="height: 40px; font-size: 15px; line-height: 270%; text-decoration-line: none;">공지사항</a></li>	
				<li style="height:40px;"><a href="/board/blist" id="leftNavi2" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none; ">게시판</a></li>
				<li style="height:40px;"><a href="../qnaList" id="leftNavi3" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">QnA</a></li>
				<li class="last" style="height:40px;"><a href="/board/faq" id="leftNavi1" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">FAQ</span></a></li>
			</ul>
		</div>
		<script type="text/javascript">initSubmenu(3,0);</script>


		<!-- contents -->
		<div style="width: 1000px; margin-right: auto; margin-left: auto;">
			<h2 style="margin-top: 150px; text-align: center;">
				<strong style="font-size: 55px; font-weight: 600px; color: #444444;">QNA</strong>
				<br> <br> <span
					style="font-size: 15px; color: #888888; font-weight: normal;">QNA
					보기</span>

			</h2>


			<div class="faqList"
				style="border: none; margin-left: auto; margin-right: auto; margin-top: 80px;">
				<div class="Bread">

					<div colspan="3"
						style="color: #373f57; font-size: 20px; float: left; font-weight: bold; margin: 20px 0 17px 15px; bottom: 25px; width: 89%;">${q.qtitle }</div>
					<div colspan="3" class="article"
						style="font-size: 15px; bottom: 40px; display: flex; align-items: center; margin-top: 40px;">
						<img src="/image/Uuser.png"
							style="width: 40px; height: 40px; margin-right: 15px;">
						<div>${qna.id }<br>
							<div style="font-size: 12px;">
								<fmt:formatDate value="${qna.qdate }" pattern="yyyy-MM-dd" />
								&nbsp;에 작성
							</div>
						</div>

						<%-- <div class="articlee"><img src="/image/eye.png" style="width:20px; height:20px; vertical-align: middle;">&nbsp;&nbsp;&nbsp; ${board.bhit}</div> --%>
					</div>
					<div colspan="3" class="article"
						style="overflow: hidden; bottom: 25px; font-size: 16px; word-break: break-all; line-height: 27px;">${qna.qcontent }</div>
					<div colspan="3" class="Aarticle">
						<c:if test="${qna.qfile != null}">
							<img src="/images/${qna.qfile }" style="border-radius: 35px;">
						</c:if>
					</div>

					<%--  <div colspan="3" class="article">
        <strong>파일</strong> <span class="separator">|</span> 
         ${board.bfile }
        </div> --%>
					<div class="pnDiv web"
						style="border: none; padding: 15px 15px 0 15px;">
						<table summary="이전다음글을 선택하여 보실 수 있습니다." class="preNext" border="1"
							cellspacing="0">
							<caption>이전다음글</caption>
							<colgroup>
								<col width="100px" />
								<col width="*" />
								<col width="100px" />
							</colgroup>
							<tbody>
								<tr>
									<th class="pre"
										style="border-radius: 12px; border-bottom: none; overflow: hidden; height: 45px;">이전글</th>
									<td><a href="/qnaRead?qno=${prev.qno }"
										style="font-size: 13px;">${prev.qtitle }</a></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td style="color: white; padding: 0;">이후글</td>
								</tr>
								<tr>

									<th class="next"
										style="border-radius: 12px; border-bottom: none; overflow: hidden; height: 45px;">다음글</th>
									<td><a href="/qnaRead?qno=${next.qno }"
										style="font-size: 13px;">${next.qtitle }</a></td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>



			</div>
		</div>
		<script type="text/javascript">
	function delBtn(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="qnaDelete?qno=${qna.qno}";
		}
	}
</script>


		<div
			style="width: 1000px; margin-right: auto; margin-left: auto;">
			<a href="/qna/qnaList"><div class="list"
					style="float: right; margin-right: 20px;">목록</div></a>
			<c:if test="${sessionUno==qna.uno || sessionUno==0}">
				<a onclick="delBtn()" style="float: right;"><div class="list">삭제</div></a>
				<a href="qnaModi?qno=${qna.qno}" onclick="fixBtn()"><div
						class="list" style="margin-bottom: 30px;">수정</div></a>
			</c:if>
			<%-- <a href="breply?bno=${board.bno}"><div class="list">답글달기</div></a> --%>
		</div>


	</div>

	<c:if test="${sessionUno == 0 }">
		<!-- 댓글 -->
		<div class="replyChat">
			<p
				style="font-size: 17px; text-align: left; margin: 300px 0 15px 25px;">
				댓글 &nbsp;&nbsp;&nbsp;<span class="orange" id="comNum">${comList.size() }</span>개
			</p>
			<div class="chatbox">
				<div class=chatbox2>
					<textarea class="replyType" placeholder="게시글에 대한 댓글을 작성해주세요."
						onkeyup="counter(this,1500)"
						style="overflow: hidden; border: none;"></textarea>
				</div>
				<div class="btn" style="float: right;">
					<div>

						<a onclick="commentBtn()" class="replyBtn">댓글 등록</a>

					</div>
				</div>
				<div style="display: flex; align-items: center; height: 55px;">
					<p class="password"
						style="width: 200px; font-size: 13px; padding-left: 40px;"></p>
					<p style="font-size: 12px; color: #0a47ff; height: 20px;"></p>
					<span id="reCount"
						style="float: right; font-size: 14px; padding-left: 580px; height: 20px;">0
						/ 1500 자</span>
				</div>
			</div>

		</div>
	</c:if>
	
	<c:if test="${sessionUno != 0 }">
		<!-- 댓글 -->
		<div class="replyChat">
			<p
				style="font-size: 17px; text-align: left; margin: 300px 0 15px 25px;">
				댓글 &nbsp;&nbsp;&nbsp;<span class="orange" id="comNum">${comList.size() }</span>개
			</p>
			<div class="chatbox">
				<div class=chatbox2>
					<textarea class="replyType" placeholder="게시글에 대한 댓글을 작성해주세요."
						onkeyup="counter(this,1500)"
						style="overflow: hidden; border: none;" disabled>※ 관리자만 작성 가능합니다.</textarea>
				</div>
				<div class="btn" style="float: right;">
					<div>

						<a class="replyBtn">댓글 등록</a>

					</div>
				</div>
				<div style="display: flex; align-items: center; height: 55px;">
					<p class="password"
						style="width: 200px; font-size: 13px; padding-left: 40px;"></p>
					<p style="font-size: 12px; color: #0a47ff; height: 20px;"></p>
					<span id="reCount"
						style="float: right; font-size: 14px; padding-left: 580px; height: 20px;">0
						/ 1500 자</span>
				</div>
			</div>

		</div>
	</c:if>


	<!-- 댓글 문자 수  -->

	<script type="text/javascript">
		
	function counter(text, length){
			var limit = length;
			var str = text.value.length;
			if(str>limit){
				document.getElementById("reCount").innerHTML = "1500자 이상으로 입력하셨습니다.";
				text.value=text.value.substring(0, limit);
				text.focus();
			}
			document.getElementById("reCount").innerHTML = text.value.length+" / "+limit+" 자";
		}
	</script>

	<script type="text/javascript">
	function commentBtn(){
		
		let qccontent = $(".replyType").val();
		let qno = "${qna.qno}";
		
		
		// 로그인 하지 않으면 글을 쓸수 없게 막아놓음 
		if(${sessionId==null}){
			alert("로그인이 필요한 서비스입니다.");
			location.href="/login";
			return false;
		}
		
		if(qccontent==null || qccontent==''){
			alert("내용을 입력하세요");
			return false;
		}// if
		
		location.href = "/qnaCommentInsert?qno="+qno+"&qccontent="+qccontent;
	}
	
	function deleteBtn(qcno){
		let qno = "${qna.qno}";
		if(confirm("댓글을 삭제하시겠습니까?")){
			location.href = "/qnaCommentDelete?qcno="+qcno+"&qno="+qno;
		}
	}
	//--------------------------------------------------------------------------


	</script>

	<div class="replyBox" style="margin-top: 30px; paddding: 1px;">

		<c:forEach var="cdto" items="${comList }">

			<ul id="${cdto.qcno }">

				<li class="name"><img src="/image/Uuser.png"
					style="width: 35px; height: 35px; margin-right: 15px; display: flex; align-items: center;">

					<div style="font-family: Pretendard;">관리자
						님<br>
						<div
							style="font-family: Pretendard; font-size: 11px; color: #888888;">
							<fmt:formatDate value="${cdto.qcdate }" pattern="yyyy-MM-dd" />
						</div>
					</div></li>


				<!-- 비밀글이 아닐때  -->
					<li class="txt">${cdto.qccontent }</li>
				<!-- 댓글쓴 아이디와 로그인한 아이디(세션아이디)가 같을경우만 버튼을 노출함  -->
				<c:if test="${sessionUno == 0}">
					<%-- <c:if test="${cdto.id == cdto.id }"> --%>
					<li style="position: relative; width: 100%;"><a
						onclick="updateBtn(${cdto.qcno})"
						class="rebtn">수정</a> <a onclick="deleteBtn(${cdto.qcno })"
						class="rebtn" style="margin-right: 15px;">삭제</a></li>

				</c:if>
			</ul>


		</c:forEach>
	</div>

	<%@include file="../footer.jsp"%>

</body>
</html>






