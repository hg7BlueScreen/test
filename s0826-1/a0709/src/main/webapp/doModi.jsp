<%@page import="com.java.www.Board"%>
<%@page import="com.java.www.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
		int bno = Integer.parseInt(request.getParameter("bno"));
		//	out.print(bno);
			BoardDao bdao = new BoardDao();
			Board b = bdao.selectOne(bno);
			int result=bdao.updateOne(b);
		if(result!=1){
		%>
			<script>
				alert("수정실패");
				location.href="blist.jsp";
			</script>
		<% }else{ %>
		<script>
			alert("글 수정 성공");
			location.href="blist.jsp";
		</script>
		<% } %>
	</body>
</html>