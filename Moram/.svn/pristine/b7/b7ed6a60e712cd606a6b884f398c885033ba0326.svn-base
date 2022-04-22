<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<style>

   img{
     width:500px; 
     height:300px; 
     cursor: pointer;
     border-radius: 5px;
   }

</style>

<script>
  
function kakaoPay(){
    var IMP = window.IMP; 
    IMP.init('imp72264124'); 
    IMP.request_pay({
       pg : "kakaopay", 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '결제',
        amount : 1,
        buyer_email : '구매자 이메일',
        buyer_name : '구매자 이름',
        buyer_tel : '구매자 번호',
        buyer_addr : '구매자 주소',
        buyer_postcode : '구매자 주소',
        m_redirect_url : 'redirect url'
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            alert(msg);
            
        } else {
            var msg = '결제에 실패하였습니다.';
            rsp.error_msg;
            
        }
    });
}
function payco(){
    var IMP = window.IMP; 
    IMP.init('imp72264124'); 
    IMP.request_pay({
       pg : "payco", 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '결제',
        amount : 1,
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
    var IMP = window.IMP; 
    IMP.init('imp72264124'); 
    IMP.request_pay({
       pg : "tosspay", 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),    // 주문번호
        name : '결제',
        amount : 1,
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
       <img src="../images/카카오페이.png" onclick="kakaoPay()">
       <img src="../images/페이코.png" onclick="payco()">
       <img src="../images/토스.png" onclick="toss()">
       
    </body>
    
    
</html>