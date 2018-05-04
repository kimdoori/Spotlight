<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.sheet{
	width:15px;
	height:15px;
	background-color:rgb(110, 109, 109);;
	margin : 1px;
	display:inline-block;
	border-radius: 3px;

}
.sheet:hover {
	background-color:gray;
    color:black;
    
}
.sheet[onclick]{
background-color:gray;
    color:black;
}
.sheet-num{
	width:15px;
	height:15px;
	background-color:white;
	margin : 1px;
	display:inline-block;
	font-size:10px;
	 text-align: center;
	

}
li.on{
color:red;
}
</style>
<script>
 $(function(){
  var sBtn = $("ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
  sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
   sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
   $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
  })
 })
</script>
<style>
 ul {
  list-style: none;
  margin-left: 0;
 }
 ul > li {
  display: inline-block;
 }
 ul > li > a {
  color: #fff;
  text-decoration: none;
  display: block;
  padding: 5px 10px;
  background-color: #888;
 }
 ul > li:hover > a,
 ul > li:focus > a,
 ul > li:active > a,
 ul > li.active >a {
  color: yellow;
  background-color: #000;
 }
</style>
</head>
<body>

<ul>
 <li><a href="#;">Btn01</a></li>
 <li><a href="#;">Btn02</a></li>
 <li><a href="#;">Btn03</a></li>
 <li><a href="#;">Btn04</a></li>
 <li><a href="#;">Btn05</a></li>
 <li><a href="#;">Btn06</a></li>
</ul>

<%
	out.println("<div class='sheet-num'></div>");

	for(int i=0;i<6;i++){
		if(i>0)
			out.println("<div class='sheet-num'>"+(char)('A'+i-1)+"</div>");
		
		for(int j=0;j<5;j++){
			if(i==0){
				out.println("<div class='sheet-num'>"+(j+1)+"</div>");
				continue;
			}

			out.println("<div class='sheet'></div>");
			
		}
		out.print("<br>");
	}

%>
<script>


</script>
</body>
</html>
