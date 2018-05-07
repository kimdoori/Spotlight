<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
.selected{
	background-color:red;
}

</style>
<body>
<div style="margin-top:10px;">
    <div class="optionsecoptions">
        &nbsp;&nbsp;Computers
    </div>
    <div class="optionsecoptions" style="top:151px;">
        &nbsp;&nbsp;Electronics
    </div>
    <div class="optionsecoptions" style="top:212px;">
        &nbsp;&nbsp;Mechanical
    </div>
    <div class="optionsecoptions" style="top:273px;">
        &nbsp;&nbsp;Electrical
    </div>
</div>
<a href="#"> Confirm </a>

<script>
var x = document.getElementsByClassName('optionsecoptions')
for (var i = 0; i < x.length; i++) {
    x[i].addEventListener("click", function(){

    var selectedEl = document.querySelector(".selected");
    if(selectedEl){
        selectedEl.classList.remove("selected");
    }
    this.classList.add("selected");

    }, false);;
}
</script>
</body>
</html>