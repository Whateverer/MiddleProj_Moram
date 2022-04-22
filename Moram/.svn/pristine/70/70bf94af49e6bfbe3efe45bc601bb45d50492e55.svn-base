<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 서블릿에서 수행결과 공유 
	String res = (String)request.getAttribute("res");
	if(res!=null){
%>		
	{"sw" : "이메일 코드 검증 완료~"}
	
	<%}else{%>
	
	{"sw" : "이메일 코드가 틀렷습니다. 다시 시행해 주세요"}
	
<%
}
%>