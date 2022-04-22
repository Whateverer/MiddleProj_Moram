<%@page import="moram.vo.FacilitiesVO"%>
<%@page import="moram.vo.ClassVO"%>
<%@page import="moram.vo.MoramVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  right : 50px;
  margin-right: 3%;
  border : 1px;
  background-color: white;
}
.table{
  background-color: white;
  width : 75%;
  border: none;
}
</style>
<script>

function proc1(){
	
	ff=  document.myform;

	facilities_novalue = ff.facilities_no.value.trim();
 if(facilities_novalue.length < 1){
		alert("시설번호를 입력하세요");
		return false;
	}
 
 facilities_namevalue = ff.facilities_name.value.trim();
 if(facilities_namevalue.length < 1){
		alert("시설명을 입력하세요");
		return false;
	}	
	
 facilities_infovalue = ff.facilities_info.value.trim();
 if(facilities_infovalue.length < 1){
		alert("시설 소개를 입력하세요");
		return false;
	}
 
 facilities_jdatevalue = ff.facilities_jdate.value.trim();
 if(facilities_jdatevalue.length < 1){
		alert("시설의 모람 가입일을 입력하세요");
		return false;
	}
 
 facilities_jstatevalue = ff.facilities_jstate.value.trim();
 if(facilities_jstatevalue.length < 1){
		alert("시설의 지역카테고리를 입력하세요");
		return false;
	}
 
 facilities_addrvalue = ff.facilities_addr.value.trim();
 if(facilities_addrvalue.length < 1){
		alert("시설의 지역카테고리를 입력하세요");
		return false;
	}
 
 subjectnovalue = ff.subjectno.value.trim();
 if(subjectnovalue <1){
	   alert("시설의 주제 카테고리를 선택해 주세요");
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
<section>
<div id="list">

<%
//서블릿이 보낸 데이터를 받는다. 
List<FacilitiesVO> facList = null;

facList=(List<FacilitiesVO>)request.getAttribute("faclist2");



%>

<h2>제휴시설목록</h2>
<table class="table">
 <thead class="table-dark">
<tr>
	<th>시설번호</th><th>시설이름</th><th>지역 카테고리</th><th>시설 소개</th><th>시설주소</th><th>상태</th><th>시설주제 카테고리</th>
</tr></thead>
<%
for(FacilitiesVO fvo : facList){
%>
    <tbody>
	<tr>
		<td><%= fvo.getFacilities_no() %></td>
		<td><%= fvo.getFacilities_name() %></td>
		<td><%= fvo.getFacilites_rgn() %></td>
		<td><%= fvo.getFacilites_info() %></td>
		<td><%= fvo.getFacilites_addr() %></td>
		<td><%= fvo.getFacilites_jstate() %></td>
		<td><%= fvo.getSubject_no() %></td>
	</tr>
	 </tbody>
<% }%>		

</table>
</div>



<div id="updateform">

<div class="box">
   
<div class="container">
  <h2>시설 가입정보 수정</h2><br>

 <form name="myform" action="<%=request.getContextPath()%>/facilities_update.do" method="post">
      <label> 시설 번호 </label>
      <input type="text" id="facilities_no" name="facilities_no"><br>
       
       <label> 시설 이름 </label>
       <input type="text" id="facilities_name" name="facilities_name"><br>
       
       <label>시설 소개 </label>
       <input type="text" id="facilities_info" name="facilities_info"><br>
       
       <label>시설 모람 가입일 </label>
       <input type="text" id=facilities_jdate name="facilities_jdate"><br><br>
       
         <label>시설 주소 </label>
       <input type="text" id="facilities_addr" name="facilities_addr"><br><br>
       
       <h3>시설 모람 가입상태 수정 </h3><br><br>
       
          시설 모람 가입상태<select id="facilities_jstate"  name ="facilities_jstate" aria-label="가입상태" >
				<option value="" >상태를 선택하세요</option>
				<option value="정상">정상</option>
				<option value="삭제된 시설">삭제된 시설</option>
				<option value="수리중">수리중</option>
				</select><br><br>
       

       		
	  시설지역카테고리    <select id="facilities_rgn"  name ="facilities_rgn" aria-label="활동지역" >
					<option>서울</option>
				<option>인천</option>
				<option>경기</option>
				<option>부산</option>
				<option>대구</option>
				<option>광주</option>
				<option>대전</option>
				<option>울산</option>
				<option>세종</option>
				<option>강원</option>
				<option>경남</option>
				<option>경북</option>
				<option>전남</option>
				<option>전북</option>
				<option>충남</option>
				<option>충북</option>
				<option>제주</option>
			</select>
		<br><br>
       
		
	       시설 카테고리<select id="subjectno"  name ="subjectno" aria-label="활동지역" >
				<option value="" >카테고리 선택</option>
				<option value=1>아웃도어/여행</option>
				<option value=2>운동/스포츠</option>
				<option value=3>음악/악기</option>
				<option value=4>봉사활동</option>
				<option value=5>사교/인맥</option>
				<option value=6>인문학/책/글</option>
				<option value=7>외국/언어</option>
				<option value=8>업종/직무</option>
				<option value=9>문화/공연/축제 </option>
				<option value=10>공예/만들기</option>
				<option value=11>댄스/무용</option>
				<option value=12>사진/영상</option>
				<option value=13>게임/오락</option>
				<option value=14>요리/제조</option>
				<option value=15>반려동물</option>
				<option value=16>자유주제</option>
			</select>
		<br><br>
	
 
     <br>
     <button type="button"  onclick="proc1()" >시설정보 수정</button>
   </form>
   
   <div id="result1"></div>
   
</div>
</div>



</div>

<%@ include file="../static/footer.jsp" %> 
</section>
</body>
</html>