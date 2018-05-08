<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>Spotlight</title>
<style>
body,html{
	width:100%;
	height:100%;
	margin:0px;
	padding:0px;
/* 	background-image:url("webImage/logo.jpg");
 */
}
#main{
/* margin-top:5%;
 */
}
</style>
</head>
<body>

<%
	String contentpage = request.getParameter("CONTENTPAGE");

%>

<!--templateTest.jsp<br>-->

<%-- <%=contentpage %> --%>

<%--  <jsp:include page="top.jsp" flush="false"/>
 --%>
<table id="main" width="100%"  border="1" cellspacing="0">
<tr>
	<td colspan="2">
		<jsp:include page="top.jsp" flush="false"/>

	</td>
</tr> 
<tr height="850px">
	<td width=15% valign="top" >
		<jsp:include page="left.jsp" flush="false">
			<jsp:param name="CONTENTPAGE" value="<%=contentpage %>"/>
		</jsp:include>
	</td>
	<td width=85% valign="top" style="background-image:url('webImage/wall.jpg');background-repeat:repeat;">
		<jsp:include page="<%= contentpage %>"></jsp:include>
	</td>
	
	
</tr>
<tr>
<td colspan="2"><jsp:include page="bottom.jsp" flush="false"/></td>


</tr>

</table>



</body>
</html>
