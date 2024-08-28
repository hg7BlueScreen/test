<%@page import="com.java.www.Member"%>
<%@page import="com.java.www.MemberDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
		request.setCharacterEncoding("utf-8");
		String uid = request.getParameter("id");
		String upw = request.getParameter("pw");
//		out.print(uid+upw)
		
		
		
		MemberDao mdao = new MemberDao();	
		Member m = mdao.selectLogin(uid, upw);
		
		if(m!=null){
		session.setAttribute("sessionId", m.getId());	
	
		%>
		<script>
			alert("로그인되었습니다");
			location.href="main.jsp";
		</script>
		<% }else{ %>
		<script>
			alert("다시 시도해주세요");
			location.href="login.jsp";
		</script>
		<% } %>		
		
	</body>
</html>