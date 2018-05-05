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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	
	System.out.println("ID : "+id);
	System.out.println("PW : "+pw);

	out.println("ID : "+id);
	out.println("PW : "+pw);
	
%>
ID = <%= id %><br>  <!--out.print(id);-->
PW = <%= pw %><br>
<%--주석1 --%>
<%--
<%
	if(id.equals("choi")){
		if(pw.equals("1234")){
			out.println("[로그인 성공]");

		}else{
			out.println("[비밀번호를 확인하세요.]");
		}
	}else{
		out.println("[회원이 아닙니다.]");
	}

--%>
<%
if(id.equals("choi")){
		if(pw.equals("1234")){%>
			<jsp:forward page="loginOk.jsp"/>
	<%		out.println("[로그인 성공]");
		}else{%>
			<jsp:forward page="login.jsp"/>
		<%
			out.println("[비밀번호를 확인하세요.]");
		}
	}else{
		out.println("[회원이 아닙니다.]");
		%>
		<jsp:forward page="insert.jsp"/>;
		<%
	}

%>

</body>
</html>
