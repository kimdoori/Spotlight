<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reserve.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String selectedMovie = request.getParameter("selectedMovie");
	selectedMovie = selectedMovie.replaceAll("[:_!-+=~/?*()<>&]", "").replaceAll(" ","");
	String selectedDate = request.getParameter("selectedDate");
	String dailyfile = request.getParameter("dailyfile");
	
/* 	System.out.print("왜안되지"+dailyfile);

out.println(selectedMovie);
out.println(selectedDate);
out.println(dailyfile); */

%>


<%
			BufferedReader reader = null;

			try {
				String filepath = application.getRealPath("/WEB-INF/movie/"+selectedDate+"/"+selectedMovie);
				System.out.println(filepath);

				File dirFile = new File(filepath);
				File[] fileList = dirFile.listFiles();
				
				for (File tempFile : fileList) {
					if(tempFile.isFile()){
						String tempFileName = tempFile.getName();
						System.out.println(tempFileName);
						reader = new BufferedReader(new FileReader(filepath +"/"+ tempFileName));
						String movieTime = tempFileName.replaceAll(".txt","").replaceAll("_"," : ");
						String  restSheet= reader.readLine();
						/* out.println("<div><p>"+movieTime+"</p>"+restSheet+"</div>"); */
						out.print("<div class='movieList'>"+movieTime+"<br>잔여좌석 "+restSheet+"</div><br>");
						/* String  writer= reader.readLine();
						StringBuffer contents = new StringBuffer();
						
						while (true) {
							String str = reader.readLine();
							if (str == null)
								break;
							contents.append(str);

						} */
						
						
				/* 		reader = new BufferedReader(new FileReader(filepath));
					while(true){
						String str = reader.readLine();
						if(str==null) break;
						out.println(str+"<br>");
						
					} */
					}
				}
				
				
				
				
				

			} catch (Exception e) {
				out.println("아직 상영 정보가 제공되지 않습니다.");
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
</body>
</html>