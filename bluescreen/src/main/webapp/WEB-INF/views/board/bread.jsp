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
			
			<ul>
				<li style="height: 40px;"><a href="blist" id="leftNavi3"
					style="height: 40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">게시판</a></li>
				<li style="height: 40px;"><a href="#" id="leftNavi2"
					style="height: 40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">QnA</a></li>
				<li  class="last" style="height: 40px;"><a href="faq" id="leftNavi1"
					style="height: 40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">FAQ</span></a></li>
				
			</ul>
		</div>
		<script type="text/javascript">initSubmenu(3,0);</script>


		<!-- contents -->
		<div style="width: 1000px; margin-right: auto; margin-left: auto;">
			<h2 style="margin-top: 150px; text-align: center;">
				<strong style="font-size: 55px; font-weight: 600px; color: #444444;">게시글</strong>
				<br> <br> <span
					style="font-size: 15px; color: #888888; font-weight: normal;">게시글 보기</span>
					
			</h2>


			<div class="faqList" style="border: none; margin-left: auto; margin-right: auto; margin-top: 80px; margin-bottom: 100px;">
				<div class="Bread">
					<c:if test="${sessionId != board.id }">
						<a href="fu?bno=${board.bno}" onclick="ggBtn()"><button class="llist" style="margin-left:20px;">신고</button></a>
					</c:if>
					<div colspan="3" style="color: #373f57; font-size: 20px; float: left; font-weight: bold; margin: 20px 0 17px 15px; bottom: 25px; width: 89%;">${board.btitle }</div>
					<div colspan="3" class="article" style="font-size: 15px; bottom: 40px;  display: flex; align-items: center; margin-top:40px;">
						<img src="/image/Uuser.png" style="width: 40px; height: 40px; margin-right: 15px;">
						<div>${board.id }<br>
							<div style="font-size: 12px;"><fmt:formatDate value="${board.bdate }" pattern="yyyy-MM-dd"/>&nbsp;에 작성</div>
						</div>
						
					<%-- <div class="articlee"><img src="/image/eye.png" style="width:20px; height:20px; vertical-align: middle;">&nbsp;&nbsp;&nbsp; ${board.bhit}</div> --%>
					</div>
					<div colspan="3" class="article"
						style="overflow: hidden; bottom: 25px; font-size: 16px; word-break: break-all; line-height: 27px;">${board.bcontent }</div>
					<div colspan="3" class="Aarticle">
					<c:if test="${board.bfile != null}">
						<img src="/images/${board.bfile }" style="border-radius: 35px;">
					</c:if>
					</div>

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
								<tr>
									<th class="pre"
										style="border-radius: 12px; border-bottom: none; overflow: hidden; height: 45px;">이전글</th>
									<td><a href="bread?bno=${prev.bno }&page=${page}&category=${category}&s_word=${s_word}" style="font-size: 13px;">${prev.btitle }</a></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td style="color: white; padding: 0;">이후글</td>
								</tr>
								<tr>

									<th class="next" style="border-radius: 12px; border-bottom: none; overflow: hidden; height: 45px;">다음글</th>
									<td><a href="bread?bno=${next.bno }&page=${page}&category=${category}&s_word=${s_word}" style="font-size: 13px;">${next.btitle }</a></td>
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
			location.href="bdelete?bno=${board.bno}";
		}
	}
