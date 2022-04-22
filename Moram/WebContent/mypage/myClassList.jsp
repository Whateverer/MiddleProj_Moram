<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 관심 클래스 리스트</title>
	<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="/Moram/css/main.css">
	
	<style>
		.wrapper{
		  text-align: center;
		  margin : 50px 100px;
		}
	</style>
	
	<script>
		$(function(){
			
			$.ajax({
				
				url : '<%=request.getContextPath()%>/PreferClassList.do',
				dataType : 'json',
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				success : function(res){
					$.each(res, function(i, v){
					code = "<tr>";
					code += "<td>";
					code += "클래스번호 : " + v.class_no;
					code += "</td>";
					code += "<td>";
					code += "클래스이름 : " + v.class_name;
					code += "</td>";
					code += "</tr>";						
					})
					$('#list').html(code);
					
					
				}
				
			})
			
		})
	</script> 



</head>
<body>

<%@ include file="../static/header.jsp" %>
<div class="wrapper">
	<table border="1" id="list">
	
	
	</table>
</div>
<%@ include file="../static/footer.jsp" %> 
</body>
</html>