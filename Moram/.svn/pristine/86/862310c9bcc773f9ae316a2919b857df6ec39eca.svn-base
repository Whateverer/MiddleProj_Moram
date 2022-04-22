<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/moramMain.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/js/moramboard.js"></script>
<script src="<%=request.getContextPath() %>/js/moramInfo.js"></script>

<% 
	
	String mem_id = (String)session.getAttribute("sessionId");
	session.setAttribute("mrNo", request.getParameter("mrNo"));

	
%>

<script>
//사이트 시작시
$(function() {
	
//모람 번호 가져오기(moramMain애서)
let moramNo = '<%=request.getParameter("mrNo")%>';
let mrNo = '<%=request.getParameter("mrNo")%>';
console.log("moramNo : " + mrNo);
memId = '<%=mem_id%>';

// 모람에 가입된 회원(모라미): 탈퇴하기 - 가입되어있으면서 모라미
// 모람에 가입되지 않은 회원 : 가입하기, 관심설정 뜨게하기 - 0
// 모람지기: 강퇴하기 - 가입되어있으면서 모람지기

	//모람지기인지 체크
let jigiChk = null;
jigiChk = jigiChk1(mrNo);



	//location.href="http://localhost/Moram/moram/moramCalendar.jsp?mrNo="+mrNo+"";
	
//모람에 가입되어있는지 확인
let memChk = null
memChk = memChk1(mrNo);
	
	

	if(jigiChk == 1){//모람지기 일 때 
		$('#exile').attr('hidden', false);
		$('#update').attr('hidden', false);
		
	}else if(memChk == 1){//모람지기가 아니고 회원일 때
		$('#exit').attr('hidden', false);
	
	}else{//회원이 아닐 때
		$('#join').attr('hidden', false);
		$('#mrPrefer').attr('hidden', false);
		
	}

	
	console.log(moramNo);
	//게시판 누르면 화면에 출력
	$(document).on("click","#mrboard",function(){
		if(jigiChk==0 && memChk == 0){
			alert("모람에 가입된 모라미들만 조회할 수 있습니다.");
			return false;
		}
		
		$.ajax({
			  url : "<%=request.getContextPath()%>/moram/mrboard.jsp",
			  type : "get",
			  data : {"mrNo" : mrNo},
			  success : function(rtnHtml){
				  $('#mrinfo__container').html(rtnHtml)
			  },
			  dataType : "html"
		  });
		
	});
	
	//사진첩 누르면 화면에 출력
	$(document).on("click","#album",function(){
		if(jigiChk==0 && memChk == 0){
			alert("모람에 가입된 모라미들만 조회할 수 있습니다.");
			return false;
		}
		$.ajax({
			  url : "<%=request.getContextPath()%>/moram/album.jsp",
			  type : "get",
			  data : {"mrNo" : mrNo},
			  success : function(rtnHtml){
				  $('#mrinfo__container').html(rtnHtml)
			  },
			  dataType : "html"
		  });
		
	});
	
	// 채팅 누르면 화면에 출력
	$(document).on("click","#chat",function(){
		if(jigiChk==0 && memChk == 0){
			alert("모람에 가입된 모라미들만 조회할 수 있습니다.");
			return false;
		}
		$.ajax({
			  url : "<%=request.getContextPath()%>/multichat/webSocketMutiChatting.jsp",
			  type : "get",
// 			  data : {"mrNo" : mrNo},
			  success : function(rtnHtml){
				  $('#mrinfo__container').html(rtnHtml)
			  },
			  dataType : "html"
		  });
		
	});
	
	//메인 버튼 누르면 메인화면으로 이동
	$('#main').on('click', function(){
		location.href="/Moram/moram/moramInfo.jsp?mrNo="+mrNo+""
	});
	
	$("#prefer").on("click",function(){
		insertPrefer();
	});
	
	//스케쥴버튼 누르면 화면에 스케쥴 보이기
	$(document).on('click','#schedule', function(){
		if(jigiChk==0 && memChk == 0){
			alert("모람에 가입된 모라미들만 조회할 수 있습니다.");
			return false;
		}
		$.ajax({
			  url : "<%=request.getContextPath()%>/moram/schedule.jsp",
			  type : "get",
			  data : {"mrNo" : mrNo},
			  success : function(rtnHtml){
				  $('#mrinfo__container').html(rtnHtml)
			  },
			  dataType : "html"
		  });
		//location.href='schedule.jsp';
	});
	
	
	// 메인 로딩했을 때 모람 사진, 모람소개 가져오기 - 사진은 아직
	$.ajax({
		url : '<%=request.getContextPath()%>/GetMoramInfo.do',
		type : 'get',
		data : {"mrNo" : moramNo},
		dataType : 'json',
		success : function(res){
			//console.log(res.mr_info);
			htmlCode="<table><tr><td class='tdMem'>"+res.moramjigi+"</td><td>모람지기</td></tr></table>"
			$('#cont').append(res.mr_info);
			$('#jigi').html(htmlCode);
			img = $('<img>').attr('src', '<%=request.getContextPath()%>/images/moram/'+res.mr_image);
			img = img.attr('id', 'mrImg');
			console.log(img);
			
			//사진
			$('#photo').append(img);
			
		},
		error : function(xhr){
			alert(xhr.status);
		}	
	})	
	
	// 모라미리스트 추가
	$.ajax({
		url : '<%=request.getContextPath()%>/GetAllMorami.do',
		type: 'post',
		data: {"mr_no": moramNo},
		success : function(res){
			if(res==''){
				htmlCode = "";
				
			}else{
				
				htmlCode ="<table id='moramiList'>";
				 $.each(res, function(i,v){
					htmlCode += "<tr><td class='tdMem'>" + v.mem_id + "</td><td>"+v.mr_info+"</td></tr>";
					
				});
				 htmlCode += "</table><br><br>";
			}
				$("#moramis").html(htmlCode);
				
		},
		error: function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	})
	
	//모람 관심설정
	chkMoramPrefer(mrNo);
	$('#mrPrefer').on('click', function(){
		if($("#mrPrefer").hasClass("btn-danger") === true) {
			MoramNotPrefer(mrNo);
		} 
		else { 
			MoramPrefer(mrNo);
		}
	});
	
	//모람 가입하기 --가입창 뜨게하기
	$('#join').on('click', function(){
		//모람에 가입되어있는지 확인
		var num = memChk;
	
		//반환 숫자가 0이면 가입 가능
		if(num == 0){
			//가입할건지 물어보기
			var input = confirm('모람에 가입하시겠습니까?');

			if(input){
				moramJoin(mrNo);
				//새로고침
				location.href="/Moram/moram/moramInfo.jsp?mrNo="+mrNo+""
			}else{
				return false;
			}
		}else{
			alert("이미 가입된 모람입니다.");
			return false;
		}
		
	})
	
	//모람 수정폼 띄우기 
	$('#update').on('click', function(){
		$('#mrinfoModal').modal('show');
		
		info=$('#cont').html().replace(/<br>/g, "\n");;
		$('.umrinfo').val(info);
	})
	
	//모람 정보수정 전송버튼 클릭
	$(document).on('click','#minfoin', function(){
		newInfo = $(this).parent().find('.umrinfo').val()
		newInfo = newInfo.replaceAll("\n", "<br>");
		//alert(newInfo);
		moramInfoUpdate(mrNo);
		
		$('#mrinfoModal').modal('hide');
    	
		location.href='moramInfo.jsp?mrNo='+mrNo;
	});
	
	
	//모람의 가입한 회원 리스트 보이기(강퇴하기 위해)
	 $('#exile').on('click', function(){
		
		var win = window.open("exileMorami.jsp?mrno="+mrNo, "PopupWin", "width=500,height=400");
		
	}); 
	
	
	//모람 탈퇴하기
	$('#exit').on('click', function(){
		var answer = confirm("정말 탈퇴하시겠습니까?");
		if(answer){
			moramExit(mrNo);
			//alert("회원 탈퇴했습니다.")
			//새로고침
			location.href="/Moram/moram/moramInfo.jsp?mrNo="+mrNo+""
		}else{
			return false;
		}
	})
	//탈퇴하기 전에 물어보기 - 모람지기면 탈퇴 불가
	//모라미면 정말 탈퇴하겠냐고 물어보고 탈퇴
	

})




