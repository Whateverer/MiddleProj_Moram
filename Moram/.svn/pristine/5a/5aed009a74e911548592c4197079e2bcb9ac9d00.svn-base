<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/Moram/js/jquery-3.6.0.min.js"></script>
 <link rel="stylesheet" href="/Moram/css/main.css">
<style>
	#moramlogo{
		margin-top:9px;
		width: 100px;
		height: 60px;
	}
	#menulist { 
		position: fixed; 
 		top: 180px;
		height : 100%; 
		text-align:center; 
		width: 150px; 
		margin-left: 2%;
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
nav{
width: 180px;
height: 700px;
}

label{
width: 170px;
}

</style>

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
	<header><h1>모람 : 모인 사람들 관리자 페이지</h1></header>
		
		<nav id = "nav">
			<div>

				<input type="radio" name="accordion" id="answer01" style="display:none">
				<label for="answer01" id="updateMoramInfo" name="m">회원정보</label>
				<div>
				<a href="<%=request.getContextPath()%>/MemberApplyList.do">회원등급변경 <br>승인</a><br>	
				</div>

				<input type="radio" name="accordion" id="answer02" style="display:none">
				<label for="answer02" id="updateMoramInfo" name="m">모람정보</label>
				<div>
				<a href="<%=request.getContextPath()%>/MoramInfo.do">모람정보수정 <br>수정 </a><br>	
				</div>
			
				<input type="radio" name="accordion" id="answer03" style="display:none">
				<label for= "answer03"  id="clas" name="m">클래스정보</label>
				<div>
				<a href="<%=request.getContextPath()%>/ClassList2.do">클래스정보수정</a><br>	
				</div>

				<input type="radio" name="accordion" id="answer04" style="display:none">
				<label for= "answer04" id="plac" name="m">시설정보조회</label>
				<div>
				<a href="http://localhost/Moram/management/insertFacility.jsp">시설정보입력</a><br>	
				<a href="<%=request.getContextPath()%>/FacilityListM.do">시설정보수정</a><br>		
				</div>

				<input type="radio" name="accordion" id="answer05" style="display:none">
				<label for="answer05"id="plac" name="m">장소정보조회</label>
				<div>
				<a href="http://localhost/Moram/management/insertplc.jsp">신규입력</a><br>	
				<a href="<%=request.getContextPath()%>/PlaceListM.do">장소정보수정</a><br>	
				</div>

				<input type="radio" name="accordion" id="answer06" style="display:none">
				<label for="answer06"  id="plac" name="m">시간별예약현황</label>
				<div>
				<a href="http://localhost/Moram/management/insertplc.jsp">장소이용시간입력</a><br>	
				<a href="<%=request.getContextPath()%>/PlaceTimeList.do">장소의 예약정보 수정</a><br>		
				</div>

				<input type="radio" name="accordion" id="answer07" style="display:none">
				<label for="answer07" name="m">고객센터</label>
				<div>
				<a class="amenu" href="/Moram/adminboard/adminboard.jsp?grNo=1">-공지사항</a><br>
				<a class="amenu" href="/Moram/adminboard/adminboard.jsp?grNo=2">-자주묻는 질문</a><br>
				<a class="amenu" href="/Moram/adminboard/adminboard.jsp?grNo=3">-1:1 문의</a><br>
				</div>
				<br>	
				<a href="http://localhost/Moram/logout.jsp">로그아웃</a><br>	
			</div>
			
			
		</nav>
		
		<div id="floatdiv">
			<ul id="rightlogo">
				 <li class="LOGOli"><img id="topBtn" src="/Moram/images/topBtn.png" onclick="window.scrollTo(0,0);"></li>
			 	 <li class="LOGOli"><a href="https://www.instagram.com/moram_ewha/?hl=ko"><img id="instalogo" src="/Moram/images/instalogo.png"/></a></li>
			  	 <li class="LOGOli"><a href="https://www.facebook.com/pages/category/Artist/%EB%AA%A8%EB%9E%8C-1684724638222296/"><img id="facelogo" src="/Moram/images/facelogo.png"/></a></li>
				 <li class="LOGOli"><img id="bottomBtn" src="/Moram/images/bottomBtn.png" onclick="window.scrollTo(100,100);"></li>
			</ul>
		
		</div>
		
</body>
</html>