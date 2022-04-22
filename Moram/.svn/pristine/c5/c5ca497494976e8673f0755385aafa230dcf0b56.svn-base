<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모람결제</title>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<link rel="stylesheet" href="/Moram/css/main.css">
	
	<style>
	    #tossimg{
			margin-bottom: 10px;
	    }
		#pass1, #pass2{
		  height: 500px;

		}
		#morampaySection{
		  height: 1000px;
		}
		#pathbtn{
		  display : inline-block;
		  color: black;
		  font-size: 1.5em;	 
		  cursor: pointer;
		  width: 100%;
		  height: 100%;
		}
		#pathbtn1, #pathbtn2, #pathbtn3{
		  width: 100%;
		  height: 100%;
		  display: inline-block;
		  cursor: pointer;
		  color: black;
		}
 		.wrapper{ 
 		  margin-left : 15%;
 		  margin-top : 5%; 
		  height: 100%;
 		} 
 		img{ 
 			width : 200px; 
 			height: 70px;
 			cursor : pointer; 
 		} 
 		#path{ 
 		  padding-top : 4px;
 		  height : 40px; 
 		  width : 200px; 
 		  border : 1px solid black; 
 		  display : inline-block; 
 		  margin-right: 30px; 
 		  cursor : pointer; 
 		  background: #e9e9e9;
 		  text-align: center; 
 		} 
		#path:hover{
		  background: #f5f5f5;
		}
		#pathbox{
		  border : 1px solid #e9e9e9;
		  display: inline-block;
		  width: 40%;
		  margin:3%; 
		  margin-left: 0;
		}
		#pathbox:hover{
		  background: #f5f5f5;
		}
		label input[type=radio]:checked{
			background: black;
		}
		
	</style>
	
	<script>
		
 	window.onload = function(){
			document.getElementById("pass2").style.display = "none";					
	}
		function valp(pass){
			val = document.querySelector('input[name="pass"]:checked').value;
			
			if(val == "모람권"){
				document.getElementById("pass1").style.display = "none";			
				document.getElementById("pass2").style.display = "block";					
			}else if(val == "클래스"){
				document.getElementById("pass1").style.display = "block";						
				document.getElementById("pass2").style.display = "none";			
			}
		}
		
		function valtype(pass){
			val2 = document.querySelector("input[name='moram']:checked").value;
			
			if(val2 == 4900){
				document.getElementById("pathbtn2").style.backgroundColor="#f2f2e8";
				document.getElementById("pathbtn1").style.backgroundColor="white";
				document.getElementById("pathbtn3").style.backgroundColor="white";
				
			}else if(val2 == 5900){
				document.getElementById("pathbtn1").style.backgroundColor="white";
				document.getElementById("pathbtn3").style.backgroundColor="#f2f2e8";
				document.getElementById("pathbtn2").style.backgroundColor="white";
				
			}else if(val2 == 19900){
				document.getElementById("pathbtn3").style.backgroundColor="white";
				document.getElementById("pathbtn2").style.backgroundColor="white";
				document.getElementById("pathbtn1").style.backgroundColor="#f2f2e8";
				
			}
		}
		
		
		
	function kakaoPay(){
	
	subsName = $('#pass:checked').val();
	typeName = $('#moram:checked').val();

    
	if(subsName == "모람권" && typeName == "4900"){
		subsName = "모람권49";
	}else if(subsName == "모람권" && typeName == "5900"){
		subsName = "모람권59";
	}
		
	
	
	if(typeName == "4900"){
		pathPrice = 4900;
	}else if(typeName == "5900"){
		pathPrice = 5900;
	}else{
		pathPrice = 19900;
	}
	
    var IMP = window.IMP; 
    IMP.init('imp72264124'); 
    IMP.request_pay({
       pg : "kakaopay", 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : subsName,
        amount : pathPrice,
        buyer_email : '구매자 이메일',
        buyer_name : '<%=session.getAttribute("sessionId")%>',
        buyer_tel : '구매자 번호',
        buyer_addr : '구매자 주소',
        buyer_postcode : '구매자 주소',
        m_redirect_url : 'redirect url'
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            alert(msg);
           
			$.ajax({
				url : '<%=request.getContextPath()%>/MoramSubscribePay.do',
				type : 'get',
				data : {"subsName" : subsName,
						"type" : '카카오페이'},
				dataType : 'json',
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				success : function(res){
					console.log("결제번호 : " + res);
				}
			})
            
        } else {
            var msg = '결제에 실패하였습니다.';
            rsp.error_msg;
            
        }
    });
}
	
	
	
