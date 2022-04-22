<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소결제</title>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<link rel="stylesheet" href="/Moram/css/main.css">
	
	<style>
		p{
		font-size : 50px;
		text-align : center;
		}
		section{
		
		}
		.wrapper{
		  text-align: center;
		  margin : 50px auto;
		  width : 60%;
		  height : 60%;
		  display : inline-block;
		}
		img{
			width : 150px;
			height: 70px;
			cursor : pointer;
		}
		#path{
		  padding : 10px;
		  height : 30%;
		  width : 43%;
		  
		  display : inline-block;
		  margin-right: 15px;
		  cursor : pointer;
		}
		
		#test{
		display : inline-block;
		}
		#stitle,#etitle{
		width : 29.5%;
		height : 50px;
		font-size : 40px;
		}
		#title{
		width : 64%;
		height : 50px;
		font-size : 40px;
		}
		#ptitle{
		width : 50%;
		height : 50px;
		font-size : 40px;
		}
		.payinfo{
		font-size : 40px;
		}
		#paydiv1{
		display : inline-block;
		
		width : 20%;
		height : 150px;
		margin-right : 10px;
		}
		#paydiv2{
		display : inline-block;
		
		width : 20%;
		height : 150px;
		margin-right : 10px;
		
		}
		#paydiv3{
		display : inline-block;
		
		width : 20%;
		height : 150px;
		}
		#payk{
		width: 100%;
		height : 90%;
		}
		#payp{
		width: 100%;
		height : 130px;
		margin-bottom : 6px;
				
		}
		#payt{
		width: 100%;
		height : 110px;
		margin-bottom : 23px;
		}
		#paycontainer{
		text-align : center; 
		}
	</style>
	
	<script>
$(function(){
	
	
place_no = '<%=request.getParameter("place_no")%>'
facilities_no = '<%=request.getParameter("facilities_no")%>'
placetime_stime = '<%=request.getParameter("placetime_stime")%>'
placetime_etime = '<%=request.getParameter("placetime_etime")%>'
place_pay = '<%=request.getParameter("place_price")%>'
placetime_no = '<%=request.getParameter("placetime_no")%>';

$('#ptitle').val(place_pay);
pstime = placetime_stime.substring(15,21).trim();
console.log("placetime_no : " + placetime_no)
console.log(pstime + "입니다.");
$('#stitle').val(pstime);
petime = placetime_etime.substring(15,21).trim();
$('#etitle').val(petime);
})

function kakaoPay(){
	
	
    var IMP = window.IMP; 
    IMP.init('imp72264124'); 
    IMP.request_pay({
       pg : "kakaopay", 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '결제',
        amount : place_pay,
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
				url : '<%=request.getContextPath()%>/PlacePay.do',
				type : 'get',
				data : {
						"placetime_no" : placetime_no,
						"place_pay" : place_pay
						},
				dataType : 'json',
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				success : function(res){
					console.log("결제번호 : " + res);
					console.log("placetime_no :" + placetime_no);
					console.log("place_pay :" + place_pay);
					location.href = "/Moram/place/facilitiesMain.jsp"
				}
			})
            
        } else {
            var msg = '결제에 실패하였습니다.';
            rsp.error_msg;
            
        }
    });
}
function payco(){
	
	
	
	$.ajax({
		url : '<%=request.getContextPath()%>/MoramSubscribePay.do',
		type : 'get',
		data : {
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
        name : '결제',
        amount : place_pay,
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
		subsName = "모람권59"
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
        name : '결제',
        amount : place_pay,
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
// 	$.ajax({
		
		
// 	})


	</script>
	
</head>
<body>
<%@ include file="../static/header.jsp" %>
<section>
<p>결제정보</p>

<form action = "#" accept-charset = "utf-8" name = "placePay" method = "get" >

	<fieldset style = "height : 270px; width : 80%; margin-left : 10%; margin-top : 3%; border : none;">

	<div id="path">
		<label class = 'payinfo'> ID : </label><input type="text" name="title" id="title" value ='<%=session.getAttribute("sessionId")%>' style = "text-align : center;" readonly >
	</div>
	
	<div id="path">
		<label class = 'payinfo'> 금    액 : </label><input type="text" name="title" id="ptitle" style = "text-align : center;" readonly>
	</div>
	<div id="path">
		<label class = 'payinfo'> 시작 시간 : </label><input type="text" name="title" id="stitle" style = "text-align : center;" readonly>
	</div>
	<div id="path">
		<label class = 'payinfo'> 종료 시간 : </label><input type="text" name="title" id="etitle" style = "text-align : center;" readonly>
	</div>
	
	</fieldset>
</form>
	<div id = "paycontainer" >	
	<div id = "paydiv1">
	   <img src="../images/카카오페이.png" id = "payk" onclick="kakaoPay()">
	</div>
	<div id = "paydiv2">
       <img src="../images/페이코.png" id = "payp" onclick="payco()">
    </div>
    <div id = "paydiv3">   
       <img src="../images/토스.jpg" id = "payt" onclick="toss()">
	</div>
	</div>
</section>
	<%@ include file="../static/footer.jsp" %> 
</body>
</html>