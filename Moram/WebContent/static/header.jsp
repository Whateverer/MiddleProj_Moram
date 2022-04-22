<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="/Moram/css/main.css">
<style>

@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
	#mainHeader{
		border-bottom: 2px solid #e9e9e9;
	}
	#moramlogo{
		margin-top:9px;
		width: 330px;
		height: 70px;
		margin-right: 10%;
	}
	
	#menulist { 
		position: fixed; 
 		top: 180px;
		height : 100%; 
		width: 150px; 

	}
	
	input:-ms-input-placeholder{
		color:#a8a8a8;
	}
	input::-webkit-input-placeholder{
		color:#a8a8a8;
	}
	input::-moz-placeholder{
		color:#a8a8a8;
	}
	
	#searchbox{
		height: 40px;
		width: 400px;
		border : 1px solid #1b5ac2;
		background: #ffffff;
		display: inline-block;
		margin-left: 2%;
	}
	#searchtext{
		font-size: 16px;
		width: 325px;
		padding: 10px;
		border: 0px;
		outline: none;
		float: left;
	}
	#searchBTN{
		width: 50px;
		height: 100%;
		border: 0px;
		background: #1b5ac2;
		outline: none;
		float : right;
		color: #ffffff;
		cursor: pointer;
	}
	searchBTN:hover{
		background: blue;
	}
	
	#logout{
		float:right;
		margin-right: 2%;
	}
	#floatdiv { 
		position:fixed; 
		width:175px; 
		display:inline-block;
		right:-70px; /* 창에서 오른쪽 길이 */ 
		top:45%; /* 창에서 위에서 부터의 높이 */ 
		background-color:transparent; 
		margin:0; 
		padding: 0;
	}
	
 	#topBtn{ 
 		position:fixed;  
 		width:30px; 
 		height:30px;  
 		display:inline-block; 
 		right:0px; /* 창에서 오른쪽 길이 */
 		top:92%; /* 창에서 위에서 부터의 높이 */ 
 		background-color:transparent;  
 		margin:20px; 
 		cursor: pointer; 
 	} 
 	#bottomBtn{ 
 		position:fixed;  
 		width:30px; 
 		height:30px;  
 		display:inline-block; 
 		right:0px; /* 창에서 오른쪽 길이 */  
 		top:4%; /* 창에서 위에서 부터의 높이 */  
 		background-color:transparent;  
 		margin:20px; 
 		cursor: pointer;	 
 	} 
	
	#instalogo{
		width: 50px;
		height: 50px;
		margin-left: 5px;
	}
	 #facelogo{
	 	width: 60px;
	 	height: 60px;
	 }
	
	#rightlogo{
		display: inline-block;
		list-style: none;
	}
	.LOGOli{
		cursor: pointer;
	}
	.mimg{
		width: 20px;
		height: 20px;
	}
	.navbar-form{
	display: inline-block;
	}
</style>
	<script>
		
		$(function(){
			
			
			$('#searchBtn').on('click', function(){
				searchtext = '?query=';
			
				searchtext += $('#searchtext').val();
				console.log(searchtext);
				location.href = '/Moram/main.jsp' + searchtext+'';
				
			})
			
			
			
			
		})
		
		
		
	
	</script>
 <script type="text/javascript">

$(function(){
	const urlObj = {
		moram : '/moram/moramMain.jsp',
		'class' : '/class/classMain.jsp',
		place : '/place/facilitiesMain.jsp',

		}
	
	$('.menuList').on("click", function(){
		let menuId= $(this).attr('id');
		
		location.href ='<%=request.getContextPath()%>'+urlObj[menuId]

	 });
  
});
  </script>
</head>
<body>
	<header id="mainHeader">
		<a href="/Moram/main.jsp?query="><img id="moramlogo" src="/Moram/images/morapurple.png"/></a>
<!-- 		 <div id="searchbox"> -->
<!-- 		 	<input id="searchtext" type="text" placeholder="모람명/클래스명 입력"> -->
<!-- 		 	<button id="searchBTN">검색</button> -->
<!-- 		 </div> -->
 <form class="navbar-form navbar-left" action="">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search" id="searchtext">
      </div>
      <button id="searchBtn"type="button" class="btn btn-default">Submit</button>
    </form>
		 <a id="logout" href="http://localhost/Moram/logout.jsp">로그아웃</a>
	</header>
		
		<nav>
			<div id="menulist">

				<input type="radio" name="accordion" id="answer01" style="display:none">
				<label class="menuList" id="moram" name="m"><img class="mimg" src="/Moram/images/admin/moram.png">&ensp;모람</label>
				<div></div>
			
				<input type="radio" name="accordion" id="answer02" style="display:none">
				<label class="menuList" id="class" name="m"><img class="mimg" src="/Moram/images/admin/class.png">&ensp;클래스</label>
				<div></div>


				<input type="radio" name="accordion" id="answer03" style="display:none">
				<label class="menuList" id="place" name="m"><img class="mimg" src="/Moram/images/admin/place.png">&ensp;장소예약</label>
				<div></div>

				
				<input type="radio" name="accordion" id="answer04" style="display:none">
				<label for="answer04" id="mypage" name="m"><img class="mimg" src="/Moram/images/admin/mypage.png">&ensp;마이페이지</label>
				<div>
				<a class="amenu" href="/Moram/mypage/passChk.jsp">-내 정보 조회</a><br>
				<a class="amenu" href="/Moram/mypage/moramPay.jsp">-결제</a><br>	
				<a class="amenu" href="/Moram/mypage/moramPayList.jsp">-모람권 결제내역</a><br>	
				<a class="amenu" href="/Moram/mypage/plpay.jsp">-장소결제 현황</a><br>	
				<a class="amenu" href="/Moram/mypage/myMoramList.jsp">-내 관심모람</a><br>
				<a class="amenu" href="/Moram/mypage/moramSem.jsp">-모람쌤 신청</a><br>
				<a class="amenu" href="/Moram/mypage/moramWeim.jsp">-모람 위임 신청</a><br>
				</div>
	
			
				<input type="radio" name="accordion" id="answer05" style="display:none">
				<label for="answer05" name="m"><img class="mimg" src="/Moram/images/admin/notice.png">&ensp;고객센터</label>
				<div>
				<a class="amenu" href="/Moram/adminboard/adminboard.jsp?grNo=1">-공지사항</a><br>
				<a class="amenu" href="/Moram/adminboard/adminboard.jsp?grNo=2">-자주묻는 질문</a><br>
				<a class="amenu" href="/Moram/adminboard/adminboard.jsp?grNo=3">-1:1 문의</a><br>
				</div>
					
			</div>
			
			
		</nav>
		
		<div id="floatdiv">
			<ul id="rightlogo">
				 <li class="LOGOli"><img id="topBtn" src="/Moram/images/topBtn.png" onclick="window.scrollTo(0,0);"></li>
			 	 <li class="LOGOli"><a href="https://www.instagram.com/moram_ewha/?hl=ko"><img id="instalogo" src="/Moram/images/instalogo.png"/></a></li>
			  	 <li class="LOGOli"><a href="https://www.facebook.com/pages/category/Artist/%EB%AA%A8%EB%9E%8C-1684724638222296/"><img id="facelogo" src="/Moram/images/facelogo.png"/></a></li>
			</ul>
		
		</div>
		
</body>
</html>