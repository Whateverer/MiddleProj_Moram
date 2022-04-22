<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
setTimeout() => {
	HttpSession session = request.getSession();
	<% session.invalidate(); 
	   response.sendRedirect(request.getContextPath() + "/login.jsp");%>
}, 1000);

</script>
</head>
<body>
<h1> 로그아웃 처리 되었습니다. </h1>
<h1> 1초 뒤 로그인 페이지로 이동합니다. </h1>


</body>
</html>