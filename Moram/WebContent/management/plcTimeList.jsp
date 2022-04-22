<%@page import="moram.vo.PlaceTimeVO"%>
<%@page import="moram.vo.PlaceVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 <link rel="stylesheet" href="/Moram/css/main.css">

<style>
label{
  display : inline-block;
  width : 100px;
  height : 40px;
}
input {
 height : 30px;
 margin : 2px;
}
#list{
float: left;
display: inline-block;
}

#updateform{
float: right;
display: inline-block;

  position : fixed;
  top : 150px;
  right : 200px;
  margin-right: 5%;
   background-color: white;
   border-color: 1px;
   padding: 50px;
   margin: 50px;
   
}

table{
  background-color: white;
  margin-left: 100px;
  border: none;
}
h2{
 margin-left: 100px;
}


</style>
<script>

function proc1(){
	
	ff=  document.myform;
	
	placetime_novalue = ff.placetime_no.value.trim();
 if(placetime_novalue.length < 1){
		alert("시설시간 인조번호를 입력하세요");
		return false;
	}
 
 place_novalue = ff.place_no.value.trim();
 if(place_novalue.length < 1){
		alert("장소명을 입력하세요");
		return false;
	}	
	
 placetime_datevalue = ff.placetime_date.value.trim();
 if(placetime_datevalue.length < 1){
		alert("시설 대여 일자 를 입력하세요");
		return false;
	}
 
 placstime_stimevalue = ff.placstime_stime.value.trim();
 if(placetime_stimevalue.length < 1){
		alert("시설의 대여시작시간 입력하세요");
		return false;
	}
 
 placetime_stimevalue = ff.placetime_etime.value.trim();
 if(placetime_stimevalue.length < 1){
		alert("시설의 대여종료시간 입력하세요");
		return false;
	}
 placetime_statevalue = ff.placetime_state.value.trim();
 if(placetime_statevalue.length < 1){
		alert("시설의 대여상태를 입력하세요");
		return false;
	}
 
	alert("절차 진행 완료");
	//서버로 보내기 
	ff.submit();
}
</script>

</head>
<body>
<%@ include file="../static/adminheader.jsp" %> 

<div id="list">

<%
//서블릿이 보낸 데이터를 받는다. 
List<PlaceTimeVO> placeTimeList = null;

placeTimeList=(List<PlaceTimeVO>)request.getAttribute("placetimelist");

%>

<h2>제휴시설 예약시간 테이블</h2>
<table class="table">
<thead class="table-dark">
<tr>
	<th>시설번호</th><th>장소번호</th><th>장소예약날짜</th><th>장소예약 시작시간</th><th>종료시간</th><th>예약상태</th>
</tr></thead>
<%
for(PlaceTimeVO ptvo : placeTimeList){
%>
<tbody>
	<tr>
		<td><%= ptvo.getPlace_no() %></td>
		<td><%= ptvo.getPlacetime_no() %></td>
		<td><%= ptvo.getPlacetime_date() %></td>
		<td><%= ptvo.getPlacetime_stime() %></td>
		<td><%= ptvo.getPlacetime_etime() %></td>
		<td><%= ptvo.getPlacetime_state() %></td>
	</tr>
	</tbody>
<% }%>		

</table>

</div>

<div id="updateform">

<div class="box">
   
<div class="container">
  <h2>장소 가입정보 수정</h2>

 <form name="myform" action="<%=request.getContextPath()%>/PlaceUpdate.do" method="post">
       <label> 장소시간번호 </label>
      <input type="text" id="placetime_no" name="placetime_no"><br>
  
      <label> 장소번호 </label>
      <input type="text" id="place_no" name="place_no"><br>
       
       <label> 장소의 시간 날짜  </label>
       <input type="text" id="placetime_date" name="placetime_date"><br>
       
       <label>장소의 대여 시작시간 </label>
       <input type="text" id="placetime_etime" name="placetime_etime"><br>
       
       <label>장소의 대여 종료시간 </label>
       <input type="text" id=placetime_etime name="placetime_etime"><br>
       
   	       장소 대여 상태<select id="subjectno"  name ="subjectno" aria-label="활동지역" >
				<option value="" >상태를 선택하세요</option>
				<option value="가능">이용가능</option>
				<option value="불가">이용불가</option>
				<option value="대여중">대여중</option>
				<option value="수리중">수리중</option>
				
			</select>
		<br><br>

     <br>
     <button type="button"  onclick="proc1()" >장소 시간 정보 수정</button>
   </form>
   
   <div id="result1"></div>
   
</div>
</div>

</div>
<%@ include file="../static/footer.jsp" %> 
</body>
</html>