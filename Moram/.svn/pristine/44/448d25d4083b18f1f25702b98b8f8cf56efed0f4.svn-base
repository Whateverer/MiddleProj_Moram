<%@page import="moram.vo.CalendarVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/moram.js"></script>


<style>
#calendar{

	width: 700px;
	height: 500px;
	font-size: 0.5em;
	margin: 20px;
}

</style>
<title>모람 일정</title>
<script>
$(function(){

      //모람명 가져오기 - session으로(모람번호가져오기)
      let moramNo = '<%=request.getParameter("mrNo")%>'; //모람번호
      
       $.ajax({
    	url : '<%=request.getContextPath()%>/GetCalendar.do',
    	data : {'mrno' : moramNo},
    	dataType : 'json',
    	type : 'get',
    	
    	//모람번호 넘겨줘서 해당 모람의 일정 가져오기 - 모람번호로 바꾸기
    	success : function(res){
//     			console.log(moramNo);
				
    		//일정 하나씩 가져오기 - 일정 출력
    		 $.each(res, function(i,v){
    			console.log(v.board_writer);
    			console.log(v.board_title);
    			console.log(v.startd);
    			console.log(v.endd); 
    		})

    		var data = [];
    		
    		$.each(res,function(i,v){
    			var obj = {};
				obj.title = v.board_title;
				obj.writer = v.board_writer;
				obj.start = v.startd;
				obj.end = v.endd;
				data.push(obj);
		   })
		   
		   
    		//console.log(data);
//     		 document.addEventListener('DOMContentLoaded', function() {
    		var calendarEl = document.getElementById('calendar');
    		var calendar = new FullCalendar.Calendar(calendarEl, {
    		initialView: 'dayGridMonth',
    		//event
    		locale : 'ko',
    		events : data
    		        	  
//     		        	  [
//     		        	  {
//     		        		  title: '일정이름',
//     		        		  start: '2020-09-12T01:30:00',
//     		        		  end: '2020-09-12T02:30:00'
//     		        	  }
//     		          	]
    		        });
    		        
    		        calendar.render();
//     		      });
    		 
    	},
    	error : function(xhr){
    		alert("상태: " + xhr.status)
    	}
      }); 
       
    
}); 

     
      

    </script>
  </head>
  <body>
  
    <div id='calendar'></div>
  </body>
</html>