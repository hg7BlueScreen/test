<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	<style>
		h1{width:1000px; text-align:center}
		table, th, td{border:1px solid black; border-collapse:collapse;
		text-align:center;}
		table{width:1000px; margin:30px auto;}
		th, td{height:40px;}
	</style>
	</head>
	<body>
		<h1>게시판</h1>
		<table>
			<colgroup>
				<col style="width:10%">
				<col style="width:40%">
				<col style="width:20%">
				<col style="width:20%">
				<col style="width:10%">
			</colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<%
				request.setCharacterEncoding("utf-8");
				String bno, btitle, bhit, id;
				Timestamp bdate;
				// 커넥션 풀 연결
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				try{
					Context context = new InitialContext();
					DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle8");
					conn = ds.getConnection();
					String query = "select*from board";
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					while(rs.next()){
						bno = rs.getString("bno");
						id = rs.getString("id");
						btitle = rs.getString("btitle");
						bdate = rs.getTimestamp("bdate");
						bhit = rs.getString("bhit");
				%>
				<tr>
					<td><%= bno  %></td>
					<td><%= btitle  %></td>
					<td><%= id  %></td>
					<td><%= bdate  %></td>
					<td><%= bhit  %></td>
				</tr>
				<% 
					}
					
				}catch(Exception e){e.printStackTrace();}
				finally{
					try{
						if(rs != null) rs.close();
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					}catch(Exception e2){e2.printStackTrace();}
				}
			%>
			
		</table>
	</body>
</html>