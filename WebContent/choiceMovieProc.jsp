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
<script>

</script>
</head>
<body>
<% String id = (String)session.getAttribute("id");
		if(id == null || id.equals("")){%>
		<jsp:forward page="framePage.jsp">
			<jsp:param name="CONTENTPAGE" value="signin.jsp"/>
		</jsp:forward>
		<%
		}
%>
<script>
var movieName="";
var selectedDate="";
var selectedTime="";



</script>
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

<table id="movie-table" border="1px">
<tr>
<th id="tabel-title" width="30%">영화</th>
<th id="tabel-title" width="37%">날짜</th>
<th id="tabel-title">시간</th>
</tr>
<tr>
<td id="movie">
<div class="movie-container">
<%! 
Date date = new Date();
%>


<%

try {//movie/20180510/어벤져스워/12_30.txt
	//20180510파일이 있는 지 없다면 20180510/list.txt 생성
	String filepath = application.getRealPath("/WEB-INF/movie/");
	System.out.println("movie 파일 경로"+filepath); 
	SimpleDateFormat formatter=new SimpleDateFormat("yyyyMMdd");
	String daily=formatter.format(date);
	String dailyfile=daily+"/list.txt";
	
	out.print("<script>var dailyfile = "+formatter.format(date)+";</script>");
	
	BufferedReader reader = null;
	boolean isExist  = false;//오늘의 파일이 존재하는지
	
	File dirFile = new File(filepath);
	File[] fileList = dirFile.listFiles();
	
	for (File tempFile : fileList) {
		if(tempFile.getName().equals(daily)){//movie/에 오늘의 디렉토리가 있는지
			isExist=true;
			break;
		}
	}
	if(!isExist){//오늘의 디렉토리가 존재하지 않는다면

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
	
	
		//오늘의 디렉토리/list.txt 생성
		PrintWriter writer = null;
		String moviefilepath =filepath+dailyfile;
		File moviefile = new File(filepath+daily);
		 if(!moviefile.exists()){
	            //디렉토리 생성 메서드
	            moviefile.mkdirs();
	      }

		//out.println(filePath);
		writer = new PrintWriter(moviefilepath);
		writer.println(moviesStr);

		//out.println("<font color='red'><b>게시물</font>이 저장되었습니다.</b>");
		writer.flush();
		writer.close();
	
		//movie/오늘날짜/영화이름/12_30.txt 생성
				String[] hourFileName ={"07","09","12","15","17","20","22"};
				String[] minuteFileName ={"00","20","30","40"};
				int hourRandom;
				int minuteRandom;
				filepath = application.getRealPath("/WEB-INF/movie/");

				
				dailyfile=formatter.format(date)+"/list.txt";
				System.out.println("오늘의 날짜는"+dailyfile);
				reader = new BufferedReader(new FileReader(filepath + dailyfile));

				writer = null;
				String result;
				
				while (true) {
					String str = reader.readLine();
					if (str == null || str.equals(""))
						break;
					//list.txt의 영화목록의 영화 이름으로 파일만들기
						int numRandom = (int)( Math.random() * hourFileName.length-1)+1;

						for(int i=0;i<numRandom;i++){
						hourRandom = (int)( Math.random() * hourFileName.length);
						minuteRandom = (int)( Math.random() * minuteFileName.length);
						String movieFileName = str.replaceAll(".txt","").replaceAll("[:_!-+=~/?*()<>&]", "").replaceAll(" ","");
						
						moviefile = new File(filepath+"/"+daily+"/"+movieFileName);
						 if(!moviefile.exists()){
					            //디렉토리 생성 메서드
					            moviefile.mkdirs();
					      }

						//out.println(filePath);
						writer = new PrintWriter(filepath+"/"+daily+"/"+movieFileName+"/"+hourFileName[hourRandom]+"_"+minuteFileName[minuteRandom]+".txt");
						writer.printf("%d %n",100);
						
						for(int j=0;j<10;j++){
							for(int k=0;k<10;k++){
								writer.printf("%s ",(char)(j+'A')+String.valueOf(k+1));
							}
							writer.printf("%n");
						}
						writer.flush();

						//TODO : 좌석 그리기
						/* writer.printf("%s %n",user);
						writer.println(contents); */
						
						}
						
				}
				writer.flush();
			
				reader.close();
			
		

	}
	//movie div 구성
			reader = new BufferedReader(new FileReader(filepath + dailyfile));

		
			
			while (true) {
				String str = reader.readLine();
				if (str == null || str.equals(""))
					break;
				out.print("<div class='movieList'>"+str+"</div><br>");
				
			}

} catch (Exception e) {
e.printStackTrace();
}
	
	
	
	
%>



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
<button class="button" id="nextPage">좌석 선택하기</button>

<script>

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

$('#selected-date').on('DOMSubtreeModified',function(){
	selectedDate = new Date(document.getElementById("selected-date").innerHTML);
	var year = selectedDate.getFullYear();
	var month = selectedDate.getMonth()+1;
	var day = selectedDate.getDate();
	if(day < 10){
		day='0'+day;
	}
	if(month<10){
		month = '0'+month;
	}
	selectedDate = year+month+day;
	
	
	//TODO : 날짜 형식바꿔서 넘기기
	if(movieName != "")
	  document.getElementById("movie-time").src="choiceTime.jsp?selectedMovie="+movieName+"&selectedDate="+selectedDate+"&dailyfile="+dailyfile;
	})
	

	var nextButton = document.getElementById("nextPage");
	nextButton.onclick=function(){
		var time = $('#movie-time').contents().find('#timeSpan').html().toString();
		if((movieName!= ""|| movieName!=null) && (selectedDate!= "" || selectedDate!=null)&& (time!= "" || time!=null))
			location.href="choiceSheet.jsp?movieName="+movieName+"&selectedDate="+selectedDate+"&selectedTime="+time.replace(" : ","_");
		else
			alert("모든 항목을 선택해주세요.");
	}
		  
		 
	
</script>


</body>
</html>