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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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

body{
background-color: #E3E8F8;
text-align: center;
}

.box{
display : inline-block;
width : 45%;
margin-top: 3%;
padding-left: 3%;
background-color: #EEEEEE;
text-align : left;
border-radius: 1em;

min-width: 600px;
}

h2{
text-align: center;

}

</style>
<script type="text/javascript">


$(function(){ 
	
	//인증토드 입력 후 이메일 코드 유효성 검사 
	$('#emValChkBtn').on('click', function(){
		emvalchkvalue = $('#emvalchk').val();
		$.ajax({
			url : '/Moram/emValChk.do',
			data : {"emvalchk" : emvalchkvalue},
			type : 'post',
			success : function(res){
				alert(res.sw);
			},
			error : function(xhr){
				alert("상태" + xhr.status); //
			},
			dataType : 'json'
		})
	})
	
	//인증코드 발송 
	$('#emCodSndBtn').on('click', function(){
	emailvalue = $('#email').val();
		$.ajax({
			url : '/Moram/mailSnd.do',
			data : {"email" : emailvalue},
			type : 'post',
			success : function(res){
				alert(res.sw);// 난수 
			},
			error : function(xhr){
				alert("상태" + xhr.status); //
			},
			dataType : 'json'
		})
	})
	
	
})
	
function proc1(){

	
	ff=  document.myform;

	   
	namevalue = ff.name.value.trim();
	if(namevalue.length < 1){
		alert("이름 입력하세요");
		return false;
	}
	if(namevalue.length <2 || namevalue.length >5){
		alert("이름 는 2~5 사이로 입력.");
		return false;
	}
	
   namereg = /^[가-힣]{2,5}$/;
   if( !(namereg.test(namevalue))){
	   alert("이름 형식오류");
	   return false;
   }

   
   
	//alert("절차 진행 완료");
	//서버로 보내기 
	$('#myform').submit();
      	
//})
}


</script>

</head>
<body>

<div class="box">
  <h2>아이디 찾기 </h2><br>
   
<div class="container">

 <form  id="myform"   name="myform" action="<%=request.getContextPath()%>/FgId.do" method="post">
     

       
       
       <label> 이메일</label>
       <input type="text" id="email" name="email">
       
       
    <button id="emCodSndBtn" type="button"  class="btn btn-danger btn-sm">인증코드 발송</button><br>
      
      
        <label> 이메일 인증</label>
       <input type="text" id="emvalchk" name="emvalchk">
 <button id="emValChkBtn" type="button"  class="btn btn-danger btn-sm">인증코드 유효성검사</button><br>

       <label>이름 </label>
       <input type="text" id="name" name="name"><br>

     <!--   <button type="submit"  >비밀번호 변경하기</button> -->
       
     <button type="button"  onclick="proc1()" >아이디 이메일로 발송</button>
   </form><br>
   
   <div id="result1"></div><br>
   
</div>
</div>
</body>
</html>