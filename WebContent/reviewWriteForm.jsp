<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 - 입력 화면</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<h2>글쓰기</h2>
<!-- <form action="reviewWriteProc.jsp" method="post">
이름 : <input type="text" name="name"><br>
제목 : <input type="text" name="title"><br>
게시판은 주로 post방식으로
<textarea rows="5" cols="30" name="content"></textarea><br>
<input type="submit" value="저장"><br>
<input type="reset" value="초기화"><br>


</form> -->

<div class="review-page">
  <div class="form">
    <table width="100%">
    <tr>
    
    <td width="400px" style="padding:45px;">
    <form class="login-form"  action="reviewWriteProc.jsp" method="post" class="login">
    <input hidden="true">
      <input type="text" name="title" required placeholder="title"/>
		<textarea rows="5" cols="30" name="content" placeholder="contents"></textarea><br>
     
     <input type="submit" class="button" value="작성하기">
    </form>
    </td>
   
    </tr>
  
    </table>
  </div>
</div>

</body>
</html>
