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


</head>

<body>
<!-- <button onclick="location='reviewWrite.jsp'">리뷰남기기</button>
 -->
<div class="cardWrap">
  <div class="card cardLeft">
    <h1>Startup <span>Cinema</span></h1>
    <div class="title">
      <h2>How I met your Mother</h2>
      <span>movie</span>
    </div>
    <div class="name">
      <h2>Vladimir Kudinov</h2>
      <span>name</span>
    </div>
    <div class="seat">
      <h2>156</h2>
      <span>seat</span>
    </div>
    <div class="time">
      <h2>12:00</h2>
      <span>time</span>
    </div>
    
  </div>
  <div class="card cardRight">
    <div class="eye"></div>
    <div class="number">
      <h3>156</h3>
      <span>seat</span>
    </div>
    <div class="barcode"></div>
  </div>

</div>
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
