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
  margin-right: 2%;
    background-color: white;
}
.table{
  background-color: white;
  
  border: none;
  width: 70%;
}

</style>
<script>

function proc1(){
	
	ff=  document.myform;

	mrnovalue = ff.mrno.value.trim();
 if(mrnovalue.length < 1){
		alert("모람번호를 입력하세요");
		return false;
	}
 
 moramjigivalue = ff.moramjigi.value.trim();
 if(moramjigivalue.length < 1){
		alert("모람지기를 입력하세요");
		return false;
	}	
	
 mrinfovalue = ff.mrinfo.value.trim();
 if(mrinfovalue.length < 1){
		alert("모람정보를 입력하세요");
		return false;
	}
 
 mrcdatevalue = ff.mrcdate.value.trim();
 if(mrcdatevalue.length < 1){
		alert("모람생성일자를 입력하세요");
		return false;
	}
 
 mrrgnvalue = ff.mrrgn.value.trim();
 if(mrrgnvalue.length < 1){
		alert("활동지역을 입력하세요");
		return false;
	}
 
 
 subjectnovalue = ff.subjectno.value.trim();
 if(subjectnovalue <1){
	   alert("선호 카테고리를 선택해 주세요");
	   return false;
 }
 
 mrstatevalue = ff.mrstate.value.trim();
 if(mrstatevalue <1){
	   alert("모람 상태를 선택해 주세요");
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
List<MoramVO> moramList = null;

moramList=(List<MoramVO>)request.getAttribute("moramList");



%>

<h2>모람목록</h2>
<table class="table">
<thead class="table-dark">
<tr>
	<th>MR_NO</th><th>MR_NAME</th><th>MORAMJIGI</th><th>MR_INFO</th><th>MR_CDATE</th><th>MR_LIMIT</th><th>MR_RGN</th><th>SUBSCRIBE_NO</th><th>SUBJECT_NO</th><th>MR_STATE</th>
</tr></thead>
<%
for(MoramVO mvo : moramList){
%>
<tbody>
	<tr>
		<td><%= mvo.getMr_no() %></td>
		<td><%= mvo.getMr_name() %></td>
		<td><%= mvo.getMoramjigi() %></td>
		<td><%= mvo.getMr_info() %></td>
		<td><%= mvo.getMr_cdate() %></td>
		<td><%= mvo.getMr_limit() %></td>
		<td><%= mvo.getMr_rgn() %></td>
		<td><%= mvo.getSubscribe_no() %></td>
		<td><%= mvo.getSubject_no() %></td>
		<td><%= mvo.getMr_state() %></td>
	</tr>
	 </tbody>
<% }%>		

</table>

</div>


<div id="updateform">

<div class="box">
   
<div class="container">
  <h2>모람 개설정보 수정</h2>

 <form name="myform" action="<%=request.getContextPath()%>/moramUpdate.do" method="post">
      <label> 모람번호 </label>
      <input type="text" id="mrno" name="mrno"><br>
       
       <label> 모람지기 </label>
       <input type="text" id="moramjigi" name="moramjigi"><br>
       
       <label>모람 정보 </label>
       <input type="text" id="mrinfo" name="mrinfo"><br>
       
       <label>모람 대표이미지 </label>
       <input type="text" id="mrimage" name="mrimage"><br>
      
       <label> 모람 생성일자</label>
       <input type="date" id="mrcdate" name="mrcdate"><br><br>
       
        모람상태 <select id="mrstate"  name ="mrstate" aria-label="모람상태" >
				<option value="" >모람상태 선택</option>
				<option value="정상">정상</option>
				<option value="삭제된 모람 ">삭제된 모람</option>
				<option value="인천광역시">인천광역시</option>
			</select>
		<br><br>
          모람최대맴버<select id="mrlimit"  name ="mrlimit" aria-label="모람최대맴버" >
				<option value=20 >20명 </option>
				<option value=50>50명 </option>
				<option value=100>100명</option>
			</select>
		<br><br>
          모람권 종류 <select id="subscribeno"  name ="subscribeno" aria-label="모람최대맴버" >
				<option value=0 >무료 20명 </option>
				<option value=2>모람권49 50명 </option>
				<option value=3>모람권59 100명</option>
			</select>
		<br><br>		
		    활동지역    <select id="mrrgn"  name ="mrrgn" aria-label="활동지역" >
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
		
	        모람 카테고리<select id="subjectno"  name ="subjectno" aria-label="활동지역" >
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
     <button type="button"  onclick="proc1()" >모람정보 수정</button>
   </form>
   
   <div id="result1"></div>
   
</div>
</div>



</div>
</section> 
<%@ include file="../static/footer.jsp" %> 
</body>
</html>