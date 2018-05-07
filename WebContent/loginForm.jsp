<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>
<center>
	<form action="loginProc.jsp" method="post">
		<table border=1>
			<tr>
				<td>ID</td>
				<td><input type="text" name="id"></td>
							
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="pw"></td>
							
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
					<input type="reset" value="취소">
					
				</td>
			</tr>
		</table>

	</form>
</center>
</body>
</html>
