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
System.out.println("g��"+selectedTime);


String userId = (String) session.getAttribute("id");


PrintWriter writer = null;
String result;
 try{
	//���Žð��� �̸����� �ϴ� ���� == > ���� ���� ��
	Date date = new Date();
	SimpleDateFormat formatter=new SimpleDateFormat("yyyyMMddhhmmss");
	String reserveDate=formatter.format(date);
	
	String reservefilePath = application.getRealPath("/WEB-INF/reserve/"+userId);
		
	File reservefile = new File(reservefilePath);
	 if(!reservefile.exists()){
            //���丮 ���� �޼���
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
	
	//�¼����ŷ� üũ�ϰ� ��ü�¼�������
	String sheetfilePath = application.getRealPath("/WEB-INF/movie/"+selectedDate+"/"+movieName+"/"+selectedTime+".txt");
	System.out.println("�� �ȵǴ� ���� ? "+sheetfilePath);
	BufferedReader reader = null;
	
	reader = new BufferedReader(new FileReader(sheetfilePath));

	int restNum =Integer.valueOf(reader.readLine().replaceAll(" ", ""));
	System.out.println("��ȭ�¼� "+restNum);
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
	System.out.println("�����߻�");
	result="fail";
}
 
out.println("<script>alert('���Ű� �Ϸ�Ǿ����ϴ�.');location.href='reserveLog.jsp';</script>");


%>
</body>
</html>