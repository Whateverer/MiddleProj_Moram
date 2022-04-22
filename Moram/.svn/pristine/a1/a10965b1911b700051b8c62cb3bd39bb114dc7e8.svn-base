<%@page import="moram.place.controller.AllFacilitiesList"%>
<%@page import="moram.vo.FacilitiesVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>catFacilitiesList</title>
<script type="text/javascript" src ="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/Moram/css/main.css">

<script src='./lib/main.js'></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=740f60de4554af42681d639629de1442&libraries=services"></script>
<style>


label{
	cursor: pointer;
}

body{

	width : 100%;
	height : 100%;
}
div{

}
.left{
	width : 50%;
	height : 450px;
	min-height : 450px;
	
	background-color : lightblue;
	float : left;
	margin-right : 3%;
	margin-left : 3.3%;
	margin-top : 3%;
	
}
.right{
	width : 32.43%;
	height : 50%;
	position : relative;
/* 	background-color : orange; */
	float : left;
	margin-right : 3%;
	margin-top : 3%;
}
#divimg{
border-top-right-radius : 30px;
border-bottom-right-radius : 30px;
width : 77%;
height : 481px;
}
.Info{
width: 75%;
height: 375px;


/* float : left; */
	min-height : 375px;
	font-size : 1.9em;
}
#result{
	width: 85.3%;
	height: auto;
/* 	background-color : pink; */
	float : left;
/* 	margin-left:3.4%; */
	padding-bottom : 3%;
	padding-top : 7%;
	padding-left : 20%;
	padding-right : 20%;
}
#tabresult{
	width: 85.3%;
	height: auto;
/* 	background-color : yellow; */
	float : left;
	margin-left:3.4%;
	padding-bottom : 3%;
	padding-top : 7%;
	padding-left : 20%;
	padding-right : 20%;
}
#button{
	
	clear: both;
	padding : 2px 0px;
	
	
}
.wrapper{
	margin-left : 4.5%;
	margin-top : 3%;
	height: 100%;
}
.facilitiesInfo .fbtn, #btn1, #btn2, #btn3, #button{
	display: inline-block;
}
#btn1, #btn2, #btn3{
width : 31.6%;
height : 50px;
padding-top : 1%;
margin : -3px;
margin-left : 10.95px;
margin-top : 10px;

}
#btn1{
border : 3px solid black;
border-radius :30px;
background-color : #E3E8F8;
}
#btn2{
border : 3px solid black;
border-radius :30px;
background-color : #E3E8F8;
}
#btn3{
border : 3px solid black;
border-radius :30px;
background-color : #E3E8F8;
}
.btnclass{
font-size : 40px;
margin-top : -10px;
margin-bottom : -15px;
}
section{
min-height : 1000px;
height : auto;
}
#fimg{
border-top-left-radius : 30px;
border-bottom-left-radius : 30px;
width : 100%;
height : 479px;

}
#pimg{
width : 100%;
height : 350px;
}
#reviewimg{
width : 400px;
height : 300px;
}
#pdiv{
width : 500px;
margin-left : 5.0%;
margin-bottom : 2%;

}
#pid{
font-size : 2em;
font-weight : bold;
}
#pid2{
font-size : 1.3em;
}
#rimg{
display : inline-block;
position : absolute;
width : 500px;
height : 500px;
margin-left : -50px;

}
#rdiv1{
display : inline-block;
position : relative;
top : -460px;
left : 10px;
z-index : 1;
}
.Info{
display : inline-block;
position : relative;
z-index : 1;
top : -470px;
left : 10px
}
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=740f60de4554af42681d639629de1442&libraries=services"></script> <!--  지도 주소 서비스 라이브러리 -->
<script>
fno = '<%=request.getParameter("facilities_no")%>'
console.log(fno)		


// 화면 스위칭
function setdisplay(dd){
			
	var idval = $(dd).attr("id");
	
		radio = $(dd).find('input');
			
			
		if($(radio).val() == "예약/안내"){
// 			alert($(radio).val())
			$('#result').show();
			$('#tabresult').hide();
			$('#map').hide();
			}
		else if($(radio).val() == "위치보기"){
// 			alert($(radio).val())
	 		$('#map').show();
			$('#result').hide();
	 		$('#tabresult').hide();
	 		}
		else{
// 			alert($(radio).val())
	 		$('#result').hide();
			$('#tabresult').show();
			$('#map').hide();
	 		}
				
		}

