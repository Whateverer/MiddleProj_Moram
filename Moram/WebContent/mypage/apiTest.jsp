<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>


<script type="text/javascript">

	$.ajax({
		url: "/API/payment",
		type : "post",

// 		Content-type: "application/x-www-form-urlencoded;charset=utf-8",
		
		success : function (res) {
			
		},
		dataType : 'json' 
	})

 	$.ajax({
		url: "https://kapi.kakao.com/v1/payment/ready",
		type : "post",
		data : {
				"cid":"TC0ONETIME",
				"partner_order_id":"partner_order_id", //주문번호
				"partner_user_id":"partner_user_id", //회원아이디
				"item_name":"초코파이", //상품명
				"quantity":"1", //수량
				"total_amount":"2200",//총액
				"tax_free_amount":"0",//비과세
				"approval_url":"https://developers.kakao.com/success", //성공
				"cancel_url":"https://developers.kakao.com/cancle", //취소z
				"fail_url":"https://developers.kakao.com/fail", //실패
				"headers": {
				     // 카카오 developers에 등록한 admin키를 헤더에 줘야 한다.
				       "Authorization": "KakaoAK 9c32c7ece2c0c443d49743428a59e993",
				       "Content-type": "application/x-www-form-urlencoded;charset=utf-8",
				},
				},
// 		Content-type: "application/x-www-form-urlencoded;charset=utf-8",
		
		success : function (res) {
			
		},
		dataType : 'json' 
	})
	
</script>
<form action="<%=request.getContextPath() %>/payment">
<input type="submit" value="결제하기">
<input type="hidden" name="ptNo" value="PT1">
</form>
</body>
</html>