</script>
<style>
/* 스케쥴 div */
#scheDiv{
	border: 5px dotted #f9f1a9;
	display: inline-block;
	margin-left: 30px;
	height: 100%;
}
#cal{
	width:800px;
	height:660px;
	

}
#cont {
	display: inline-block;
	float : left;
	min-height: 50px;
	
}
table{
	text-align: center;
}
.tdMem {
	width : 100px;
	height: 30px;
	
}
.containers{
	border: 5px dotted #b0c4de;
	display: inline-block;
	float : left;
	width : 250px;
	height: 700px;
	
	margin-left: 30px;
}
a:link { text-decoration: none; text-shadow: 0 0 24px; } 
a:visited { text-decoration: none; text-shadow: 0 0 24px; }
a:hover {text-decoration: none; text-shadow: 0 0 24px; color: #b0c4de}

/* 버튼 효과 */
.bt{
	border :1px solid #bdccd5;
	border-radius: 10%;
	color: white;
	background: #bdccd5;
	margin-top: 6px;
	margin-left: 20px;
	
}
.bt:hover{
	background: #97a6d2;
	color: #e7cad4;
}
#mrPrefer{
	border-radius: 10%;
	margin-top: 6px;
}

/* 이미지 크기 */
#mrImg{
	width : 100%;
	height : 100%;
}
.board_container th{
	text-align: center;
}
#update{
	margin-left:3px;
}

