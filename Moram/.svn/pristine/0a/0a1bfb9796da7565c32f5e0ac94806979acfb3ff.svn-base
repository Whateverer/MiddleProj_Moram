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
<script src="../js/jquery-3.6.0.min.js"></script>
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
  margin-right: 5%;
}

</style>
<script>

function proc1(){
	
	ff=  document.myform;


 
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


function proc2(){
	
	ff=  document.myform;


 
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



<div id="insertform">

<div class="box">
   
<div class="container">
  <h2>시설 가입정보 입력</h2>

 <form name="myform" action="<%=request.getContextPath()%>/FacilityInsert.do" method="post">
       <label> 시설 이름 </label>
       <input type="text" id="facilities_name" name="facilities_name"><br>
       
       <label>시설 소개 </label>
       <input type="text" id="facilities_info" name="facilities_info"><br>
       
       <label>시설 모람 가입일 </label>
       <input type="text" id=facilities_jdate name="facilities_jdate"><br>
         
       <label>시설 모람 가입상태 </label>
       <input type="text" id="facilities_jstate" name="facilities_jstate"><br>
       
       <label>시설 주소 </label>
       <input type="text" id="facilities_addr" name="facilities_addr"><br>

       		
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
     <button type="button"  onclick="proc1()" >시설정보 입력</button>
   </form>
   
   <div id="result1"></div>
   
</div>
</div>
</div>



<%@ include file="../static/footer.jsp" %> 
</body>
</html>