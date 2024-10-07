<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QNA 쓰기</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/write.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
	<%@include file="../header.jsp"%>

	<div id="" style="">
		<!-- 	<div id="location">
		<ol>
			<li><a href="#">HOME</a></li>
			<li><a href="#">고객센터</a></li>
			<li class="last">게시판</li>
		</ol>
	</div> -->
		<!-- <div id="outbox">	 -->
		<div id="left" style="float: left; width: 250px; height: 250px; margin: 100px 0 0 100px;">
			<div id="title2" style="font-size: 35px;">커뮤니티<span style="font-size: 13px;">QNA</span></div>
			
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
				<br> <br> 
				<span style="font-size: 15px; color: #888888; font-weight: normal;">QNA 쓰기</span>
			</h2>
			<hr>
			<form action="/qnaWrite" id= "qnaWrite" name="qnaWrite" method="post" enctype="multipart/form-data">
      <table  style="margin: 80px 0 100px 0;">
        <colgroup>
	        <col width="10%">
	        <col width="85%">
        </colgroup>
        <tr>
          <th style="font-size: 15px; color: #0a47ff; font-weight: bold; padding-bottom: 13px;" >회원</th>
          <td> <input type="text" name="id" value="${sessionId }" disabled  style="text-align: left; font-size: 15px; border-radius: 15px; margin-bottom: 14px; border-color: #edeef0; padding: 20px 20px;"> </td>
        </tr>
        <tr>
        	<th style="font-size: 15px; color: #0a47ff; font-weight: bold; padding-bottom: 10px;">제목</th>
        	<td><input type="text" name="qtitle" id="qtitle" placeholder="제목을 작성해주세요." style="font-size: 15px; border-radius: 15px; margin-bottom: 10px; border-color: #edeef0; padding: 20px 20px;"></td>
        </tr>
        <tr>
          <th style="font-size: 15px; color: #0a47ff; font-weight: bold; padding-bottom: 15px;">내용</th>
          <td>
            <textarea name="qcontent" id="qcontent" placeholder="내용을 작성해주세요." cols="50" rows="15" style="margin-top: 5px; font-size: 15px; border-radius: 20px; margin-bottom: 10px; border-color: #edeef0; padding: 20px 20px;"></textarea>
          </td>
        </tr>
        <tr>
          <th style="font-size: 15px; color: #0a47ff; font-weight: bold; padding-bottom: 5px;">이미지</th>
          <td>
            <input type="file" name="file" id="file">
          </td>
        </tr>
      </table>
      <hr>
      <script type="text/javascript">
			function writetn(){
				let qtitle=$("#qtitle").val();
				let qcontent=$("#qcontent").val();
				if(confirm("작성 완료하시겠습니까?")){
					
					if(qtitle=='' || qtitle==null){
					alert("제목을 입력하세요");
					return false;
					}// if
					if(qcontent=='' || qcontent==null){
						alert("내용을 입력하세요");
						return false;
					}// if
					
					$("#qnaWrite").submit();
					
				
				}
				
				
			}
</script>
      <div class="button-wrapper"style="border: none; margin-right: auto; margin-left: auto; margin-bottom: 460px;">
        
        <button type="button" class="write" onclick="writetn()">작성완료</button> 
        <a href="/qnaList"><button type="button" class="cancel">취소</button></a>
      </div>
    </form>
		
		</div>

	</div>


	<%@include file="../footer.jsp"%>
</body>
</html>