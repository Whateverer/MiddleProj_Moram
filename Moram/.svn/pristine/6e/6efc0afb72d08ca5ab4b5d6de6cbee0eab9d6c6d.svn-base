<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<script>

$(function(){ 
	/* 아이디 중복검사  */
  $('#idbtn').on('click', function(){
		idvalue = $('#id').val().trim();
		
		if(idvalue.length<1){
			  alert("id를 입력하세요");
			  return false;
		}
		if(idvalue.length<7|| idvalue.length >19){
			alert("id 는 8~ 16 사이");
			return false;
		}
			idreg = /^[a-z][A-Za-z0-9]{8,16}$/
			//정규식.test(value) - true/false를 리턴 
			if(!(idreg.test(idvalue))){
				alert("아이디는 알파벳대소문자 + 숫자로 8자~18자 형식 입니다. 아이디 형식오류");
				return false;
			} 
		
		
		//정규식 체크 - idcheck() 호출
// 		if(!idcheck()) return false;
		//정규식 체크 통과하면 서버로 전송하기 
		$.ajax({
			url : '/Moram/idDuChk.do',
			data : {"id" : idvalue}, //data : "id" + idvalue,
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

	//이메일 중복체크
	$('#emDuChkBtn').on('click', function(){
		emailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		emailvalue = $('#email').val().trim();
		
		if(!(emailreg.test(emailvalue))){
			alert("이메일 글자 앞 중간 뒤에 영문+숫자 포함하여 특수문자 중 점( . ) 하이픈( - ) 언더바( _ ) 만 사용 가능");
			return false;
		} 
		
		if(emailvalue.length<1){
			  alert(" 이메일을 입력하세요");
			  return false;
		}
		if(emailvalue.length<6|| emailvalue.length >50){
			alert("id 는 6~ 50 사이");
			return false;
		}

		$.ajax({
			url : '/Moram/emDuChk.do',
			data : {"email" : emailvalue}, //data : "id" + idvalue,
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

	
    passvalue = ff.pass.value.trim();
    pass2value = ff.pass2.value.trim();
    if(passvalue.length<1){
    	alert("pass입력");
    	return false;
    }
    if(passvalue.length<8 || passvalue.length>20){
    	alert("pass 8~20 사이, 숫자1개이상, 소문자1개, 대문자1개, 특수문자1개 이상");
    	return false;
    }
    if(passvalue!=pass2value){
    	alert("비번 재입력이 틀렸습니다. 다시 입력 해주세요.");
    	return false;
    } 
     passreg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+]).{8,20}$/;
    
    if(!(passreg.test(passvalue))){
    	alert("pass형식오류 pass 8~20 사이, 숫자1개이상, 소문자1개, 대문자1개, 특수문자1개 이상");
    	return false;
    }
   
    
    telvalue = ff.tel.value.trim();
   
   
    telreg=/^\d{2,3}\d{3,4}\d{4}$/;
    if(!(telreg.test(telvalue))){
 	   alert("전화번호 형식오류");
 	   return false;
    }
    
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
	
   telvalue = ff.tel.value.trim();
   if(telvalue.length < 1){
		alert("전화번호 입력하세요");
		return false;
	}
   telreg=/^\d{2,3}\d{3,4}\d{4}$/;
   if(!(telreg.test(telvalue))){
	   alert("전화번호 형식오류");
	   return false;
   }

   birvalue = ff.bir.value.trim();
   
   var year = Number(birvalue.substr(0,4)); // 입력한 출생년도
	   var month = Number(birvalue.substr(5,2)); // 입력한 출생 월
	   var day = Number(birvalue.substr(8,2)); // 입력한 출생 일
	   var today = new Date(); // 날짜 변수 선언 
	   var yearNow = today.getFullYear(); // 올해 연도 가져옴 
   if (1900 > year || year > yearNow){
	   alert("출생년도를 잘못 입력 하셨습니다.");
	   return false;
   }
	
   var s = document.getElementById("rgn");
   var rgn = s.options[s.selectedIndex].value;


   rgnvalue = ff.rgn.value.trim();
   if(rgnvalue.length < 1){
		alert("활동지역을 입력하세요");
		return false;
	}
 
   var subject_noChk = ff.subject_no;
  
   var chkCnt = 0;
   for(var i=0; i<subject_noChk.length; i++){
	   if(subject_noChk[i].checked){
		   chkCnt++;   
	   }
   }

   if(chkCnt <1){
	   alert("선호 카테고리를 선택해 주세요");
   }
 
   
   
   
   
	alert("회원가입 완료");
	//서버로 보내기 
	ff.submit();
      	
}




</script>
</head>
<body>

<div class="box">
  <h2>모람 회원가입</h2><br>
   
<div class="container">

 <form name="myform" action="<%=request.getContextPath()%>/MemberInsert.do" method="post">
     
       
       <label> 아이디 </label>
       <input type="text" id="id" name="id">
       
      <button id="idbtn" type="button"  class="btn btn-danger btn-sm">중복검사</button><br>
      
       <label> 비밀번호 </label>
       <input type="password" id="pass" name="pass"><br>
       
       <label>비밀번호 재입력 </label>
       <input type="password" id="pass2" name="pass2"><br>
       
       <label>이름 </label>
       <input type="text" id="name" name="name"><br>
      
       <label> 생년월일</label>
       <input type="date" id="bir" name="bir"><br>
       
       <label> 이메일</label>
       <input type="text" id="email" name="email">
          <button id="emDuChkBtn" type="button"  class="btn btn-danger btn-sm">중복검사</button>
       
    <button id="emCodSndBtn" type="button"  class="btn btn-danger btn-sm">인증코드 발송</button><br>
      
      
        <label> 이메일 인증</label>
       <input type="text" id="emvalchk" name="emvalchk">
 <button id="emValChkBtn" type="button"  class="btn btn-danger btn-sm">인증코드 유효성검사</button><br>
       
       <label>전화번호</label>
       <input type="text" id="tel" name="tel"><br>
       
     
       활동지역    <select id="rgn"  name ="rgn" aria-label="활동지역" >
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
		선호 카테고리 1~3개 선택 가능 <br>   <!-- 아이디/ 선호카테고리 1~3개는 MEM_FAVCAT 테이블에 입력  -->
			<input type="checkbox" name=subject_no value=1 checked >아웃도어/여행
			<input type="checkbox" name=subject_no value=2>운동/스포츠
			<input type="checkbox" name=subject_no value=3>음악/악기
			<input type="checkbox" name=subject_no value=4>봉사활동
			<input type="checkbox" name=subject_no value=5>사교/인맥<br>
			<input type="checkbox" name=subject_no value=6>인문학/책/글
			<input type="checkbox" name=subject_no value=7>외국/언어
			<input type="checkbox" name=subject_no value=8>업종/직무
			<input type="checkbox" name=subject_no value=9>문화/공연/축제<br>
			<input type="checkbox" name=subject_no value=10>공예/만들기
			<input type="checkbox" name=subject_no value=11>댄스/무용
			<input type="checkbox" name=subject_no value=12>사진/영상
			<input type="checkbox" name=subject_no value=13>게임/오락<br>
			<input type="checkbox" name=subject_no value=14>요리/제조
			<input type="checkbox" name=subject_no value=15>반려동물
			<input type="checkbox" name=subject_no value=16>자유주제<br>
       <br>
     <br>
     <button type="button"  onclick="proc1()" >회원가입</button><br>
   </form><br>
   
   <div id="result1"></div>
   
</div>
</div>
</body>
</html>