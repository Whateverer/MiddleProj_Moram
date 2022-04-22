<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="/Moram/css/main.css">
	
	<style>
		.wrapper{
		  text-align: center;
		  margin : 50px auto;
		}
	</style>
	
	<script>
		$(function(){
			
			$('#no').on('click', function(){
				location.href="http://localhost/Moram/mypage/plpay.jsp";
			})
			
			
			$('#yes').on('click', function(){
			
				$.ajax({
					url : '<%=request.getContextPath()%>/PlaceTimeRezRepay.do',
					data : {"payNo" : '<%=request.getParameter("payNo")%>'},
					error : function(xhr){
						alert("상태 : " + xhr.status);
					},
					success : function(res){
						alert(res);
					},
					dataType : 'json'
					
				})
				
			})
			
			
			
		})
	</script>

</head>
<body>
<%@ include file="../static/header.jsp" %>
<div class="wrapper">
	결제번호 : <%=request.getParameter("payNo") %>
	<h2>정말 환불 하시겠습니까??</h2>
	<input type="button" value="네" id="yes">
	<input type="button" value="아니요" id="no">
</div>
<%@ include file="../static/footer.jsp" %> 
</body>
</html>