$(function(){
	
	fno = '<%=request.getParameter("facilities_no")%>'
		plprice =<%=request.getParameter("place_price")%>
	
		$.ajax({
			url : '<%= request.getContextPath()%>/FacilitiesInfo.do',
			type : 'post',
			data : {"facilities_no" : fno },
			success : function(res){
			
				htmlCode ="";	
				$.each(res,function(i,v){
					htmlCode += "<div id = 'pdiv'>";
					htmlCode += 	"<div>"
					htmlCode += 		"<img id = 'pimg' src='/Moram/images/imageView.do?folderNm=place&fileNm="+ v.place_no +".jpg'>";
					htmlCode +=		"</div>"
					htmlCode +=		"<div>"
					htmlCode +=			"<p id = 'pid' value ='"+ v.place_name+"'>" + v.place_name + "</p>";
					htmlCode +=		"</div>"
					htmlCode +=		"<div><p id = 'pid2'>가격</p></div>"
					htmlCode +=		"<div><p id = 'pid2'>" + v.place_price + "</p></div>"
					htmlCode +=		"<button type = 'button' id = 'rezbutton' class='btn btn-primary' name = 'button' style='background-color : #E3E8F8;color : black; border : 2px solid black' value = '"+ v.place_no + "'>예약하기</button>"
					htmlCode += 	"<input type = 'hidden' id = 'place_price' value ='"+ v.place_price+"'>";
					htmlCode +=		"<input type = 'hidden' id = 'place_name' value ='" + v.place_name+"'>";
					htmlCode += "</div>"	
					
				})
			
				$("#result").html(htmlCode);
			
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		
		})
	
		$("#btn1").on('click',function(){
			$('#result').show();
		})
	
	//예약하기 버튼 클릭시 
	$(document).on('click',"#rezbutton",function(){
		
		let plno = $(this).attr('value');
		let place_price = $(this).parent().find("#place_price").val();
		let place_name = $(this).parent().find("#place_name").val();

		var rezbtn = window.open("/Moram/calendar/CalendarIndex.jsp?place_no="+plno+"&facilities_no="+fno+"&place_price=" + place_price+"&place_name="+ place_name, "kkkk","width=1000,height=800");
	})
	

 	$("#btn2").on('click',function(){
		
 		faddr =  '<%=request.getParameter("faddr")%>';
		console.log(faddr)
		///------------------------------------------------------------------------지도 생성미당
		var mapContainer = document.getElementById('map'),
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), 
		        level: 3 
		    };
		
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
		///------------------------------------------------------------------------지도 생성미당
		///------------------------------------------------------------------------마커 생성미당
		var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);
		
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		marker.setMap(map);
		
		// marker.setMap(null);    // 지도위 마커 제거 표시임당당당
		///------------------------------------------------------------------------마커 생성미당								
		
		
		///------------------------------------------------------------------------지도 이동하게 임미당								
		var mapTypeControl = new kakao.maps.MapTypeControl();
		
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		///------------------------------------------------------------------------지도 이동하게 임미당								

		
		///------------------------------------------------------------------------주소 검색하게 임미당								
		// 주소->>>>>>>>>>>좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(faddr, function(result, status) {   // 여기만 변수로 변경 해주십쇼
		
		    // 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
			console.log(status);
			
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });


        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    		} 
		}); 
		
	})
	
	
//리뷰버튼 클릭시	
	$("#btn3").on('click',function(){
		<%
		String fno2 = request.getParameter("facilities_no");
 		%>
		$.ajax({
			url : '<%= request.getContextPath()%>/FacilitiesReview.do',
			type : 'post',
			data : {"facilities_no" : "<%=fno2%>"},
			success : function(res){
				htmlCode ="";
				$.each(res,function(i,v){
					htmlCode += "<div>"
					htmlCode += 	"<div>"
					htmlCode +=	v.fareview_cont
					htmlCode +=		"</div>"
					htmlCode +=		"<div>"
					htmlCode +=		"<img id = 'reviewimg' src='/Moram/images/imageView.do?folderNm=facilities_review&fileNm="+ v.fareview_image +".jpg'>";
					htmlCode +=		"</div>"
					htmlCode +=		"<div>" + v.fareview_wdate + "</div>"
					htmlCode +=		"<div>" + v.fareview_writer + "</div>"
					htmlCode +=	"</div>"		
					htmlCode += 	"<hr>"
				})
				
				$("#tabresult").html(htmlCode);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
	})

	
	
})
</script>
</head>
<body>
<%@ include file="../static/header.jsp" %>
<section> 
<div class = "wrapper">

	<div class = "left">
		<img id = fimg src = "/Moram/images/imageView.do?folderNm=facilities&fileNm=<%=request.getParameter("facilities_no")%>.jpg"/>
	</div>	
	<div class = "right">
		<div id = "rimg">
			<img id = "divimg" src = "/Moram/images/div1.jpg">
			<div id = "rdiv1">	
				<h2 style="display : inline-block"><%=request.getParameter("fname") %></h2><br>
				<p style="display : inline-block"><%=request.getParameter("faddr") %></p>
			</div>
			<div class = "Info"><%=request.getParameter("finfo")%>
			</div>
		</div>
		
		
	</div>
	
	<div id = "button" style="height:8%; width :90%; margin-left: 1%; margin-right : 30px;margin-top : 3.5%;text-align : center">
		
			<div id = 'btn1' onclick ="setdisplay(this)" ><label class = 'btnclass' style = "display : inline-block" ><input type="radio"  class = "facilitiesInfo fbtn" value = "예약/안내"   name = "fbtn"  style = "display : none">예약안내</label></div>
		
			<div id = 'btn2' onclick ="setdisplay(this)"><label class = 'btnclass'><input type="radio" class = "facilitiesMap fbtn" value = "위치보기" name = "fbtn" style = " display : none">위치보기</label></div>
		
			<div id = 'btn3' onclick ="setdisplay(this)"><label class = 'btnclass'><input type="radio"  class = "facilitiesReview fbtn" value = "리뷰"  name = "fbtn"  style = "display : none">리뷰</label></div>
			
	</div>
<div id = "result"></div>
<div id = "tabresult"></div>
<!-- <div id = "mapresult"></div> -->
<div id="map" style="width:85.5%; height:500px; margin-left:3.35%"></div>
</div>	

</section>
<%@ include file="../static/footer.jsp"%>
</body>
</html>