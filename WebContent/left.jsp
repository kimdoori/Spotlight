<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

</td>
</tr>
</table>
