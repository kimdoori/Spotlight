<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 - 입력 화면</title>
</head>
<body>
<h2>글쓰기</h2>
<form action="reviewWriteProc.jsp" method="post">
이름 : <input type="text" name="name"><br>
제목 : <input type="text" name="title"><br>
<!-- 게시판은 주로 post방식으로 -->
<textarea rows="5" cols="30" name="content"></textarea><br>
<input type="submit" value="저장"><br>
<input type="reset" value="초기화"><br>


</form>

</body>
</html>
