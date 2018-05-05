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
<%
	request.setCharacterEncoding("UTF-8");
	
	String contents =request.getParameter("content");
	
	Date date = new Date();
	Long time = date.getTime();
	String user = (String)session.getAttribute("id");

	String filename = time +user +".txt";
	
	
	PrintWriter writer = null;
	String result;
	try{
		String filePath = application.getRealPath("/WEB-INF/review/"+filename);
		//out.println(filePath);
		writer = new PrintWriter(filePath);
		writer.printf("%s %n",time);
		writer.printf("%s %n",user);
		writer.println(contents);
		
		//out.println("<font color='red'><b>게시물</font>이 저장되었습니다.</b>");
		writer.flush();
		result="ok";
	}catch(Exception e){
		out.println("오류발생");
		result="fail";
	}
	response.sendRedirect("review.jsp?send="+result);

%>

</body>
</html>