</script>


		<div style="width: 1000px; margin-right: auto; margin-left: auto; margin-bottom: 100px;">
			<a href="blist"><div class="list" style="float: right; margin-right:20px;">목록</div></a>
		<c:if test="${sessionId==board.id }">
			<a onclick="delBtn()" style="float: right;"><div class="list">삭제</div></a>
			<a href="bmodi?bno=${board.bno}" onclick="fixBtn()"><div class="list">수정</div></a>
		</c:if>
			<%-- <a href="breply?bno=${board.bno}"><div class="list">답글달기</div></a> --%>
		</div>


	</div>


	<!-- 댓글 -->
	<div class="replyChat">
		<p style="font-size: 17px; text-align: left; margin: 300px 0 15px 25px;">댓글 &nbsp;&nbsp;&nbsp;<span class="orange" id="comNum">${comList.size() }</span>개</p>
		<div class="chatbox">
			<div class=chatbox2>
				<textarea class="replyType" placeholder="게시글에 대한 댓글을 작성해주세요." onkeyup="counter(this,1500)"style="overflow: hidden; border: none;"></textarea>
			</div>
			<div class="btn" style="float: right;">
				<div>
					
					<a onclick="commentBtn()" class="replyBtn">댓글 등록</a>
					
				</div>
			</div>
			<div style="display: flex; align-items: center; height: 55px;">
				<p class="password" style="width: 200px; font-size: 13px; padding-left: 40px;">
					비밀번호&nbsp;&nbsp; <input type="password" id= "Ppassword" class="replynum" />
				</p>
				<p style="font-size: 12px; color: #0a47ff; height: 20px;">※ 비밀번호를 입력하시면 댓글이 비밀글로 등록 됩니다.</p>
				<span id="reCount"style="float: right; font-size: 14px; padding-left: 330px; height: 20px;">0 / 1500 자</span>
			</div>
		</div>

	</div>
	
	
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
		
		let ccontent = $(".replyType").val();
		let cpw = $(".replynum").val();
		let id =  "${sessionId}"; 
		let bno = "${board.bno}";
		
		// 로그인 하지 않으면 글을 쓸수 없게 막아놓음 
		if(${sessionId==null}){
			alert("로그인이 필요한 서비스입니다.");
			location.href="/login";
			return false;
		}
		
			if(ccontent==null || ccontent==''){
			alert("내용을 입력하세요");
			return false;
			};// if
		
	
		
			$.ajax({
				
				url : "/board/commentInsert",
				method: "post",
				data : {"id":id, "cpw":cpw, "ccontent":ccontent, "bno":bno},
				
				success: function(data){
						
					let str='';
					str += '<ul id='+data.cno+'>';
					str += '<li class="name"><img src="/image/Uuser.png"style="width:35px; height:35px; margin-right:15px; display: flex;align-items: center;"><div style="font-family: Pretendard;">'+data.id+' 님<br><div style="font-family: Pretendard; font-size: 11px; color:#888888;"><fmt:formatDate value="${board.bdate }" pattern="yyyy-MM-dd"/>&nbsp;에 작성</div></div></li>';
					str += '<a href="fudel" onclick="ggBtn()" style="float:right; margin-top: 4px;"><button class="llist">신고</button></a><li class="txt"> '+data.ccontent+' </li>';
					str += '<li style="position: relative; width: 100%; overflow: hidden;">';
					str += '<a onclick="updateBtn('+data.cno+',\''+ data.id +'\',\''+ data.cdate +'\',\''+ data.ccontent + '\')" class="rebtn">수정</a>';
					str += '&nbsp;<a onclick="deleteBtn('+data.cno+')" class="rebtn" style="margin-right:15px;">삭제</a>';
					str += '</li>';
					str += '</ul>';
					$(".replyBox").prepend(str);
					
					var n = $("#comNum").text();
					console.log(n);  // 기존의 댓글의 수 
					console.log(typeof(n)); // 문자열이다. 		
					//javascript에서 문자를 숫자 Number()
					var commentNum = Number(n)+1;
					$("#comNum").text(commentNum);
					$(".replyType").val("");
					$(".replynum").val("");	
					
								
				},
				error : function(){
					alert("실패");
				}
			
			});// ajax
	}
	
	
	//--------------------------------------------------------------------------
	//----------- 댓글 수정하기----------------------------------------------------
	function updateBtn(cno, id, cdate, ccontent){
		if(confirm("댓글을 수정하시겠습니까? ")){
			//alert(cno);	alert(id);alert(cdate);	alert(ccontent);	
			let str='';
			str += '<li class="name" style="line-height:30px;"><img src="/image/Uuser.png"style="width:35px; height:35px; margin-right:15px;">'+id+' 님&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: Pretendard;">작성일 : <fmt:formatDate value="${board.bdate }" pattern="yyyy-MM-dd"/></span>';
			str += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			str += '<input type="password" class="Replynum" id="updatePw" />';
			str += '</li>';
			str += '<li style="position: relative; width: 100%; overflow: hidden; top:-33px;">';		
			str += '<a onclick="updateSave('+cno+')" class="Rrebtn" href="javascript:textEnterr();">저장</a>';
			str += '<a onclick="cancelBtn('+cno+',\''+ id +'\',\''+ cdate +'\',\''+ ccontent + '\')" class="Rrebtn" style="margin-right:15px;">취소</a>';
			str += '</li>';
			str += '<li class="Rtxt"><textarea id="updateContent" class="ReplyType">'+ccontent+'</textarea></li>';
			$("#"+cno).html(str);
		}
	}
	
	// 원래대로 되돌리기 
	function cancelBtn(cno, id, cdate, ccontent){
		/* alert('취소버튼'); */
		console.log(cno);	console.log(id);
		console.log(cdate);	console.log(ccontent);
		var str = '';
		str+= '<li class="name"><img src="/image/Uuser.png"style="width:35px; height:35px; margin-right:15px; display: flex;align-items: center;"><div style="font-family: Pretendard;">'+id+' 님<br><div style="font-family: Pretendard; font-size: 11px; color:#888888;"><fmt:formatDate value="${board.bdate }" pattern="yyyy-MM-dd"/>&nbsp;에 작성</div></div></li>';
		str+= '<a href="fudel" onclick="ggBtn()" style="float:right; margin-top: 4px;"><button class="llist">신고</button></a><li class="txt"> '+ccontent+' </li>';
		str+= '<li style="position: relative; width: 100%; overflow: hidden;">';
		str+= '<a onclick="updateBtn('+cno+',\''+ id +'\',\''+ cdate +'\',\''+ ccontent + '\')" class="rebtn">수정</a>';
		str+= '&nbsp;<a onclick="deleteBtn('+cno+')" class="rebtn" style="margin-right:15px;">삭제</a>';
		str+= '</li>';
		$("#"+cno).html(str);
	}
	
	//---- 댓글삭제 --------------------------
	//----------------------------------------------------------------
	function deleteBtn(cno){
		if(confirm("댓글을 삭제하시겠습니까? ")){
			//alert("삭제 : " + cno);
			$.ajax({
				url:"/board/commentDelete",
				method:"post",
				data:{"cno":cno},
				success: function(data){
					alert(data);
					// html에서 제거하기
					$("#"+cno).remove();
					// 총 댓글 수 수정 
					var commentNum = Number($("#comNum").text())-1;
					$("#comNum").text(commentNum);
				},
				error:function(){
					alert("실패");
				}
			});//ajax
		}// if-confirm
	} // delbtn
	
	// --- 수정된 값 저장하기 
	function updateSave(cno){
		if(confirm("저장하시겠습니까?")){
			$.ajax({
				url : "/board/commentUpdate",
				method: "post",
				data: {"cno": cno, "cpw":$("#updatePw").val(), 
					"ccontent":$("#updateContent").val() },
				success: function(data){
					/* alert("댓글 수정 성공"); */
					let updateContent=$("#updateContent").val();
					if(updateContent=='' || updateContent==null){
						alert("내용을 입력하세요");
						return false;
					}
					
					console.log(data);
					var str = '';
					str+= '<li class="name"><img src="/image/Uuser.png"style="width:35px; height:35px; margin-right:15px; display: flex;align-items: center;"><div style="font-family: Pretendard;">'+data.id+' 님<br><div style="font-family: Pretendard; font-size: 11px; color:#888888;"><fmt:formatDate value="${board.bdate }" pattern="yyyy-MM-dd"/>&nbsp;에 작성</div></div></li>';
					str+= '<a href="fudel" onclick="ggBtn()" style="float:right; margin-top: 4px;"><button class="llist">신고</button></a><li class="txt"> '+data.ccontent+' </li>';
					str+= '<li style="position: relative; width: 100%; overflow: hidden;">';
					str+= '<a onclick="updateBtn('+data.cno+',\''+ data.id +'\',\''+ data.cdate +'\',\''+ data.ccontent + '\')" class="rebtn">수정</a>';
					str+= '&nbsp;<a onclick="deleteBtn('+data.cno+')" class="rebtn" style="margin-right:15px;">삭제</a>';
					str+= '</li>';
					$("#"+cno).html(str);
					
				},
				error:function(){
					alert("실패");
				}
			}) ; //ajax
		} // if-confirm
	}//updateSave
	
	</script>

	<div class="replyBox">

		<c:forEach var="cdto" items="${comList }">
			
			<ul id="${cdto.cno }">

				<li class="name"><img src="/image/Uuser.png" style="width: 35px; height: 35px; margin-right: 15px; display: flex; align-items: center;">
				
					<div style="font-family: Pretendard;">${cdto.id }
						님<br>
						<div style="font-family: Pretendard; font-size: 11px; color: #888888;"><fmt:formatDate value="${board.bdate }" pattern="yyyy-MM-dd"/>&nbsp;에 작성
						<c:if test="${ sessionId == cdto.id && cdto.cpw !=null }">
							&nbsp;&nbsp;&nbsp;※ 비밀글
						</c:if>
						</div>
					</div></li>




				

				<!-- 비밀글일때 아이디와 세션아이디가 같을때만 보여야함. 비밀번호가 있을때만 비밀글-->
				<c:if test="${ sessionId != cdto.id && cdto.cpw !=null }">
					<li class="txt"><span class="orange">※ 비밀글입니다.</span></li>
				</c:if>
				<!-- 비밀글이 아닐때  -->
				<c:if test="${ !(sessionId != cdto.id && cdto.cpw !=null) }">
					<a href="fudel?bno=${cdto.cno }&id=${board.id}" onclick="ggBtn()"
						style="float: right; margin-top: 4px;"><button class="llist" onclick="llistBtn()">신고</button></a>
					<li class="txt">${cdto.ccontent }</li>
				</c:if>
				<!-- 댓글쓴 아이디와 로그인한 아이디(세션아이디)가 같을경우만 버튼을 노출함  -->
				<c:if test="${sessionId == cdto.id}">
				<%-- <c:if test="${cdto.id == cdto.id }"> --%>
					<li style="position: relative; width: 100%;">
						<a onclick="updateBtn(${cdto.cno }, '${cdto.id }', '${cdto.cdate }', '${cdto.ccontent }')"class="rebtn">수정</a>
						<a onclick="deleteBtn(${cdto.cno })"class="rebtn" style="margin-right: 15px;">삭제</a>
					</li>
				
				 </c:if> 
				
			</ul>
			
		
		</c:forEach>
	</div>

	<%@include file="footer.jsp"%>

</body>
</html>






