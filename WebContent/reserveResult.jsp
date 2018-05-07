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
	out.println("<div style='text-align:center;'><b>결제가 완료되었습니다.</b></div>");

}else{
	out.println("<div style='text-align:center;'><b>결제에 실패했습니다.</b></div>");

}
%>
<script> 
setTimeout("self.close()", 1500); 
 </script>
</body>
</html>
