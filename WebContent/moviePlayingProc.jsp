<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.card {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    width: 40%;
}

.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
    padding: 2px 16px;
}
</style>
<body>
<div class="card">
  <img src="img_avatar.png" alt="Avatar" style="width:100%">
  <div class="container">
    <h4><b>John Doe</b></h4> 
    <p>Architect & Engineer</p> 
  </div>
</div>


<center><img src="img/img5.jpg"></center>
<%
BufferedReader reader = null;

try{
	String filePath=application.getRealPath("/WEB-INF/little.txt");
	//out.println(filePath);
	reader = new BufferedReader(new FileReader(filePath));
	
	
	while(true){
		String str = reader.readLine();
		if(str == null )break;
		out.println(str+"<br>");
		
	}
}catch(Exception e){
	out.println("지정된 파일을 찾을 수 없습니다.");
}



%>
</body>
</html>
