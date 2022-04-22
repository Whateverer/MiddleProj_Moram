<%@page import="java.util.List"%>
<%@page import="moram.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   
    List<BoardVO> list = (List<BoardVO>) request.getAttribute("list");
	Integer spage = (Integer) request.getAttribute("sPage");
	Integer epage = (Integer) request.getAttribute("ePage");
	Integer tpage = (Integer) request.getAttribute("tPage");
	
%>
{
	"tp" : "<%= tpage %>",
	"sp" : "<%= spage %>",
	"ep" : "<%= epage %>",
	"datas" : [

	<%
	
		for(int i=0; i<list.size(); i++){
			BoardVO vo = list.get(i);
			if(i>0) out.print(",");
		
	%>
		{
			"board_no" : "<%=vo.getBoard_no() %>",
			"board_title" : "<%=vo.getBoard_title() %>",
			"mem_name" : "<%=vo.getMem_name() %>"
			
		}
		
	<%
	}
	%>
	
]

}