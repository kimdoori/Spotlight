<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/reserve.css">

 
<title>Insert title here</title>
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width:460px;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>
<%! int ticketCnt=3;
	String sheetStr="";
%>
<%
request.setCharacterEncoding("UTF-8");
	String movieName = request.getParameter("movieName");
	String selectedDate = request.getParameter("selectedDate");
	String selectedTime = request.getParameter("selectedTime");
	System.out.println("여기선? "+ selectedTime);
	%>
<script>
function calculate(){
	var adult = document.getElementById("adult");
	var teen = document.getElementById("teen");
	
	var pattern = /[0-5]/;
	if(!pattern.test(parseInt(adult.value)) || !pattern.test(parseInt(teen.value)) || parseInt(adult.value)>5 || parseInt(teen.value)>5){
		adult.value=0;
		teen.value=0;
		document.getElementById("numOfReserve").value="";
		return;
	}

	var movieRatesStr = adult.value+" X 10000 + " + teen.value +" X 8000 = ";
	var movieRates = parseInt(adult.value) * 10000 + parseInt(teen.value)*8000;
	document.getElementById("numOfReserve").value =movieRatesStr+ movieRates;
	var cnt = document.getElementById("ticketCnt").value= parseInt(adult.value)+parseInt(teen.value);
	if(cnt==0)
		$(":checkbox:not(:checked)").attr("disabled", "disabled");
	else
        $("input[name=chk]:checkbox").removeAttr("disabled");

		
}


$(document).ready(function() {
	
	
    $("input[name=chk]:checkbox").change(function() {// 체크박스들이 변경됬을때
    var cnt = $("#ticketCnt").val();
    if(cnt<=$("input[name=chk]:checkbox:checked").length ) {
            $(":checkbox:not(:checked)").attr("disabled", "disabled");
        } else {
            $("input[name=chk]:checkbox").removeAttr("disabled");
        }
    });
 
    $("#selCnt").change(function() {
        $("input[name=chk]:checkbox").removeAttr("checked");
        $("input[name=chk]:checkbox").removeAttr("disabled");
    });
});
</script>
</head>
<body>
<form oninput="calculate()" method="post" action="reserveProc.jsp?movieName=<%=movieName %>&selectedDate=<%=selectedDate %>&selectedTime=<%=selectedTime %>" >

<table id="sheet-table">

<tr>
<td>

일반
<input id="adult" type="number" min="0" max="5" step="1" value="0">
청소년
<input id="teen" type="number" min="0" max="5" step="1" value="0">

<output id="numOfReserve"></output><output id="ticketCnt" hidden="true">0</output>


</td>
</tr>
<tr>
<td>
<div style="text-align:center;background:rgba(255,255,255,0);">
<%
	
	
	
	 BufferedReader reader = null;
	 String[] sheet=null;
	try{
		String filePath=application.getRealPath("/WEB-INF/movie/"+selectedDate+"/"+movieName+"/"+selectedTime+".txt");
		//out.println(filePath);
		reader = new BufferedReader(new FileReader(filePath));
		
		StringBuffer sb = new StringBuffer();
		while(true){
			String str = reader.readLine();
			if(str == null )break;
			
			sb.append(str);
		}
		sheet = sb.toString().split(" ");
		
	}catch(Exception e){
		out.println("지정된 파일을 찾을 수 없습니다.");
	} 
	
	
	out.println("<div class='sheet-num'></div>");

	int count=0;
	for(int i=0;i<11;i++){
		if(i>0)
			out.println("<div class='sheet-num'>"+(char)('A'+i-1)+"</div>");
		
		for(int j=0;j<10;j++){
			if(i==0){
				out.println("<div class='sheet-num'>"+(j+1)+"</div>");
				continue;
			}

			if(sheet[count].equals("0")){//예매된 좌석
				out.println("<input name='alreadychk' type='checkbox' class='none-sheet' disabled></input>");
				count++;
			}
			else{
				out.println("<input name='chk' type='checkbox' value="+(char)('A'+i-1)+(j+1)+" class='sheet' disabled></input>");
				count++;
			}
			
			
		}
		out.print("<br>");
	}

%>
</div>
</td>
</tr>

</table>

TODO:: CHECK BOX 값 넘기기 => 넘겨서 파일에 저장  => 나의 예매 목록에 띄우기 
<!-- Modal -->
  <div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
     <jsp:include page="reserve.jsp" flush="false"/>
  </div>

</div>
</form>
<button id="goReserve">예매하기</button>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("goReserve");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
	
    modal.style.display = "block";

    
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<script>
/* var next = document.getElementById("next");
next.onclick=function (){
	window.open('reserve.jsp','window_name','width=460,height=380,location=no,status=no,scrollbars=yes');
} */

</script>
</body>
</html>

