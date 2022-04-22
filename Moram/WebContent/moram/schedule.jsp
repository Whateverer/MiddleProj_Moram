<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link rel="stylesheet" href="/Moram/css/main.css">
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/js/moram.js"></script>
<script src="<%=request.getContextPath() %>/js/moramboard.js"></script>
<script src="<%=request.getContextPath() %>/js/moramInfo.js"></script>

<style>
/*  *{
   box-sizing: border-box; /* content-box*/
   border: 1px solid black;
} */

body{
 background-color: #E3E8F8;
}
#calendar{

	width: 700px;
	height: 500px;
	font-size: 0.5em;
	margin: 20px;
	display: inline-block;
	float: left;
}
#cal{
	width:800px;
	height:550px;
	

}
#cont {
	display: inline-block;
	float : left;
	border: 1px solid black;
}
table{
	text-align: center;
}
.tdMem {
	width : 100px;
	height: 30px;
	
}
.fc-daygrid-day-frame:hover{
	background: #CEECF5;
}
#scheduleTb{
	height: 500px;
	width: 300px;
	border: 5px dotted #b0c4de;
}

/* a태그 속성 */
.mrTab{
	cursor: pointer;
}	
.mrTab:link{
	text-decoration: none; 
	text-shadow: 0 0 24px; 
}
.mrTab:hover{
	text-decoration: none; 
	text-shadow: 0 0 24px; 
}
#notice{
	margin : 20px;
	margin-top : 30px;
}

</style>

