<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 - 결과화면</title>
</head>
<body>
<ul>
<%

%>

<%
	BufferedReader reader = null;

	try{
		String filepath = application.getRealPath("/WEB-INF/review/");
		reader = new BufferedReader(new FileReader(filepath));
		while(true){
			String str = reader.readLine();
			if(str==null) break;
			out.println(str+"<br>");
			
		}
	}catch(Exception e){
		out.println("파일을 읽을 수 없습니다.");
	}
	


%>
</ul>
<%-- 이름 : <%=name %><br>
제목 : <%=title %><br>
내용 : <%=content %><br>
 --%>
</body>
</html>
