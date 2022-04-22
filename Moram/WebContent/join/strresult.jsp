<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 서블릿에서 수행결과 공유 
	String res = (String)request.getAttribute("res");
	if(res==null){
%>		
	{"sw" : "사용할 수 있는 아이디 입니다."}
	
	<%}else{%>
	
	{"sw" : "이미 가입된 아이디 입니다."}
	
<%
}
%>