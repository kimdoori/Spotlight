<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body,html{
padding:0px;
margin:0px;
}

.top-menu-container {
    position: relative;
    display: inline-block;
    width:300px;
}

.top-menu-btn { 
    background-color: black;
    color: white;
    padding: 16px;
    font-size: 20px;
    border: none;
    cursor: pointer;
}

.top-menu-btn a { 
    color: white;
    text-decoration: none;
}

.top-menu-detail {
    display: none;
    position: absolute;
    right: 0;
    background-color: rgb(37, 37, 37);
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.top-menu-detail a {
    color: gray;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.top-menu-detail a:hover {
	background-color: #f1f1f1;
    
}

.top-menu-container:hover .top-menu-detail {
    display: block;
    	
    
}

.top-menu-container:hover .top-menu-btn {
    text-shadow:3px 3px 5px yellow;
/*    background-color: rgb(24, 24, 23);
*/  
}
 
 
#top{
  /* 	position: fixed; */
	background-color:black;
	margin: 0px;
  	width: 100%;
  	marin-top:0px;
}

.area {
  margin: 0;
  padding: 0;
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -moz-flex;
  display: -webkit-flex;
  display: flex;
  justify-content: space-between;
  list-style: none;
}

.area:before {
  display: inline-block;
  width: 1px;
  content: '';
}

.area:after {
  display: inline-block;
  width: 1px;
  content: '';
}

.item {
  display: inline-block;
  color: #fff;
  text-align: center;
  line-height: 30px;
}

</style>
</head>
<body>
<div id="top">

 <ul class="area">
<li class="item">
	<div class="top-menu-container" style="float:left;">
		<button class="top-menu-btn"><a href="index.jsp">HOME</a></button>
	</div>
</li>
<li class="item">
<div class="top-menu-container">
  <button class="top-menu-btn">MOVIE</button>
  <div class="top-menu-detail" style="left:0;">
    <a href="moviePlaying.jsp">상영중인 영화</a>
    <a href="review.jsp">리뷰</a>
  </div>
</div>
</li>
<li class="item">
<div class="top-menu-container">
  <button class="top-menu-btn">RESERVE</button>
  <div class="top-menu-detail" style="left:0;">
    <a href="movieTime.jsp">상영시간표</a>
    <a href="choiceMovie.jsp">예매하기</a>
  </div>
</div>
</li>
<li class="item">
<div class="top-menu-container">
  <button class="top-menu-btn">MY PAGE</button>
  <div class="top-menu-detail" style="left:0;">
    <a href="reserveLog.jsp">영화 예매 내역</a>
    <a href="myReview.jsp">남긴 리뷰</a>
  </div>
</div>
</li>
</ul>

</div>
</body>
</html>
