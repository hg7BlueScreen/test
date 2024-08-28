<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
		String uploadPath="c:upload";
		int size = 10*1024*1024;
		MultipartRequest(request, uploadPath, size, "utf-8",
		new DefaultFileRenamePolicy();
		
		
		String uBfile = multi.getFilesystemName("bfile");
		String uBtitle = multi.getParameter("btitle");
		String uBcontent = multi.getParameter("bcontent");
		String uId = (String)session.getAtribute("sessionId");
		
out.print(uBfile+uBtitle+uBcontent+uId);
		
		
		int result = 1; //bdao.insertOne(b);
		if(result!=1){
	%>
	<% }else{ %>
	<% } %>
	
	</body>
</html>