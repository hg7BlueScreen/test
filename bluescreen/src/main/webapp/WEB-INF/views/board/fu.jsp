<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시글 신고</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/write.css">
  
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
  <script type="text/javascript">
	  $(function(){
		 if(${sessionId==null}){
			 alert("로그인이 필요한 서비스입니다.");
			 location.href="/login";
		 }
	  }); //jquery
  </script> 
</head>
<body>
<%@include file = "header.jsp" %>

<div id="" style="">
  	<!-- <div id="location">
		<ol>
			<li><a href="#">HOME</a></li>
			<li><a href="#">고객센터</a></li>
			<li class="last">게시판</li>
		</ol>
	</div> -->
		<div id="left" style="float:left; width:250px; height: 250px; margin: 100px 0 0 100px;">
			<div id="title2" style="font-size: 35px;">커뮤니티<span style="font-size: 13px;">신고</span></div>
				<ul >	
					<li style="height: 40px;"><a href="../announceList" id="leftNavi4"style="height: 40px; font-size: 15px; line-height: 270%; text-decoration-line: none;">공지사항</a></li>
					<li style="height:40px;"><a href="blist" id="leftNavi3" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">게시판</a></li>
					<li style="height:40px;"><a href="/qnaList" id="leftNavi2" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">QnA</a></li>
					<li  class="last" style="height:40px;"><a href="faq" id="leftNavi1" style="height:40px; font-size: 15px; line-height: 270%; text-decoration-line:none;">FAQ</span></a></li>
					
				</ul>				
			</div><script type="text/javascript">initSubmenu(3,0);</script>
			
		
	<!-- contents -->
	<div style="width:1000px; margin-right: auto; margin-left:auto;">					
   			<h2 style="margin-top:200px; text-align: center;">
   				<strong style="font-size: 55px; font-weight:600px; color:#444444; ">신고</strong>
   				<br>
   				<br>
   				<span style="font-size: 15px; color: #888888; font-weight: normal;">게시글 신고</span>
   			</h2>


    <hr>
    <form action="fu" id="fu" name="write" method="post" enctype="multipart/form-data">
    
      <input type="hidden" name="no" id="no" value="${board.bno }"> <!-- 신고 게시글 / 댓글 번호 -->
      <input type="hidden" name="sid" id="sid" value="${board.id }"> <!-- 신고 피신고자 아이디 -->
      <input type="hidden" name="cid" id="cid" value="${sessionId }"> <!-- 신고 신고자 아이디 -->
      <input type="hidden" name="division" id="division" value="0"> <!-- 신고 카테고리 ( 0이면 게시글 1이면 댓글) -->
      
      <table style="margin: 80px 0 100px 0;">
        <colgroup>
          <col width="10%">
          <col width="85%">
        </colgroup>
         <tr>
         	<th style=" color: #0a47ff; font-weight: bold; padding-top: 2px; font-size:15px">신고사유</th>
		        <td style="float:left;">
		        	<select style="width:50px; height: 52px;" id = "creason" name = "creason"> 
						<option value="전체" />전체</option> 
						<option value="비방/욕설" />비방/욕설</option> 
						<option value="허위사실" />허위사실</option> 
						<option value="개인정보노출">개인정보노출</option> 
						<option value="음란성">음란성</option> 
						<option value="게시글 도배">게시글 도배</option> 
						<option value="부적절한 홍보">부적절한 홍보</option> 
						<option value="기타">기타</option> 
					</select>
		        </td>
        </tr>
         <tr>
          <th style="font-size:15px;color: #0a47ff; font-weight: bold;">신고내용</th>
          <td>
            <textarea name="bcontent" id= "bcontent" cols="50" rows="15" placeholder="내용을 작성해주세요." style="margin-top:14px; font-size:15px;border-radius: 20px;border-color: #edeef0; padding:20px;"></textarea>
          </td>
        </tr>
      </table>
      <hr>
 <script type="text/javascript">
	function futn(){
		let bcontent=$("#bcontent").val();
		if(confirm("신고하시겠습니까?")){
			
		if(bcontent=='' || bcontent==null){
			alert("내용을 입력하세요");
			return false;
		}
		
		$("#fu").submit();
		}
	}
	
</script> 
      <div class="button-wrapper" style="border:none; margin-bottom: 460px;">
        <button type="button" class="write" onclick="futn()" style="border:none;">신고</button>
        <a href="blist"><button type="button" class="cancel">취소</button></a>
      </div>
    </form>
</div>
</div>


  <%@include file = "footer.jsp" %>
</body>
</html>