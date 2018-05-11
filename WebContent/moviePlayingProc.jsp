<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.net.URL,java.net.URLEncoder"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/card.css">
</head>

<body>


<ul>
<!-- 
<div id="location_href"></div>
<center><img src="img/img5.jpg"></center> -->
<%
/* BufferedReader reader = null;

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
} */


 try {
	 String apiURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=4cb7fbd158874cb7e07ef7d5124695fc&targetDt=20180503"; // json 결과
	    

	    //https://openapi.naver.com/v1/search/movie.json
	    //https://openapi.naver.com/v1/search/movie.xml
	    URL url = new URL(apiURL);
	    HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    con.setRequestMethod("GET");
	    
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
	   // out.println(responseStr.toString() );
	
	    
	  JSONParser jsonParser = new JSONParser();
     //JSON데이터를 넣어 JSON Object 로 만들어 준다.
     JSONObject jsonObject = (JSONObject) jsonParser.parse(responseStr.toString());
     
     JSONObject boxOfficeResult = (JSONObject) jsonObject.get("boxOfficeResult");
     JSONArray dailyBoxOfficeList = (JSONArray) boxOfficeResult.get("dailyBoxOfficeList");

     
     for(int i=0; i<dailyBoxOfficeList.size(); i++){

         //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
         JSONObject movieObject = (JSONObject) dailyBoxOfficeList.get(i);
         //JSON name으로 추출
        /*  out.println("영화명 : "+movieObject.get("movieNm")); 
         out.println("영화코드 : "+movieObject.get("movieCd")); 
         out.println("박스오피스 순위 : "+movieObject.get("rank"));
         out.println("전일대비 순위의 증감분 : "+movieObject.get("rankInten"));
         out.println("랭킹에 신규진입여부 : "+movieObject.get("rankOldAndNew")); 
         out.println("영화의 개봉일 : "+movieObject.get("openDt")); 
         out.println("해당일의 매출액 : "+movieObject.get("salesAmt")); 
         out.println("누적매출액 : "+movieObject.get("salesAcc")); 
         out.println("누적관객수 : "+movieObject.get("audiAcc")+"<br>");  */
         //(movieObject.get("rankOldAndNew").equals("OLD")) ? "A": "NEW"
        		 
       if(i%4==0){
        	out.print( "<br>");
        }
         //<img src='images/어벤져스인피니티워.jpg'>
         String name= movieObject.get("movieNm").toString(); 
         name = name.replaceAll("[:_!-+=~/?*()<>&]", "").replaceAll(" ","");
         out.println("<li class='item'><div class='card'>"+
         "<img src='images/"+name+".jpg' onerror=\"this.src='images/poster.jpg'\" style='width:100%' >"+
         "<div class='container'><h4><b>"+movieObject.get("movieNm")+"</b></h4> <p>"+movieObject.get("rank")+"위<br>"+ movieObject.get("openDt") +" 개봉</p> </div></div></li>");
       
      
     } 
  
   
 
  } catch (ParseException e) {
     // TODO Auto-generated catch block
     e.printStackTrace();
 } 


%>
</ul>
</body>
</html>
