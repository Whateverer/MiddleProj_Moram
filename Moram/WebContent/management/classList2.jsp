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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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

#updateform{

float: right;
display: inline-block;

  position : fixed;
  top : 150px;
  right : 50px;
  padding : 2%;
  margin-right: 10%;
  background-color: white;
  border: 1px solid;
}
.table{
float: left;
width: 60%;
display: inline-block;
background-color: white;
  border: 5px solid;

}
</style>
<script>

function proc1(){
	
	ff=  document.myform;

	classnovalue = ff.classno.value.trim();
 if(classnovalue.length < 1){
		alert("클래스번호를 입력하세요");
		return false;
	}
 
 classnamevalue = ff.classname.value.trim();
 if(classnamevalue.length < 1){
		alert("모람지기를 입력하세요");
		return false;
	}	
	
 classinfovalue = ff.classinfo.value.trim();
 if(classinfovalue.length < 1){
		alert("모람정보를 입력하세요");
		return false;
	}
 
 classaddrvalue = ff.classaddr.value.trim();
 if(classaddrvalue.length < 1){
		alert("모람생성일자를 입력하세요");
		return false;
	}
 
 classrgnvalue = ff.classrgn.value.trim();
 if(classrgnvalue.length < 1){
		alert("활동지역을 입력하세요");
		return false;
	}
 
 
 subjectnovalue = ff.subjectno.value.trim();
 if(subjectnovalue <1){
	   alert("클래스 카테고리를 선택해 주세요");
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
List<ClassVO> classList = null;

classList=(List<ClassVO>)request.getAttribute("classlist2");



%>

<h2>클래스목록</h2>
 <table class="table">
 	<thead class="thead-dark">
<tr>
	<th>클래스번호</th><th>클래스명</th><th>클래스이미지</th><th>클래스 정보</th><th>클래스 주소</th><th>클래스주소</th><th>클래스활동지역</th><th>주제 번호</th>
</tr></thead>
<%
for(ClassVO cvo : classList){
%>
	<tr>
		<td><%= cvo.getClass_no() %></td>
		<td><%= cvo.getClass_name() %></td>
		<td><%= cvo.getMem_id() %></td>
		<td><%= cvo.getClass_image() %></td>
		<td><%= cvo.getClass_info() %></td>
		<td><%= cvo.getClass_addr() %></td>
		<td><%= cvo.getClass_rgn() %></td>
		<td><%= cvo.getSubject_no() %></td>
	</tr>
<% }%>		

</table>

</div>


<div id="updateform">

<div class="box">
   
<div class="container">
  <h2>클래스 개설정보 수정</h2>

 <form name="myform" action="<%=request.getContextPath()%>/classUpdate2.do" method="post">
      <label> 클래스 번호 </label>
      <input type="text" id="classno" name="classno"><br>
       
       <label> 클래스 이름 </label>
       <input type="text" id="classname" name="classname"><br>
       
       <label>회원 아이디 </label>
       <input type="text" id="memid" name="memid"><br>
       
       <label>클래스 설명 </label>
       <input type="text" id="classinfo" name="classinfo"><br>
       
       <label>클래스 주소 </label>
       <input type="text" id="classaddr" name="classaddr"><br>

		
		    활동지역    <select id="classrgn"  name ="classrgn" aria-label="활동지역" >
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
		
	       클래스 카테고리<select id="subjectno"  name ="subjectno" aria-label="활동지역" >
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
     <button type="button"  onclick="proc1()" >클래스정보 수정</button>
   </form>
   
   <div id="result1"></div>
   
</div>
</div>



</div>
</section> 

<%@ include file="../static/footer.jsp" %> 
</body>
</html>