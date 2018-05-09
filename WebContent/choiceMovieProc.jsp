<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%@page import="java.util.Date"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" href="css/reserve.css">
<style>
/* Scrollbar styles */
.movie-container{
 overflow:scroll;
 height:400px;
 background-color:rgb(0,0,0,0);
 border-top:1px solid white;
 border-bottom:1px solid white;
 
 }
 
.movie-container::-webkit-scrollbar{
width: 12px;
height: 12px;
}

.movie-container::-webkit-scrollbar-track {
border: 0px solid yellow;
border-radius: 5px;
}

.movie-container::-webkit-scrollbar-thumb {
background: yellow;  
border-radius: 5px;
}

.movie-container::-webkit-scrollbar-thumb:hover {
background: #88ba1c;  
}
 
</style>

</head>
<body>

<%-- <%!

String getDailyMovie(){


//https://openapi.naver.com/v1/search/movie.json
//https://openapi.naver.com/v1/search/movie.xml
try{
String apiURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=4cb7fbd158874cb7e07ef7d5124695fc&targetDt=20180503"; // json 결과

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

StringBuffer movies = new StringBuffer();
for(int i=0; i<dailyBoxOfficeList.size(); i++){

 //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
 JSONObject movieObject = (JSONObject) dailyBoxOfficeList.get(i);
 //JSON name으로 추출
 movies.append(movieObject.get("movieNm").toString()+"\n"); 
 //name = name.replaceAll("[:_!-+=~/?*()<>&]", "").replaceAll(" ","");

 //<img src='images/어벤져스인피니티워.jpg'>
 
 

} 
return movies.toString();




} catch (Exception e) {
// TODO Auto-generated catch block
e.printStackTrace();

}
return null;
}
%> --%>
<form onchange="getSelectedMovie()">
<table id="movie-table" border="1px">
<tr>
<th id="tabel-title" width="30%">영화</th>
<th id="tabel-title" width="37%">날짜</th>
<th id="tabel-title">시간</th>
</tr>
<tr>
<td id="movie">
<div class="movie-container">
<%

try {
	String filepath = application.getRealPath("/WEB-INF/movie/");

	Date date = new Date();
	
	SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
	String dailyfile=formatter.format(date)+".txt";
	
	BufferedReader reader = null;
	boolean isExist  = false;
	
	File dirFile = new File(filepath);
	File[] fileList = dirFile.listFiles();
	for (File tempFile : fileList) {
		if (tempFile.isFile()) {
			String tempFileName = tempFile.getName();
			if(tempFileName.equals(dailyfile)){
				isExist=true;
				break;
			}
		}
	}
	if(!isExist){
	//TODO:api에서 가ㅕㅈ오
	//	String movies = getDailyMovie();
		String moviesStr="";//지우기

	//지우기
		try{
			String apiURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=4cb7fbd158874cb7e07ef7d5124695fc&targetDt=20180503"; // json 결과

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

			StringBuffer movies = new StringBuffer();
			for(int i=0; i<dailyBoxOfficeList.size(); i++){

			 //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
			 JSONObject movieObject = (JSONObject) dailyBoxOfficeList.get(i);
			 //JSON name으로 추출
			 movies.append(movieObject.get("movieNm").toString()+"\n"); 
			 //name = name.replaceAll("[:_!-+=~/?*()<>&]", "").replaceAll(" ","");

			 //<img src='images/어벤져스인피니티워.jpg'>
			 
			 

			} 
			moviesStr =  movies.toString();




			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			}
		
		//지우기
	
	
	
		PrintWriter writer = null;
		String moviefilepath =filepath+dailyfile;

		//out.println(filePath);
		writer = new PrintWriter(moviefilepath);
		writer.println(moviesStr);

		//out.println("<font color='red'><b>게시물</font>이 저장되었습니다.</b>");
		writer.flush();
		writer.close();
	}
	
		reader = new BufferedReader(new FileReader(filepath + dailyfile));

	
		
		while (true) {
			String str = reader.readLine();
			if (str == null || str.equals(""))
				break;
			out.print("<div class='movieList'>"+str+"</div><br>");
			
		}
	   
	
		reader.close();
			
		

	

} catch (Exception e) {
e.printStackTrace();
}
	
	
	
	
%>


<script>
var movieName="";
var x = document.getElementsByClassName('movieList')
for (var i = 0; i < x.length; i++) {
    x[i].addEventListener("click", function(){

    var selectedEl = document.querySelector(".selected");
    if(selectedEl){
        movieName= "";

        selectedEl.classList.remove("selected");
    }
    movieName= this.innerHTML;
    this.classList.add("selected");

    }, false);
}
</script>
</div>
</td>

<td>
<jsp:include page="calendar.jsp" flush="false"/>
</td>

<td>
<iframe src="" id="movie-time" width="100%" height="400px"></iframe>
</td>
</tr>
</table>
<button onclick="location='choiceSheet.jsp'">좌석 선택하기</button>
</form>


<script>
$('#selected-date').on('DOMSubtreeModified',function(){
	alert(document.getElementById("selected-date").format("YYYYmmdd")));
	//TODO : 날짜 형식바꿔서 넘기기
	if(movieName != "")
	  document.getElementById("movie-time").src="choiceTime.jsp?selectedMovie="+movieName+"&selectedDate="+document.getElementById("selected-date").toDateString();
	})
	

</script>
</body>
</html>