<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>
<%
	
	String userName = request.getParameter("USERNAME");
	System.out.println(userName);
%>

<%=userName %>님 환영합니다.<br>
<a href="logout.jsp">- 로그아웃</a><br>

</body>
</html>
