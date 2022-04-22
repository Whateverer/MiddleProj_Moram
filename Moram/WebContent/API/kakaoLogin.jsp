<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	Kakao.init('ab313513e5f72ede525d8a08b7c1e3b7'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	
		//카카오로그인
		function kakaoLogin() {
		    Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response)
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
		//카카오로그아웃  
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  
		</script>

</head>
<body>
		
			
		      <img src="../images/kakao_login_medium_narrow.png" onclick="kakaoLogin()">
		         
			
			
			<br>
		      <a href="javascript:void(0)">
		          <button type="button" onclick="kakaoLogout()">카카오 로그아웃</button>
		      </a>
			
		

</body>
</html>