/* 모람 정보 수정 모달 */
#mrinfoModal{
	display: none;
}

</style>
</head>
<body>
<%@ include file="../static/header.jsp" %>


<!--모람 정보 수정 Modal -->
	<div id="mrinfoModal" class="modal fade writef" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body">모람 소개 수정
	        <form>
	        	 <textarea name="mr_info" class="intxt umrinfo" rows="10" cols="50"></textarea>
	        	 <br><input type="button" class="intxt btn" value="전송" id="minfoin">
	        </form>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>

	
<section>
<ul class="nav nav-tabs">
  <li class="active"id="main"><a href="#">Home</a></li>
  <li class="dropdown">
  <li><a class="mrTab" id="mrboard" >게시판</a></li>
  <li><a class="mrTab" id="album" >사진첩</a></li>
  <li><a class="mrTab" id="chat">채팅</a></li>
  <li><a class="mrTab" id="schedule">스케쥴</a></li>
  
	<li><input class="bt" type="button" id="join" value="가입하기" hidden="true"></li>
	<li><input  type="button" id="mrPrefer" value="관심등록" hidden="true"></li>
	<li><input class="bt" id="exile" type="button" value="강퇴하기" hidden="true"></li>
	<li><input class="bt" id="update" type="button" value="수정하기" hidden="true"></li>
	<li><input class="bt" id="exit" type="button" value="탈퇴하기" hidden="true"></li>
</ul>
	<div id="mrinfo__container">
	
	<br>
	<div class="containers">
		<div id="photo">
		<label>모람사진</label><br>
		</div>
		
		<br><br><hr>
	
		<label>모람 소개:</label><br>
		<div  id="cont"></div>
		
		<br><br><hr>
		
		<div  id="member" >
			<label>모람멤버</label>
			<div id="jigi">
			
			</div>
			<div id="moramis" style="overflow : auto;">
			
			</div> 
		</div>
	</div>
	
	<div id="scheDiv" style="overflow : auto;">
	  	<div style="width:500px; "><label>&nbsp;모람일정 - 모람의 정모 일정을 확인하세요!</label></div>
		
		<iframe id="cal" src="/Moram/moram/moramCalendar.jsp?mrNo=<%=request.getParameter("mrNo")%>" frameborder=0></iframe>
	</div>
</div>
</section>
<%@ include file="../static/footer.jsp" %>

</body>
</html>