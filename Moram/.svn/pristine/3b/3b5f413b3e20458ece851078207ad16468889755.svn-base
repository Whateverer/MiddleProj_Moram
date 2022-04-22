<%@page import="moram.vo.Calendar2VO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  //서블릿에서 수행결과 공유
  ArrayList<Calendar2VO> list = (ArrayList<Calendar2VO>)request.getAttribute("res");
  /*
	 "groupId" : , "writer": , "content": ,생략
  */
%>
[
<%
	for(int i=0;i<list.size();i++){
		Calendar2VO vo = list.get(i);
		if(i>0) out.print(",");
%>		
	{
		
		"title" : "<%=session.getAttribute("sessionId")%>",
		"start": "<%=vo.getStartd() %>", 
		"end": "<%=vo.getEndd() %>", 
		"state" : "<%=vo.getPlacetime_state()%>",
		"ptno" : "<%=vo.getPlacetime_no() %>",
		<% if(vo.getPlacetime_state().equals("예약가능")){%>
		"editable" : false,
		"color" : "blue"
		<%}else{ %>
		"editable" : false,
		"color" : "red"
		<%}%>
		
	}
<%
}
%>
]
  