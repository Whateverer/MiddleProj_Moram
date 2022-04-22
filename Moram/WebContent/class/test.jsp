<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.carousel{
	width: 600px;
}
.ltinfo{
white-space:normal;
overflow:hidden;
width: 400px;
height: 200px;
	margin-left:50px; 
	word-break:break-all;
}
</style>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>


				<div id="slideWrap" class="carousel" data-ride="carousel">
					<div class="container">
					  <div id="myCarousel" class="carousel slide" data-ride="carousel">
					    <!-- Indicators -->
					    <ol class="carousel-indicators">
					      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					      <li data-target="#myCarousel" data-slide-to="1"></li>
					      <li data-target="#myCarousel" data-slide-to="2"></li>
					    </ol>
					
					    <!-- Wrapper for slides -->
					    <div class="carousel-inner">
					    
					      <div class="item active">
					       <div class="ltinfo">
						       ✔ 이름 <br>
						  lecture_name <br>
						      ✏ 강의내용 <br>
						  lecture_info <br>
						       📌 장소 <br>
						  sadwsdas <br>
						       🕛 강의시간 <br>
						  lecture_sdate <br>
						  lecture_stime ~ lecture_etime <br>
						      👨‍👩‍👧‍👦 인원 <br>
						  lecture_limit <br>
						   ₩ 강의금액<br>
						  lecture_price <br>
					       </div>
					      </div>
					
					      <div class="item">
					       <div class="ltinfo">
						       ✔ 이름 <br>
						       
						      ✏ 강의내용<br>
						      2<br>
						       📌 장소<br>
						       🕛 강의시간<br>
						   ₩ 강의금액<br>
					       </div>
					      </div>
					    
					      <div class="item">
					        <div class="ltinfo">
						       ✔ 이름 <br>
						       
						      ✏ 강의내용<br>
						      3<br>
						       📌 장소<br>
						       🕛 강의시간<br>
						   ₩ 강의금액<br>
					       </div>
					      </div>
					    </div>
					
					    <!-- Left and right controls -->
					    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
					      <span class="glyphicon glyphicon-chevron-left"></span>
					      <span class="sr-only">Previous</span>
					    </a>
					    <a class="right carousel-control" href="#myCarousel" data-slide="next">
					      <span class="glyphicon glyphicon-chevron-right"></span>
					      <span class="sr-only">Next</span>
					    </a>
					  </div>
					 </div>
					</div>
</body>
</html>