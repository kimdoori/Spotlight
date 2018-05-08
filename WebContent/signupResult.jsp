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
	out.println("<div style='text-align:center;'><b>회원가입이 완료되었습니다.</b></div>");

}else{
	out.println("<div style='text-align:center;'><b>회원가입에 실패했습니다.</b></div>");

}
%>

<meta http-equiv='refresh' content='2;url=index.jsp'>

</body>
</html>
