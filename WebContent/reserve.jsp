<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>결제 정보 작성</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<!-- <form action="reserveProc.jsp" method="post"> -->

<table style="border-collapse:collapse;" cellpadding="10px" rules="rows" frame="hsides">
<tr>
<th colspan="2">결제 정보 작성 - 신용카드 결제만 가능합니다.</th>
</tr>
<tr>
<td>카드종류</td>
<td>
<select>
<option value="카드를 선택하세요">카드를 선택하세요</option>
<option value="카드를 선택하세요">BC카드</option>
<option value="카드를 선택하세요">국민카드</option>
<option value="카드를 선택하세요">신한카드</option>
<option value="카드를 선택하세요">삼성카드</option>
<option value="카드를 선택하세요">현대카드</option>
</select>
</td>
</tr>
<tr>
<td>카드번호</td>
<td><input type="text" maxlength="4" size="5" required>-<input type="text" maxlength="4" size="5" required>-<input type="password" maxlength="4" size="5" required>-<input type="password" maxlength="4" size="5" required></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" maxlength="2" size="2" required>**</td>
</tr>
<tr>
<td>유효기간</td>
<td><input type="text" maxlength="2" size="2">월<input type="text" maxlength="2" size="2" required>년</td>
</tr>
<tr>
<td>법적생년월일<br>(6자리)</td>
<td><input type="password" maxlength="6" size="7" required>-* * * * * * *</td>
</tr>
<tr>
<td colspan="2" style="text-align:center">
<input type="submit" value="결제하기" class="button"></input>

</td>
</tr>
</table>


<!-- 
</form> -->
</body>
</html>
