<%@page import="moram.vo.TeacherVO"%>
<%@page import="moram.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="text/javascript" src="/Moram/js/jquery-3.6.0.min.js"></script>
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
  right : 100px;
  
   background-color: white;
   border-color: 1px;
   padding: 50px;
   margin: 0;
   
}

.table{
  width : 85%;
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

// 	namevalue = ff.name.value.trim();
// 	if(namevalue.length < 1){
// 		alert("이름 입력하세요");
// 		return false;
// 	}
// 	if(namevalue.length <2 || namevalue.length >5){
// 		alert("이름 는 2~5 사이로 입력.");
// 		return false;
// 	}
	
//    namereg = /^[가-힣]{2,5}$/;
//    if( !(namereg.test(namevalue))){
// 	   alert("이름 형식오류");
// 	   return false;
//    }
	
//    telvalue = ff.tel.value.trim();
//    if(telvalue.length < 1){
// 		alert("전화번호 입력하세요");
// 		return false;
// 	}
//    telreg=/^\d{2,3}\d{3,4}\d{4}$/;
//    if(!(telreg.test(telvalue))){
// 	   alert("전화번호 형식오류");
// 	   return false;
//    }

//    birvalue = ff.bir.value.trim();
   
//    var year = Number(birvalue.substr(0,4)); // 입력한 출생년도
// 	   var month = Number(birvalue.substr(5,2)); // 입력한 출생 월
// 	   var day = Number(birvalue.substr(8,2)); // 입력한 출생 일
// 	   var today = new Date(); // 날짜 변수 선언 
// 	   var yearNow = today.getFullYear(); // 올해 연도 가져옴 
//    if (1900 > year || year > yearNow){
// 	   alert("출생년도를 잘못 입력 하셨습니다.");
// 	   return false;
//    }
	
//    var s = document.getElementById("rgn");
//    var rgn = s.options[s.selectedIndex].value;


//    rgnvalue = ff.rgn.value.trim();
//    if(rgnvalue.length < 1){
// 		alert("활동지역을 입력하세요");
// 		return false;
// 	}
 
//    var subject_noChk = ff.subject_no;
//    alert(subject_noChk.length);
//    var chkCnt = 0;
//    for(var i=0; i<subject_noChk.length; i++){
// 	   if(subject_noChk[i].checked){
// 		   chkCnt++;   
// 	   }
//    }
//    alert("선택한 개수 : " + chkCnt)
//    if(chkCnt <1){
// 	   alert("선호 카테고리를 선택해 주세요");
//    }
   
	alert("절차 진행 완료");
	
	//서버로 보내기 
	ff.submit();

}

function proc2(){
	
	ff2=  document.myform;

	alert("절차 진행 완료");
	
	//서버로 보내기 
	ff2.submit();
}

</script>


</head>
<body>
<%@ include file="../static/adminheader.jsp" %> 
<div id="list">

<%
//서블릿이 보낸 데이터를 받는다. 
List<MemberVO> weimList = null;
List<TeacherVO> TchAplyList = null;

weimList=(List<MemberVO>)request.getAttribute("weimList");
TchAplyList=(List<TeacherVO>)request.getAttribute("TchAplyList");


// 모람 위임 지정자 목록 (컨테인즈로 잘라내기?)<-- 이 사람의 모람권 결제 상태 여부  
// 모람 위임 전임자 입력란(j 스테이트 란 뒤에 전임자 표시.(컨테인즈) 탈퇴자도 가능) // 모람 위임 후임자 입력란 
// 모람쌤 신청자 목록  <-- 이 사람의 클래스 신청서 작성 상태 여부 


%>

<h2>모람 위임 지정자 목록</h2>
<table class="table">
 <thead class="table-dark">
<tr>
	<th>회원 아이디</th><th>회원이름</th><th>회원 이메일</th><th>회원 전화번호</th><th>회원생년월일</th><th>회원가입일</th><th>가입상태</th><th>회원유형</th>
</tr></thead>
<%
for(MemberVO mvo : weimList){
%>
 <tbody>
	<tr>
		<td><%= mvo.getMem_id() %></td>
		<td><%= mvo.getMem_name() %></td>
		<td><%= mvo.getMem_email() %></td>
		<td><%= mvo.getMem_tel() %></td>
		<td><%= mvo.getMem_bir() %></td>
		<td><%= mvo.getMem_jdate() %></td>
		<td><%= mvo.getMem_jstate() %></td>
		<td><%= mvo.getMem_div() %></td>

	</tr>
	 </tbody>
<% }%>		

</table>

<h2>모람 위임 지정자 목록</h2>
<table class="table">
 <thead class="table-dark">
<tr>
	<th>회원 아이디</th><th>클래스운영계획서</th><th>제출일자</th>
</tr></thead>
<%
for(TeacherVO tvo : TchAplyList){
%>
 <tbody>
	<tr>
		<td><%= tvo.getMem_id() %></td>
		<td><%= tvo.getTeacher_plan() %></td>
		<td><%= tvo.getTeacher_wdate()%></td>

	</tr>
		 </tbody>
<% }%>		

</table>
</div>

<div id="updateform"> 

<div class="box">
   
<div class="container">
  <h2>모람샘 승인</h2>

 <form name="myform1" action="<%=request.getContextPath()%>/teacherOK.do" method="post">
     
       <label> 아이디 </label>
       <input type="text" id="id" name="id"><br>
      
    모람쌤 승인 <select id="div"  name ="div" aria-label="회원유형" >
				<option value="" >회원유형 선택</option>
				<option value="모라미">모라미</option>
				<option value="모람쌤">모람쌤</option>
			</select>
		<br><br>	
     <br>
     <button type="button"  onclick="proc1()" >회원정보 수정</button>
   </form>
   
   <div id="result1"></div>
   
</div>
</div>
<!-- 모람위임 폼 시작. -->

<div id="weimform">

<div class="box">
   
<div class="container">
  <h2>모람지기 변경</h2>

 <form name="myform2" action="<%=request.getContextPath()%>/WeimOk.do" method="post">
     
       <label> 아이디 </label>
       <input type="text" id="mrjgid" name="mrjgid"><br>
     
    모람쌤 승인 <select id="div"  name ="rgn" aria-label="회원유형" >
				<option value="" >회원유형 선택</option>
				<option value="모라미">모라미</option>
				<option value="모람쌤">모람쌤</option>
			</select><br>
		<br><br>
	
	모람지기 위임<select id="mrinfo"  name ="mrinfo" aria-label="모람지기 위임" ><br>
				<option value="" >모람 위임 선택</option>
				<option value="모라미">모라미</option>
				<option value="모람지기">모람지기</option>
			</select>
		<br><br>
     <br>
     <button type="button"  onclick="proc2()" >회원정보 수정</button>
   </form>
   
   <div id="result2"></div>
</div>
</div>
</div>
</div>
<%@ include file="../static/footer.jsp" %> 
</body>
</html>