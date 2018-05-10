<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String movieName = request.getParameter("movieName");
String selectedDate = request.getParameter("selectedDate");
String selectedTime = request.getParameter("selectedTime");
String[] sheet = request.getParameterValues("chk");
System.out.println("g핫"+selectedTime);


String userId = (String) session.getAttribute("id");


PrintWriter writer = null;
String result;
 try{
	//예매시간을 이름으로 하는 파일 == > 예매 정보 저
	Date date = new Date();
	SimpleDateFormat formatter=new SimpleDateFormat("yyyyMMddhhmmss");
	String reserveDate=formatter.format(date);
	
	String reservefilePath = application.getRealPath("/WEB-INF/reserve/"+userId);
		
	File reservefile = new File(reservefilePath);
	 if(!reservefile.exists()){
            //디렉토리 생성 메서드
            reservefile.mkdirs();
      }
	
	
	writer = new PrintWriter(reservefilePath+"/"+reserveDate+".txt");
	writer.printf("%s %n",movieName);
	writer.printf("%s %n",selectedDate);
	writer.printf("%s %n",selectedTime);
	for(int i=0;i<sheet.length;i++){
		writer.printf("%s %n",sheet[i]);
	}
		
	writer.flush();
	
	//좌석예매로 체크하고 전체좌석수저장
	String sheetfilePath = application.getRealPath("/WEB-INF/movie/"+selectedDate+"/"+movieName+"/"+selectedTime+".txt");
	System.out.println("왜 안되는 거지 ? "+sheetfilePath);
	BufferedReader reader = null;
	
	reader = new BufferedReader(new FileReader(sheetfilePath));

	int restNum =Integer.valueOf(reader.readLine().replaceAll(" ", ""));
	System.out.println("영화좌석 "+restNum);
	StringBuffer sb = new StringBuffer();
	while (true) {
		String str = reader.readLine();
		if (str == null)
			break;
		sb.append(str+"\n");

	}
	
	String restSheet = sb.toString();
	for(int j=0;j<sheet.length;j++){
		restSheet = restSheet.replaceAll(sheet[j],"0");
	}
	
	//out.println(filePath);
	writer = new PrintWriter(sheetfilePath);
	writer.printf("%s %n",restNum - sheet.length);
	writer.printf("%s",restSheet);	
	writer.flush();
	
	reader.close();
	result="ok";
}catch(Exception e){
	e.printStackTrace();
	System.out.println("오류발생");
	result="fail";
}
 
out.println("<script>alert('예매가 완료되었습니다.');location.href='reserveLog.jsp';</script>");


%>
</body>
</html>