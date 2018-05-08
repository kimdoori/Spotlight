<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/animation.css" />
</head>
<body>
<table width="100%">
<tr>
<td height="100px">
    
<%
	request.setCharacterEncoding("UTF-8");

	String userId = (String)session.getAttribute("id");
	String userName = (String)session.getAttribute("name");
	String contentpage = request.getParameter("CONTENTPAGE");


	if(userId == null || userId.equals("") ){%>
		<jsp:include page="loginForm.jsp">
			<jsp:param name="CONTENTPAGE" value="<%=contentpage %>"/>
		</jsp:include>
		
	<%
	}else{%>
		<jsp:include page="userProc.jsp">
			<jsp:param name="USERNAME" value="<%=userName %>"/>
		</jsp:include>
<% 
	}
%>

</td>
</tr>
<tr>
<td>

인기 영화<br>
<div class="rw-words rw-words-1">
			<span>1. 어벤져스:인피니티워</span>
			<span>2. 챔피언</span>
			<span>3. 원더스트럭</span>
						<span>4. 그날,바다</span>
						<span>5. 얼리맨</span>
						<span>6. 매직빈</span>
			
</div>
</td>
</tr>
</table>



</body>
</html>
