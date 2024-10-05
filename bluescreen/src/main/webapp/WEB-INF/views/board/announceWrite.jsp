<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 쓰기</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
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

</head>
<body>
	<%@include file="header.jsp"%>

	<div id="" style="">
		<!-- 	<div id="location">
		<ol>
			<li><a href="#">HOME</a></li>
			<li><a href="#">고객센터</a></li>
			<li class="last">게시판</li>
		</ol>
	</div> -->
		<!-- <div id="outbox">	 -->
			
	</div>
	<script type="text/javascript">
		initSubmenu(3, 0);
	</script>


	<!-- contents -->
	<div style="width: 1000px; margin-right: auto; margin-left: auto;">
		<h2 style="margin-top: 150px; text-align: center;">
			<strong style="font-size: 55px; font-weight: 600px; color: #444444;">공지사항</strong>
			<br> <br> <span
				style="font-size: 15px; color: #888888; font-weight: normal;">공지사항
				작성</span>
		</h2>
		<hr>
		<form action="announceWrite" id="announce" name="announce" method="post"
			enctype="multipart/form-data">
			<table style="margin: 80px 0 100px 0;">
				<colgroup>
					<col width="10%">
					<col width="85%">
				</colgroup>
				<tr>
					<th
						style="font-size: 15px; color: #0a47ff; font-weight: bold; padding-bottom: 10px;">제목</th>
					<td><input type="text" name="atitle" id="atitle"
						placeholder="제목을 작성해주세요."
						style="font-size: 15px; border-radius: 15px; margin-bottom: 10px; border-color: #edeef0; padding: 20px 20px;"></td>
				</tr>
				<tr>
					<th
						style="font-size: 15px; color: #0a47ff; font-weight: bold; padding-bottom: 15px;">내용</th>
					<td><textarea name="acontent" id="acontent"
							placeholder="내용을 작성해주세요." cols="50" rows="15"
							style="margin-top: 5px; font-size: 15px; border-radius: 20px; margin-bottom: 10px; border-color: #edeef0; padding: 20px 20px;"></textarea>
					</td>
				</tr>
			</table>
			<hr>
			<script type="text/javascript">
				function writetn() {
					let atitle = $("#atitle").val();
					let acontent = $("#acontent").val();
					if (confirm("작성 완료하시겠습니까?")) {

						if (atitle == '' || atitle == null) {
							alert("제목을 입력하세요");
							return false;
						}// if
						if (acontent == '' || acontent == null) {
							alert("내용을 입력하세요");
							return false;
						}// if

						$("#announce").submit();
					}

				}
			</script>
			<div class="button-wrapper"
				style="border: none; margin-right: auto; margin-left: auto; margin-bottom: 460px;">

				<button type="button" class="write" onclick="writetn()">작성완료</button>
				<a href="/announceList"><button type="button" class="cancel">취소</button></a>
			</div>
		</form>

	</div>

	</div>
	<div style="margin-bottom: 150px; padding: 1px;"></div>
</body>
</html>