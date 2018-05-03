<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template 예제</title>
<style>
body,html{

}
</style>
</head>
<body>

<%
	String contentpage = request.getParameter("CONTENTPAGE");

%>

<!--templateTest.jsp<br>-->

<%-- <%=contentpage %> --%>

<table width="100%" border="1" cellspacing="0">
<tr>
	<td colspan="2">
		<jsp:include page="top.jsp" flush="false"/>

	</td>
</tr>
<tr>
	<td width=150 valign="top">
		<jsp:include page="left.jsp" flush="false"/>
	</td>
	<td width=350 valign="top">
		<jsp:include page="<%= contentpage %>"></jsp:include>
	</td>
	
	
</tr>
<tr>
<td colspan="2"><jsp:include page="bottom.jsp" flush="false"/></td>


</tr>

</table>



</body>
</html>
