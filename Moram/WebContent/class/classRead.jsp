<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="<%=request.getContextPath() %>/js/class.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<% 
	String mem_id = (String)session.getAttribute("sessionId");
	String clNo = request.getParameter("clNo");
%>

<script>
$(function() {
	clNo = <%=clNo %>
	mem_id = <%=mem_id %>
	
})
</script>
 
</head>
<body>
<%@ include file="../static/header.jsp"%>

	<section id="clRead_container">
	<h2>클래스 정보입니다</h2>
	
	</section>


<%@ include file="../static/footer.jsp" %> 
</body>
</html>