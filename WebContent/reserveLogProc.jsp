<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 - 결과화면</title>
<link rel="stylesheet" href="css/ticket.css">
<link rel="stylesheet" href="css/input.css">




<style>
/* Scrollbar styles */
.review-container{
 overflow:scroll;
 height:400px;
 background-color:rgb(0,0,0,0.5);
 border-top:1px solid white;
 border-bottom:1px solid white;
 
 }
 
.review-container::-webkit-scrollbar{
width: 12px;
height: 12px;
}

.review-container::-webkit-scrollbar-track {
border: 0px solid yellow;
border-radius: 5px;
}

.review-container::-webkit-scrollbar-thumb {
background: yellow;  
border-radius: 5px;
}

.review-container::-webkit-scrollbar-thumb:hover {
background: #88ba1c;  
}
 
</style>

</head>

<body>
<div class="date-select">
<select>
	<option value="2018">2018</option>
</select>

<select>
	<option value="05">05</option>
</select>

<select>
	<option value="01">01</option>
</select>
<img src="webImage/searchIcon.png">
</div>
<div class="review-container">
		<%
			
		%>

		<%
			BufferedReader reader = null;

			try {
				String filepath = application.getRealPath("/WEB-INF/reserve/");

				File dirFile = new File(filepath);
				File[] fileList = dirFile.listFiles();
				int reviewCnt=0;
				for (File tempFile : fileList) {
					if (tempFile.isFile()) {
						reviewCnt++;
						String tempPath = tempFile.getParent();
						String tempFileName = tempFile.getName();
						System.out.println("Path=" + tempPath);
						System.out.println("FileName=" + tempFileName);
						/*** Do something withd tempPath and temp FileName ^^; ***/
						reader = new BufferedReader(new FileReader(filepath + tempFileName));

						String  title = reader.readLine();
						String  selectedDate= reader.readLine();
						String  selectedTime= reader.readLine();
						StringBuffer sheet = new StringBuffer();
						
						
						
						while (true) {
							String str = reader.readLine();
							if (str == null)
								break;
							sheet.append(str);

						}
						out.print("<p><div class='cardWrap'><div class='card cardLeft'><h1>Spotlight <span>Cinema</span></h1>"
								+"<div class='title'><h2>"+title+"</h2><span>movie</span></div>"
								+"<div class='name'><h2>"+selectedDate+"</h2><span>상영 날짜</span></div>"
								+"<div class='seat'><h2>"+sheet+"</h2><span>seat</span>"
								+"</div><div class='time'><h2>"+selectedTime.replace("_"," : ")+"</h2><span>상영 시간</span>"
								+"</div></div><div class='card cardRight'><div class='eye'></div>"
								+"<div class='number'><h3>"+sheet.substring(0,sheet.indexOf(" "))+"</h3><span>seat</span></div>"
								+"<div class='barcode'></div></div></div></p>");
						
						/* out.print("<li class='item'><div class='card'><div class='title'><h4><b>"
						+title+"</b></h4></div><div class='container'><p>"
						+contents+"</p></div><div class='writer'>"
						+"<div  style='width:50%;display:inline-block;'>"
						+w_time+"</div><div style='width:50%;display:inline-block;'><b>"+writer+"</b></div></div></div></li>");
						
					    if(reviewCnt%4==0)
					    	out.print("<br>");
 */					}

				}

			} catch (Exception e) {
				out.println("파일을 읽을 수 없습니다.");
			}
		%>
	
	<%-- 이름 : <%=name %><br>
제목 : <%=title %><br>
내용 : <%=content %><br>
 --%>
 </div>
 <!-- <div style="text-align:center;margin:10px;"><button onclick="location='reviewWrite.jsp'">리뷰 남기기</button></div>
 -->

<!-- <button onclick="location='reviewWrite.jsp'">리뷰남기기</button>
 -->
	<%-- <ul>
		<%
			
		%>

		<%
			BufferedReader reader = null;

			try {
				String filepath = application.getRealPath("/WEB-INF/review/");

				File dirFile = new File(filepath);
				File[] fileList = dirFile.listFiles();
				int reviewCnt=0;
				for (File tempFile : fileList) {
					if (tempFile.isFile()) {
						reviewCnt++;
						String tempPath = tempFile.getParent();
						String tempFileName = tempFile.getName();
						System.out.println("Path=" + tempPath);
						System.out.println("FileName=" + tempFileName);
						/*** Do something withd tempPath and temp FileName ^^; ***/
						reader = new BufferedReader(new FileReader(filepath + tempFileName));
						
						String  w_time= reader.readLine();
						String  writer= reader.readLine();
						StringBuffer contents = new StringBuffer();
						
						while (true) {
							String str = reader.readLine();
							if (str == null)
								break;
							contents.append(str);

						}
						out.print("<li class='item'><div class='card'><div class='container'><h4><b>"+writer+"</b></h4> <p>"+w_time+"<br>"+ contents+"</p> </div></div></li>");
					    if(reviewCnt%4==0)
					    	out.print("<br>");
					}

				}

			} catch (Exception e) {
				out.println("파일을 읽을 수 없습니다.");
			}
		%>
	</ul> --%>

</body>
</html>
