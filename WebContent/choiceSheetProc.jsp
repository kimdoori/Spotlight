<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.sheet{
	width:20px;
	height:20px;
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
	width:20px;
	height:20px;
	background-color:white;
	margin : 1px;
	display:inline-block;
	font-size:15px;
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
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
</style>
<script>
window.onload=init;
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
}
function init(){
	var chkbox = document.getElementsByName("chk");
	var chkCnt = 0;

	for(var i=0;i<chkbox.length; i++){

		chkbox[i].onclick=count_ck(chkbox[i]);
	}
	
}
function count_ck(obj){

	var chkbox = document.getElementsByName("chk");

	var chkCnt = 0;

	for(var i=0;i<chkbox.length; i++){

		if(chkbox[i].checked){

			chkCnt++;

		}

	}

	if(chkCnt>2){

		obj.checked = false;

		return false;

	}

}


</script>
</head>
<body>
<form oninput="calculate()">
일반
<input id="adult" type="number" min="0" max="5" step="1" value="0">
청소년
<input id="teen" type="number" min="0" max="5" step="1" value="0">

<output id="numOfReserve"></output>

</form>
<div style="text-align:center">
<%
	out.println("<div class='sheet-num'></div>");

	for(int i=0;i<11;i++){
		if(i>0)
			out.println("<div class='sheet-num'>"+(char)('A'+i-1)+"</div>");
		
		for(int j=0;j<10;j++){
			if(i==0){
				out.println("<div class='sheet-num'>"+(j+1)+"</div>");
				continue;
			}

			out.println("<input name='chk' type='checkbox' class='sheet'></input>");
			
		}
		out.print("<br>");
	}

%>
</div>
<script>


</script>
</body>
</html>
