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
String sheet = request.getParameter("sheet");
System.out.println(sheet);
System.out.println("��..");

String userId = (String) session.getAttribute("id");


PrintWriter writer = null;
String result;
/* try{
	//���Žð��� �̸����� �ϴ� ���� == > ���� ���� ��
	Date date = new Date();
	SimpleDateFormat formatter=new SimpleDateFormat("yyyyMMddhhmmss");
	String reserveDate=formatter.format(date);
	String reservefilePath = application.getRealPath("/WEB-INF/reserve/"+date+".txt");
	writer = new PrintWriter(reservefilePath);
	writer.printf("%s %n",movieName);
	writer.printf("%s %n",selectedDate);
	writer.printf("%s %n",selectedTime);
	
	
	writer.println(contents);
	
	writer.flush();
	
	//�¼����ŷ� üũ�ϰ� ��ü�¼�������
	String sheetfilePath = application.getRealPath("/WEB-INF/movie/"+selectedDate+"/"+movieName+"/"+selectedTime+".txt");
	//out.println(filePath);
	writer = new PrintWriter(filePath);
	writer.printf("%s %n",w_time);
	writer.printf("%s %n",user);
	writer.println(contents);
	
	writer.flush();
	result="ok";
}catch(Exception e){
	out.println("�����߻�");
	result="fail";
}
 */
out.println("<script>alert('���Ű� �Ϸ�Ǿ����ϴ�.');location.href='myReserveLog.jsp';</script>");


%>
</body>
</html>