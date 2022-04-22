<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 넘어가기전 내 비밀번호 입력하는 페이지</title>
	<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="/Moram/css/main.css">
	<style>
		#false{
			color : red;
			font-size: 0.5em;
		}
		
		.wrapper{
		  text-align: center;
		  margin : 50px auto;
		  margin-top: 10%;
		  margin-right: 20%;
		}
		#myPageSection{
			height: auto;
			float: right;
/* 			//width: 85%; */
		}
		#borderDiv{
			border: 2px solid #e9e9e9;
			padding-top: 100px;
			padding-bottom: 120px;
		}
	</style>
	
	<script>
		$(function(){
			
			$('#passcheck').on('click', function(){
				
				if($('#passText').length <= 0){
					alert('값을 입력해주세요.');
					return false;
				}
			
			$.ajax({
				
				url : '<%=request.getContextPath()%>/PasswordChk.do',
				data : {"pass" : $('#passText').val()},
				dataType : 'json',
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				success : function(res){
					if(res == "성공"){
					location.href = "http://localhost/Moram/mypage/myInfoList.jsp";
					}else{
						$('#false').text("비밀번호가 틀렸습니다.");
						return false;
					}
				}
				
				
			})
		  })
		})
	</script>
	
</head>
<body>
<%@ include file="../static/header.jsp" %>
<section id="myPageSection">

<div class="wrapper">
	<div id="borderDiv">
		<form>
		<h2>개인정보</h2>
			<h5>고객님의 개인정보 보호를 위해 본인확인을 진행합니다.</h5>
				<h5>모람 비밀번호를 입력해주세요.</h5>
			비밀번호 확인 <input id="passText" type="password">
				<button type = "button" id="passcheck">확인</button><br>
				<div id="false"></div>
		</form>
	</div>
</div>
</section>

<%@ include file="../static/footer.jsp" %> 
</body>
</html>