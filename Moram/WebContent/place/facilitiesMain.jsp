<%@page import="moram.place.controller.AllFacilitiesList"%>
<%@page import="moram.vo.FacilitiesVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>allFacilitiesList</title>
<script type="text/javascript" src ="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/Moram/css/main.css">
<style>
section{
min-height : 1000px;
height : auto;

}
#listimg{
border-radius: 15px;
}
.resultimg{
border-bottom : 5px solid black;
border-radius: 3px;
}
.resultpage{
	width : 500px;
	height : 500px;
	background-color : #E3E8F8;
	border : 5px solid black;
	border-radius: 20px;
	margin : 10px;
	float : left;
	margin-left : 13%;
	margin-right : -5%;
}
.category {
	list-style : none;
	margin : 1px;
}
li {
	float : left;
	margin-right : 40px;
	margin-bottom : 50px;
	width : 200px;
	height : 50px;
	background-color : #A123F1;
	text-align : center;
}
img{
	width: 100%;
	height : 350px;
} 
/* #fid1{ */
/* 	font-size : 1.5em; */
/* 	margin : 0px; */
/* } */
/* #fid{  */
/* 	font-size : 1.2em; */
/* 	margin : 0px; */
/*  }  */
.title{
 border-spacing : 0px; 
 height : 8px;
 padding : 0px; 
}
.tbody .addr{
border-spacing : 0px; 
height : 5px;
padding : 0px;
}
#list{
margin-left : 13%;
}
#button{
background-color : white;
}

#rightlogo{
	list-style: none;
}

/* td:nth-child(even){ */
/* height : 10px; */
/* } */
</style>
<script>

$(function(){
	
	$('#floatdiv').empty();
	
	var subject_name = "";
	$(document).on('click',"#button",function(){
		subject_name = $(this).val();
		 if(subject_name == "??????"){ 
			location.href = "facilitiesMain.jsp"
		}
		console.log(subject_name);
		 //???????????? ?????? ?????????
		$.ajax({
			url : '<%=request.getContextPath()%>/CatFacilitiesList.do',
			type : 'post',
			data : { id : $(this).val(),
				"subject_name" : subject_name
				},
			success : function(res){
				htmlCode = "";
				
				
				$.each(res,function(i,v){
					htmlCode += "<div class ='resultpage'>"
					htmlCode += "<img id = 'listimg' src='/Moram/images/imageView.do?folderNm=facilities&fileNm="+ v.facilities_no +".jpg'>";
					htmlCode += "<table>";
					htmlCode += "<tr><td class ='title'>"+ v.facilities_name + "</td></tr>";
					htmlCode += "<tr><td class ='tbody'>" + v.facilities_rgn +"</td></tr>";
					htmlCode += "<tr><td class = 'addr'>" + v.facilities_addr + "</td></tr>";

					htmlCode += "</table>";
					htmlCode += "<form><input id = 'no' type ='hidden' value ='" + v.facilities_no + "'> </form>"
					htmlCode += "<form><input id = 'info' type = 'hidden' value ='" + v.facilities_info +"'></form>"
					htmlCode += "<form><input id = 'ptState' type = 'hidden' value ='"+ v.placetime_state+"'></form>"
					htmlCode += "</div>"
					
				});
				$(".facilitiesContainer").html(htmlCode);
			},
				
			error : function(xhr){
				alert("?????? : " +xhr.status);
			},
			dataType : 'json'
		})
		
	})
	
	//????????? ????????? ????????? ??????
	$.ajax({
		url : '<%= request.getContextPath()%>/AllFacilitiesList.do',
		type : 'post',
		
		success : function(res){
			htmlCode = "";
			
			//????????? ??????
			$.each(res,function(i,v){
				htmlCode += "<div class ='resultpage'>"
				htmlCode += "<div class = 'resultimg'>"
				htmlCode += "<img id = 'listimg' src='/Moram/images/imageView.do?folderNm=facilities&fileNm="+ v.facilities_no +".jpg'>";
				htmlCode += "</div>"
				htmlCode += "<table>";
				htmlCode += "<tr><td class ='title'><span style ='font-size : 2.8em'>"+ v.facilities_name + "</span></td></tr>";
				htmlCode += "<tr><td class ='tbody'><span style ='font-size : 1.6em'>" + v.facilities_rgn +"</span></td></tr>";
				htmlCode += "<tr><td class = 'addr'><span style ='font-size : 1.1em'>" + v.facilities_addr + "</span></td></tr>";
				htmlCode += "</table>";
				htmlCode += "<form><input id = 'no' type ='hidden' value ='" + v.facilities_no + "'> </form>"
				htmlCode += "<form><input id = 'info' type = 'hidden' value ='" + v.facilities_info +"'></form>"
// 				htmlCode += "<form><input id = 'placeNo' type = 'hidden' value ='" + v.place_no +"'></form>"
				htmlCode += "<form><input id = 'ptState' type = 'hidden' value ='"+ v.placetime_state+"'></form>"
				htmlCode += "</div>"
			});
			
			
			$(".facilitiesContainer").html(htmlCode);
			
		},
		error : function(xhr){
			alert("?????? : " +xhr.status);
		},
		dataType : 'json'
		
	})
	
	//???????????? ?????????
	$(document).on('click',".resultpage", function(){
// 		var facilities_no = $('.title', this).text();
		var facilities_no = $('#no', this).val();
		var facilities_name = $('.title',this).text();
		var facilities_addr = $('.addr',this).text();
		var facilities_info = $('#info',this).val();
// 		var place_no = $('#placeNo',this).val();
		var placetime_state = $('#ptState',this).val();
// 		var placetime_price = 
		console.log(placetime_state);
		
		//??????????????? ??????
		 $.ajax({
			url : '<%= request.getContextPath()%>/FacilitiesInfo.do',
			type : 'post',
			data : {"facilities_no" : facilities_no,
					"facilities_name" : facilities_name,
					"facilities_addr" : facilities_addr,
					"facilities_info" : facilities_info,
// 					"place_no" : place_no,
					"placetime_state" : placetime_state
					},
					
			success : function(res){
				location.href = "facilitiesInfo.jsp?facilities_no=" + facilities_no +"&fname=" + facilities_name + "&faddr=" + facilities_addr +"&finfo=" + facilities_info;
				
			}
			
		}) 
	})	
})

	
	
</script>
</head>
<body>
<%-- <% --%>
<!--  	List<FacilitiesVO> allFacilitiesList = (List<FacilitiesVO>)request.getAttribute("AllFacilitiesList"); -->
<%-- %> --%>
<%@ include file="../static/header.jsp" %> 
<section>

<div id = "list">
	<h2>?????? ?????? ??????</h2>
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "??????">
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "????????????/??????">
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "??????/?????????">
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "??????/??????">
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "????????????">
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "?????????/???/???">
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "??????/??????">
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "??????/??????"><br>
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "??????/??????/??????">
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "??????/?????????">
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "??????/??????">
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "??????/??????">
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "??????/??????">
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "????????????">
	<input type = "button" name = "button" id="button" class="btn btn-light" value= "????????????">

</div>

<div class = "facilitiesContainer">
</div>
</section>
<%@ include file="../static/footer.jsp" %>
</body>
</html>