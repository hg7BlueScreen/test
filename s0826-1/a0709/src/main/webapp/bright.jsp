<%@page import="com.java.www.Board"%>
<%@page import="com.java.www.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
	*{margin:0; padding:0;}
	div{width:1000px; margin:30px auto; text-align:center;}
	h1{margin-bottom:30px;}
	table,th,td{border:1px solid black; border-collapse:collapse;
					font-size:16px;}
	th, td{width:200px; height:40px;}
	button{width:200px; heignt:60px; margin-top:30px;}
	textarea{font-size:17px;}
	input[type=text]{width:97%; height:30px; font-size:17px;}
	</style>
	<script>
	$(function(){
		$("#fbtn").click(function(){
			alert("저장되었습니다");
			location.href="";
		})
	})
	</script>
	</head>
	<body>
	<%	int bno = Integer.parseInt(request.getParameter("bno"));
		//	out.print(bno);
			BoardDao bdao = new BoardDao();
			Board b = bdao.selectOne(bno);
		%>
		<div>
			<h1>글쓰기</h1>
			<form action="dowrite.jsp" name="b_frm" method="post" enctype="multipart/form-data">
			<table>
				<colgroup><col width="20%"><col width="80%"></colgroup>
				<tr>
					<th>제목</th>
					<td><%= b.getBtitle() %>
					<input type="text" name="btitle" id="btitle" value="<%= b.getBtitle() %>"></td>
					
				</tr>
				<tr>
					<th>번호</th>
					<td><%= b.getBno() %>
					<input type="text" name="bno" id="bno" value="<%= b.getBno() %>"></td>
					
				</tr>
				<tr>
					<th>아이디</th>
					<td><%= (String)session.getAttribute("sessionId") %>
					<input type="hidden" name="id"
						value="<%=(String)session.getAttribute("sessionId")  %>">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><%= b.getBcontent() %>
					<textarea name="bcontent"rows="30" cols="65" ></textarea>
					</td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<%= b.getBfile() %>
					<td><input type="file" name="bfile" id="bfile"></td>
				</tr>
			</table>
			
			<button type="button" id="fbtn">저장</button>
			<button type="button" onclick="javascript:history.back()">취소</button>
			</form>
			
		</div>
	</body>
</html>