function payco(){
	
	subsName = $('#pass:checked').val();
	typeName = $('#moram:checked').val();
	
	pathPrice = 0;
	
	if(typeName == "4900"){
		pathPrice = 4900;
	}else if(typeName == "5900"){
		pathPrice = 5900;
	}else{
		pathPrice = 19900;
	}
    
	
	if(subsName == "모람권" && typeName == "4900"){
		subsName = "모람권49";
	}else if(subsName == "모람권" && typeName == "5900"){
		subsName = "모람권59";
	}
		
	
	$.ajax({
		url : '<%=request.getContextPath()%>/MoramSubscribePay.do',
		type : 'get',
		data : {"subsName" : subsName,
				"type" : '페이코'},
		dataType : 'json',
		error : function(xhr){
			console.log("상태 : " + xhr.status);
		},
		success : function(res){
			console.log("결제번호 : " + res);
		}
	})
	
    var IMP = window.IMP; 
    IMP.init('imp72264124'); 
    IMP.request_pay({
       pg : "payco", 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : subsName,
        amount : pathPrice,
        buyer_email : '구매자 이메일',
        buyer_name : '구매자 이름',
        buyer_tel : '구매자 번호',
        buyer_addr : '구매자 주소',
        buyer_postcode : '구매자 주소',
        m_redirect_url : 'redirect url'
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
			
        } else {
            var msg = '결제에 실패하였습니다.';
            rsp.error_msg;
            
        }
    });
}



function toss(){
	
	subsName = $('#pass:checked').val();
	typeName = $('#moram:checked').val();

    
	if(subsName == "모람권" && typeName == "4900"){
		subsName = "모람권49";
	}else if(subsName == "모람권" && typeName == "5900"){
		subsName = "모람권59";
	}
	
	if(typeName == "4900"){
		pathPrice = 4900;
	}else if(typeName == "5900"){
		pathPrice = 5900;
	}else{
		pathPrice = 19900;
	}
	
	
	$.ajax({
		url : '<%=request.getContextPath()%>/MoramSubscribePay.do',
		type : 'get',
		data : {"subsName" : subsName,
				"type" : 'toss'},
		dataType : 'json',
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		success : function(res){
			console.log("결제번호 : " + res);
		}
	})
	
    var IMP = window.IMP; 
    IMP.init('imp72264124'); 
    IMP.request_pay({
       pg : "tosspay", 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),    // 주문번호
        name : subsName,
        amount : pathPrice,
        buyer_email : '구매자 이메일',
        buyer_name : '구매자 이름',
        buyer_tel : '구매자 번호',
        buyer_addr : '구매자 주소',
        buyer_postcode : '구매자 주소',
        m_redirect_url : 'redirect url'
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';

        } else {
            var msg = '결제에 실패하였습니다.';
            rsp.error_msg;
            
        }
    });

}
	</script>
	
</head>
<body>
<%@ include file="../static/header.jsp" %>
	<section id="morampaySection">
<div class="wrapper">
	<br>
	<div id="path">
		<label id="pathbtn" class="classbbtn"><input type="radio" value="클래스" name="pass" id="pass" onclick="valp(pass)" checked="checked" style="display:none">클래스권</label>
	</div>
	
	<div id="path">
		<label id="pathbtn" class="morambbtn"><input type="radio" value="모람권" name="pass" id="pass" onclick="valp(pass)" style="display:none">모람권</label>
	</div>
	<br><br><br>
	
	
	
	
	<div id="pass1">
			<h2>클래스권</h2>
		<div id="pathbox">
			<label id="pathbtn1"><h4>클래스를 개설 및 유지 가능</h4><br>
			<input type="radio" value="19900" name="moram" id="moram" style="display:none" checked="checked" onclick="valtype(pass)"> 월 19900원</label>
		</div>
		
		<div>
			<h5>※ 결제일자 기준 매월 자동 결제됩니다.</h5>
		</div>
	</div>
	
	
	<div id="pass2">
			<h2>모람권</h2>
		<div id="pathbox">
			<label id="pathbtn2"><h4>모람 정원 <b>50명</b></h4><br>
			<input type="radio" value="4900" name="moram" id="moram" style="display:none" onclick="valtype(pass)"> 월 4900원</label>
		</div>
		<br>
		<div id="pathbox">
			<label id="pathbtn3"><h4>모람 정원 <b>100명</b></h4><br>
			<input type="radio" value="5900" name="moram" id="moram" style="display:none" onclick="valtype(pass)"> 월 5900원</label>
		</div>
		
		
		<div>
			<h5>※ 결제일자 기준 매월 자동 결제됩니다.</h5>
		</div>
	</div>
	   <img src="../images/카카오페이.png" onclick="kakaoPay()">
       <img src="../images/페이코.png" onclick="payco()">
       <img src="../images/토스.jpg" id="tossimg" onclick="toss()">
			
</div>
	</section>
	<%@ include file="../static/footer.jsp" %> 
</body>
</html>