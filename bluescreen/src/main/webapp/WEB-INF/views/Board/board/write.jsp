<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>글쓰기</title>
	</head>
	<body>
		<h1>
			<a href="/index.html">로고</a>
		</h1>
		<h2>게시글 쓰기</h2>
		
		<form id="writeFrm">
			<div>제목 : <input type="text" name="subject"></div>
			<div>작성자 : <input type="text" name="writer"></div>
			<div>내용 : <textarea name="content"></textarea></div>
			<input type="submit" value="글쓰기">
		</form>
		<a href="/list.html">뒤로가기</a>
		<script src="../public/js/write.js"></script>
	</body>
</html>