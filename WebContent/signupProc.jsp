<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");


		String contentpage = request.getParameter("CONTENTPAGE");

		String inputID = request.getParameter("id");
		String inputPw = request.getParameter("pw");
		String inputName = request.getParameter("name");
		
		
		StringBuffer userInfo = new StringBuffer();

		BufferedReader reader = null;
		boolean isExist = false;
		try {
			String filepath = application.getRealPath("/WEB-INF/member/");
			System.out.println(filepath);

			File dirFile = new File(filepath);
			File[] fileList = dirFile.listFiles();
			int reviewCnt = 0;
			for (File tempFile : fileList) {
				if (tempFile.isFile()) {
					String tempFileName = tempFile.getName();
					if (tempFileName.equals(inputID + ".txt")) {
						isExist = true;
						reader = new BufferedReader(new FileReader(filepath + tempFileName));

					
						while (true) {
							String str = reader.readLine();
							if (str == null)
								break;
							userInfo.append(str);

						}
						break;
					}
				}

			}

		} catch (Exception e) {
			out.println("파일을 읽을 수 없습니다.");
		}

		if (!isExist) {//존재하지 않음
			out.println("<script>alert('[가입]');</script>");
			String filePath = application.getRealPath("/WEB-INF/member/"+inputID+".txt");

			FileOutputStream output = new FileOutputStream(filePath,true);
			OutputStreamWriter writer = new OutputStreamWriter(output,"UTF-8");
			BufferedWriter fileOut = new BufferedWriter(writer);
	
			String result;
			try{
				//out.println(filePath);
				fileOut.write(inputPw);
				fileOut.newLine();
				fileOut.write(inputName);


				fileOut.flush();
				fileOut.close();
				result="ok";
			}catch(Exception e){
				out.println("오류발생");
				result="fail";
			}
			
			response.sendRedirect("signupResult.jsp?send="+result);
			
		

		}else{
			out.println("<script>alert('[이미 존재하는 회원입니다.]');</script>");
			%>
			<jsp:forward page="framePage.jsp">
		<jsp:param name="CONTENTPAGE" value="signup.jsp" />
			</jsp:forward>
			<%
			
		}
		%>



</body>
</html>
