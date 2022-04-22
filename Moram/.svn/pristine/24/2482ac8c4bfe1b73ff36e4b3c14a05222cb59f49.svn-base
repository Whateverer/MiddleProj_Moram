<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <script src="../js/board.js"></script>
<style>
	html, body{
		margin: 0;
		padding: 0;
		width: 100%;
		height: 100%;
		background: #e9e9e9;
	}
	
	.row{
		padding: 0px;
		margin: 0px;
		text-align: center;
	}
	
	.container{
		text-align: center;
		display: inline-block;
	}
	.col-xl-10{
		padding-left: 40%;
		margin-right: 40%;
		padding-top: 20%;
	}

	
</style>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>  <!-- 카카오 로그인 라이브러리 입니다. NO 건들 -->
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
	        	  // 이 부분이 로그인 된것임.
	        	  // DB에 저장하는 서블릿 연결해주고 로그아웃 따로 마련하겠음
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

</script>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>모람 로그인</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>


<body class="bg-gradient-primary">
    <div class="container">
        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">모람에 오신걸 환영합니다</h1>
                                    </div>
                                    <form class="user" action="<%=request.getContextPath()%>/MemberLogin.do" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                name ="UserId" aria-describedby="emailHelp"
                                                placeholder="Enter Moram ID...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                name = "PassWord" id="exampleInputPassword" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <button type="submit"  class="btn btn-primary btn-user btn-block">로그인</button>
                                        <hr>
                                        
                                         <img src="images/kakao_login_medium_narrow.png" onclick="kakaoLogin()">  <!-- 카카오 로그인 -->
                                       
                                        <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="<%=request.getContextPath()%>/join/ForgotID.jsp">Forgot Id?</a><br>
                                        <a class="small" href="<%=request.getContextPath()%>/join/ForgotPassword.jsp">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="<%=request.getContextPath()%>/join/register.jsp">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        
                    </div>
                </div>
            </div>
        </div>

    </div>

<script>

</script>
    <!-- Bootstrap core JavaScript-->

    <!-- Core plugin JavaScript-->

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>
</html>






