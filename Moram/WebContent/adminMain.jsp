<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" href="/Moram/css/main.css">
  
  <style>
   	#mainSection{ 
   		float : right;
   		width: 80%; 
   	} 
   	#mainPage{ 
   		width: 100%; 
   		height: 98%; 
   		margin: 10px; 
   	} 
    #moram{ 
    	display : inline-block;
    	padding-top: 40px;
    }  
   	#fixmoram{ 
   		width: 85%; 
   	} 
   	.btn{ 
   		float: right; 
   		margin-top: 50px; 
   		
   	} 
   	#moramMain, #classMain{ 
   		background: gray; 
   	} 
  	
    #mainPage div{  
 	   		display: inline-block;  
 	   		height: 400px;  
 	   		width: 250px;  
	   		margin: 30px;	  
     }  
  	#mainPage2 div{
  		display : inline-block;
  		height: 400px;
  		width: 250px;
  		margin: 30px;
  	}
   	 hr{  
   	 		clear: both;  
   	 }  
   	 
   	 #adminlogo{
   	 	margin-left: 14%;
   	 	margin-bottom: 50%;
   	 }
  	
  </style>
  
    <script>
  	$(function(){
  		

  		code = "<img id='adminlogo' src='/Moram/images/logo.png'>";
  		
  				$('#mainSection').html(code);
  				
  			

  		
  	})
  	
  </script>
  
</head>
<body>
<%@ include file="../static/adminheader.jsp" %> 
<%String sessionId = (String)session.getAttribute("sessionId"); %>
	<section id="mainSection">관리자 메인 페이지 입니다 <%=sessionId %>>
	
	</section>
	<%@ include file="../static/footer.jsp" %> 
</body>
</html>