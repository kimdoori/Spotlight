<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.URL,java.net.URLEncoder,java.net.HttpURLConnection,java.io.InputStreamReader,java.io.BufferedReader"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function a(){
document.getElementById("location_href").innerHTML = location.href;
}
window.onload=a;
</script>
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

<div id="location_href"></div>
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


//TODO:여기부터
String clientId = "aAe8KLr6jPG0HEiZlRwH";//애플리케이션 클라이언트 아이디값";
String clientSecret = "UtjxoSWJCk";//애플리케이션 클라이언트 시크릿값";
try {
    String text = URLEncoder.encode("display=50&genre=1&country=KR&yearfrom=2018", "UTF-8");
    
    //String apiURL = "https://openapi.naver.com/v1/search/movie.json"; // json 결과\
    String apiURL = "https://openapi.naver.com/v1/search/movie.xml?query="+text; // json 결과
    

    //https://openapi.naver.com/v1/search/movie.json
    //https://openapi.naver.com/v1/search/movie.xml
    URL url = new URL(apiURL);
    HttpURLConnection con = (HttpURLConnection)url.openConnection();
    con.setRequestMethod("GET");
    con.setRequestProperty("X-Naver-Client-Id", clientId);
    con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
    int responseCode = con.getResponseCode();
    BufferedReader br;
    if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
    } else {  // 에러 발생
    	System.out.println(responseCode);
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
    }
    String inputLine;
    StringBuffer responseStr = new StringBuffer();
    while ((inputLine = br.readLine()) != null) {
    	responseStr.append(inputLine);
    }
    br.close();
    System.out.println(responseStr.toString());
} catch (Exception e) {
    System.out.println(e);
}

%>



</body>
</html>
