<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link rel="stylesheet" href="css/form.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/login.css">

<script src="js/login.js"></script>

</head>
<body>
<%
String contentpage = request.getParameter("CONTENTPAGE");

%>
<!-- <div class="login-page">
  <div class="form">
    <form class="register-form">
      <input type="text" placeholder="name"/>
      <input type="password" placeholder="password"/>
      <input type="text" placeholder="email address"/>
      <button>create</button>
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form>
    <form class="login-form">
      <input type="text" placeholder="username"/>
      <input type="password" placeholder="password"/>
      <button>login</button>
      <p class="message">Not registered? <a href="#">Create an account</a></p>
    </form>
  </div>
</div> -->


	<%-- <form action="loginProc.jsp?CONTENTPAGE=<%=contentpage %>" method="post" class="login">
	<input hidden="true">
		<table border=1 cellspacing=0 cellpadding=0>
			<tr>
				<td><input type="text" name="id" placeholder="ID"></td>
				<td rowspan="2" style="background-color:gray;"><div height="100%"><input type="submit" class="button" value="logIn"></div></td>			
			</tr>
			<tr>
				<td><input type="password" name="pw" placeholder="password"></td>			
			</tr>
		
		</table>

	</form> --%>
	<div class="login-page">
  <div class="form">
    <table width="100%">
    <tr>
    
    <td width="400px" style="border-right:1px solid white; padding:45px;">
    <form class="login-form"  action="signinProc.jsp?CONTENTPAGE=<%=contentpage %>" method="post" class="login">
    <input hidden="true">
      <input type="text" name="id" placeholder="username"/>
      <input type="password" name="pw" placeholder="password"/>
      <input type="submit" class="button" value="sign In">
      <p class="message">Not registered? <a href="signup.jsp">Create an account</a></p>
    </form>
    </td>
   <td>
    <div style="text-align:center; width:100%;">
    <img src="images/ad.jpg">
    </div>
    </td>
    </tr>
    
    </table>
  </div>
</div>
<a href="signup.jsp">- 회원가입</a><br>

</body>
</html>