<script>
$(function(){

      //모람명 가져오기 - session으로(모람번호가져오기)
      let moramNo = '<%=session.getAttribute("mrNo")%>'; //모람번호
      
       $.ajax({
    	url : '<%=request.getContextPath()%>/GetCalendar.do',
    	data : {'mrno' : moramNo},
    	dataType : 'json',
    	type : 'get',
    	
    	//모람번호 넘겨줘서 해당 모람의 일정 가져오기 - 모람번호로 바꾸기
    	success : function(res){
//     			console.log(moramNo);
				
    		//일정 하나씩 가져오기 - 일정 출력
    		/*  $.each(res, function(i,v){
    			console.log(v.board_writer);
    			console.log(v.board_title);
    			console.log(v.startd);
    			console.log(v.endd); 
    		})*/
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
    		events : data,
    		selectable: true
    		        	  
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
     
     // 캘린더 옆에 화면 출력
     $(document).on('click','.fc-daygrid-day-frame',function(){
    	 day = $(this).parents('td').attr('data-date');
    	 //alert(day); // 2021-12-24 형식으로 나옴
    	 
    	 //비우기
    	 $('#scheduleDetail').empty();
    	 
    	 //아무것도 없으면 이벤트 없음, 일정 있으면 옆에 append로 생기게
    	 $.ajax({
    		url : '<%=request.getContextPath()%>/ScheduleDetail.do',
    		data : { 'hout_sdate': day,
    				 'mr_no' : moramNo},
    		dataType : 'json',
    		success : function(res){
    			
    			//일정이 없을 때
    			if(res == ''){
	    			return false;
    			}else{ //일정이 있을 때
    				htmlCode = "<br><br><br><table border='3, dotted' id='scheduleTb'>";
	    			htmlCode += "<tr><td colspan='2'><h3>정모 목록</h3></td></tr>"
	    			$.each(res, function(i,v){
	    				htmlCode += "<tr><td colspan='2'>"+ (i+1)+'번째 정모' +"</td></tr>";
	    				htmlCode += "<tr><td>정모 제목</td> <td>" + v.board_title +"</td></tr>";
	    				htmlCode += "<tr><td>정모 내용</td> <td>" + v.board_cont +"</td></tr>";
	    				htmlCode += "<tr><td>작성자</td> <td>" + v.board_writer +"</td></tr>";
	    				htmlCode += "<tr><td>작성일</td> <td>" + v.board_wdate +"</td></tr>";
	    				htmlCode += "<tr><td>정모 날짜</td> <td>" + v.hout_sdate +"</td></tr>";
	    				htmlCode += "<tr><td>정모 장소</td> <td>" + v.hout_place +"</td></tr>";
	    				//console.log(v.mr_no); //모람 번호
	    				//console.log(v.board_title); // 게시글 제목
	    				//console.log(v.board_cont); // 게시글 내용
	    				//console.log(v.board_writer); // 작성자
	    				//console.log(v.board_wdate); // 게시글 작성일
	    				//console.log(v.hout_sdate); // 시작일
	    				//console.log(v.hout_place); // 장소
	    				
	    			});
	    			htmlCode += "</table>"
    				$('#scheduleDetail').html(htmlCode);
    			}
    		},
    		error : function(xhr){
    			alert(xhr.status);
    			
    		}
    	 });
    	 
     })
     
    
    
}); 

     
      

    </script>
    
    
<% 
	
	String mem_id = (String)session.getAttribute("sessionId");
	

	
%>

<script>
//사이트 시작시
$(function() {
	
//모람 번호 가져오기(moramMain애서)
let moramNo = '<%=session.getAttribute("mrNo")%>';
let mrNo = '<%=session.getAttribute("mrNo")%>';
console.log("moramNo : " + moramNo);
memId = '<%=mem_id%>';

// 모람에 가입된 회원(모라미): 탈퇴하기 - 가입되어있으면서 모라미
// 모람에 가입되지 않은 회원 : 가입하기, 관심설정 뜨게하기 - 0
// 모람지기: 강퇴하기 - 가입되어있으면서 모람지기

	//모람지기인지 체크
let jigiChk = null;
jigiChk = jigiChk1(mrNo);



	//location.href="http://localhost/Moram/moram/moramCalendar.jsp?mrNo="+mrNo+"";
	
//모람에 가입되어있는지 확인
// let memChk = null
// memChk = memChk1(mrNo);
	

// 	if(jigiChk == 1){//모람지기 일 때 
// 		$('#exile').attr('hidden', false);
		
// 	}else if(memChk == 1){//모람지기가 아니고 회원일 때
// 		$('#exit').attr('hidden', false);
	
// 	}else{//회원이 아닐 때
// 		$('#join').attr('hidden', false);
// 		$('#prefer').attr('hidden', false);
		
// 	}

	
// 	//console.log(moramNo);
// 	//게시판 누르면 화면에 출력
// 	$(document).on("click","#mrboard",function(){
// 		$.ajax({
<%-- 			  url : "<%=request.getContextPath()%>/moram/mrboard.jsp", --%>
// 			  type : "get",
// 			  success : function(rtnHtml){
// 				  $('#mrinfo__container').html(rtnHtml)
// 			  },
// 			  dataType : "html"
// 		  });
		
// 	});
	
// 	//메인 버튼 누르면 메인화면으로 이동
// 	$('#main').on('click', function(){
// 		location.href="/Moram/moram/moramInfo.jsp?mrNo="+mrNo+""
// 	});
	
// 	$("#prefer").on("click",function(){
// 		insertPrefer();
// 	});
	
// 	//스케쥴버튼 누르면 화면에 스케쥴 보이기
// 	$(document).on('click','#schedule', function(){
// 		location.href='schedule.jsp'
// 	});
	
	
	<%-- // 메인 로딩했을 때 모람 사진, 모람소개 가져오기 - 사진은 아직
	$.ajax({
		url : '<%=request.getContextPath()%>/GetMoramInfo.do',
		type : 'get',
		data : {"mrNo" : moramNo},
		dataType : 'json',
		success : function(res){
			console.log(res.mr_info);
			$('#cont').append(res.mr_info);
		},
		error : function(xhr){
			alert(xhr.status);
		}	
	})	 --%>
	
	//모람 가입하기 --가입창 뜨게하기
	$('#join').on('click', function(){
		//모람에 가입되어있는지 확인
		var num = checkMember();
	
		//반환 숫자가 0이면 가입 가능
		if(num == 0){
			//가입할건지 물어보기
			var input = confirm('모람에 가입하시겠습니까?');

			if(input){
				moramJoin();
				
			}else{
				return false;
			}
		}else{
			alert("이미 가입된 모람입니다.");
			return false;
		}
		
	})
	
	
	//모람의 가입한 회원 리스트 보이기(강퇴하기 위해)
	 $('#exile').on('click', function(){
		
		var win = window.open("exileMorami.jsp?mrno="+mrNo, "PopupWin", "width=500,height=600");
		
// 		var memArray = {};
// 		$.ajax({
// 			url : '/Moram/GetAllMorami.do',
// 			type: 'post',
// 			data: {"mr_no": mrNo},
// 			success : function(res){
// 				htmlCode ="<p>모라미 목록</p> <table border='1' id='moramiList' style='text-align:center;'>";
// 				htmlCode +="<tr><td>모라미 ID</td><td></td></tr>";
// 				 $.each(res, function(i,v){
// 					htmlCode += "<tr><td class='tdMem' style='width:200px;'>" + v.mem_id + "</td>";
// 					htmlCode += "<td><input type='button' class='exbtn' data-id='"+ v.mem_id +"' value='강퇴'></td></tr>";
					
// 				});
// 				 htmlCode += "</table>";
				
// 				 win.document.write(htmlCode);
				
				
// 			},
// 			error : function(xhr){
// 				alert(xhr.status);
				
// 			}
// 		});
		
	}); 
	
	
	//모람 탈퇴하기
	$('#exit').on('click', function(){
		var answer = confirm("정말 탈퇴하시겠습니까?");
		if(answer){
			moramExit();
			
		}else{
			return false;
		}
	});
	//탈퇴하기 전에 물어보기 - 모람지기면 탈퇴 불가
	//모라미면 정말 탈퇴하겠냐고 물어보고 탈퇴
	

})





</script>




</head>

<table>
	<tr><td colspan="2"></td></tr>
</table>
<body>


	<div id="mrinfo__container">
	<div>
	<p id="notice">일정이 있는 날짜를 클릭하면 상세 일정을 조회할 수 있어요!</p>

	
	</div>
    <div id='calendar'></div>
    
    <div id='scheduleDetail'></div>
</div>



</body>
</html>

 
  
  
