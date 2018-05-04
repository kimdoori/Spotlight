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
String result = request.getParameter("send");
if(result.equals("ok")){
	out.println("<font color='red'><b>게시물</font>이 저장되었습니다.</b>");

}else{
	out.println("<font color='red'><b>게시물</font>을 저장할 수 없습니다.</b>");

}
%>
<meta http-equiv='refresh' content='3;url=main.jsp'>

</body>
</html>
