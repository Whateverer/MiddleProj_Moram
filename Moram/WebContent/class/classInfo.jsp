<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script src="<%=request.getContextPath() %>/js/class.js"></script>
 <link rel="stylesheet" href="/Moram/css/main.css">
 <style>
 
/*  *{ */
/* 	box-sizing: border-box; /* content-box*/ */
/* 	border: 1px solid black; */
/* 	}  */
 .clabel{
	width: 100px;
}
 .clDiv{
	margin:30px;

 }
 #imgBox img{
 	width: 400px;
 	height: 400px;
 }
 #infoBox{
 	width: 400px;
 	height: auto;
 	min-height: 200px;
 	padding: 30px;
 	padding-left: 0px;
 }
 #reviewBox{
 	width: 400px;	
 	height: auto;
 }
 #lectureBox{
 	width: 400px;
 	height: auto;
 }
 #clBanner{
 	margin-left: 100px;	
 	text-align: center;
 }
 #clName{
 	font-size: 50px;
 }
 #clPrefer{
/*  	font-size: 20px; */
	
 }
 #clcenter{
	margin-left: 100px;	
 	width: 460px;
 	height: auto;
 	float: left;
 }
 #side{
 	width: 460px;
 	height: 1000px;
 	float: left;
 	
 	position: static;
 	top: 200px;
 	left: 900px;
 	
 }
 #clMenu{
 	margin-top: 30px;
 	margin-left: 30px;
 }
 .ltinfo{
 	padding:20px;
 	margin-left:50px; 
	word-break:break-all;
 }
 .carousel-control.left{
 	background-image: none;
}
 .carousel-control.right{
 	background-image: none;

 }
 #rezBtn{
	text-align: center;
 }
 li active{
 	display: none;
 }
 .clabel{
 	width: 100px;
 }
 .rediv{
 	margin: 10px;
 }
 .srediv{
 	text-align: right;
 	margin-left: 130px;
 }
 .bubble
{
	position: relative;
	width: 250px;
	height: auto;
	min-height: 80px;
	padding: 0px;
	background: #F7F7F7;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	
}

.bubble:after
{
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 15px 15px 15px 0;
	border-color: transparent #F7F7F7;
	display: block;
	width: 0;
	z-index: 1;
	left: -15px;
	top: 45px;
}
 .sbubble
{
	position: relative;
	width: 250px;
	min-height: 80px;
	height: auto;
	padding: 0px;
	background: #F7F7F7;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	
}
.sbubble:after
{
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 15px 0 15px 15px;
	border-color: transparent #F7F7F7;
	display: block;
	width: 0;
	z-index: 1;
	right: -15px;
	top: 45px;
}
#nRezBtn{
	display: none;

} 
#updateClRplform{
	display: none;
}
#cldelete,#lcBtn{
	display: none;
}
.carousel-control a:link, a:visited{
	color : gray;
}
.fc-view-harness .fc-view-harness-active{
	
}
#calendar{

}

#container {
    width: 500px;
    height: 500px;
    font-size: 15px;
    overflow:hidden
}
a{
	color : black;
}

 </style>
 <% 
	String clNo = request.getParameter("clNo");
    String memId = (String)session.getAttribute("sessionId");
    String memDiv = (String)session.getAttribute("sessionDiv");

%>
<script>
$(function(){
	
	clNo= "<%=clNo%>";
	memId="<%=memId%>";
	memDiv="<%=memDiv%>";
	
	// 클래스 상세정보
	classInfo();
	
	// 캘린더 조회
	clCalendar()
	
	// 클래스 삭제하기
	$('#cldelete').on('click', function() {
		if(confirm("삭제하시겠습니까?") == true){
			classDelete()
		}

	})

	// 관심설정
	$('#clPrefer').on('click', function() {
		if($("#clPrefer").hasClass("btn-danger") === true) {
			classNotPrefer()
		} 
		else { 
			classPrefer()
		}


	})
	
	// 강의 예약현황
	$(document).on("click","#rezListBtn",function(){
		lcNo = $(this).parent().find('.lcNo').val();
		
		windowObj = window.open("classRezList.jsp?ltNo="+lcNo+"", "예약현황", "width=500, height=500" );

		
	})
	
	// 강의 추가하기
	$(document).on("click","#lcBtn",function(){
		$('input[name=class_no]').val(clNo);
		$('#ltRegistModal').modal('show');
	})
	
	// 강의 추가하기 전송버튼 클락
	$(document).on("click","#ltRegist",function(){
		ltRdata = $('#ltRegistModal form').serializeArray();
		//$('#ltRegistModal').modal('hide');
		lectureRegist()
		
	})
	
	// 강의 수정하기
	$(document).on("click","#upBtn",function(){
		lcNo = $(this).parent().find('.lcNo').val();
		$('input[name=class_no]').val(clNo);
		$('#ltupdateModal').modal('show');
		
		ltNm = $(this).parent().find('.ltNm').text();
		ltinfo = $(this).parent().find('.ltif').html();
		ltinfo = ltinfo.replace(/<br>/g, "\n");
		console.log(ltinfo);
		ltdate = $(this).parent().find('.ltdate').text();
	//	ltdate = ltdate.replace(/\/\/g, "-");
		ltstime = $(this).parent().find('.ltstime').text();
		ltetime = $(this).parent().find('.ltetime').text();
		ltlimit = $(this).parent().find('.ltlimit').text();
		ltprice = $(this).parent().find('.ltprice').text();
		
		$('#ltupdateModal input[name=lecture_no]').val(lcNo);
		$('#ltupdateModal input[name=lecture_name]').val(ltNm);
		$('#ltupdateModal textarea[name=lecture_info]').val(ltinfo);
		$('#ltupdateModal input[name=lecture_sdate]').val(ltdate);
		$('#ltupdateModal input[name=lecture_stime]').val(ltstime);
		$('#ltupdateModal input[name=lecture_etime]').val(ltetime);
		$('#ltupdateModal input[name=lecture_limit]').val(ltlimit);
		$('#ltupdateModal input[name=lecture_price]').val(ltprice);
		
		
	})
	
	// 강의 수정하기 전송버튼 클락
	$(document).on("click","#ltupdate",function(){
		ltUdata = $('#ltupdateModal form').serializeArray();
		
		lectureUpdate()
		
		alert("예약자에게 변경사항을 알리세요");
		windowObj = window.open("classRezList.jsp?ltNo="+lcNo+"", "예약현황", "width=500, height=500" );	
	
		
	})
	
	// 강의 예약하기
	$(document).on("click","#rezBtn",function(){
		if(confirm("예약하시겠습니까?") == true){
			alert("예약이 완료되었습니다");
			lcNo = $(this).parent().find('.lcNo').val();
			
			$('input[value='+lcNo+']').parent().find('#nRezBtn').css("display", 'block');
			$('input[value='+lcNo+']').parent().find('#rezBtn').css("display", 'none');
			
			lectureRez();
			
		}
		
	})
	
	// 강의 예약 취소하기
	$(document).on("click","#nRezBtn",function(){
		if(confirm("예약을 취소하시겠습니까?") == true){
			alert("예약이 취소되었습니다");
			lcNo = $(this).parent().find('.lcNo').val();
			
			$('input[value='+lcNo+']').parent().find('#nRezBtn').css("display", 'none');
			$('input[value='+lcNo+']').parent().find('#rezBtn').css("display", 'block');
			
			lectureNotRez();
			
		}
		
	})
	
	// 강의 삭제하기
	$(document).on("click","#delBtn",function(){
		if(confirm("삭제하시겠습니까?") == true){
			alert("예약자에게 변경사항을 알리세요");
			windowObj = window.open("classRezList.jsp?ltNo="+lcNo+"", "예약현황", "width=500, height=500" );	
		}
		
		
	})
	// 이미지 수정하기 폼띄우기
	$(document).on("click","#cimgBtn",function(){
		$('#cimgModal').modal('show');
		
		
	})
	
	// 이미지 수정폼 확인 버튼
	$(document).on("click","#cimgin",function(){
		
		$('input[name=fileNm]').val(clNo);
		
		event.preventDefault();
	    
	    var form = $('#uploadForm')[0]
	    var data = new FormData(form);
	    
	    $('#btnUpload').prop('disabled', true);
		
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "/Moram/fileUpload.do",
	        data: data, 
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function (data) {
	        	$('#btnUpload').prop('disabled', false);
	        	$('#cimgModal').modal('hide');
	        	classInfo();
	        },
	        error: function (e) {
	            $('#btnUpload').prop('disabled', false);
	        }
	    });
		
	})
	
	// 클래스 정보 수정 폼띄우기
	$(document).on("click","#cinfoBtn",function(){
		$('#clinfoModal').modal('show');
		
		info=$('#spaninfo').html().replace(/<br>/g, "\n");;
		$('.uclinfo').val(info);
	})
	// 클래스 정보 수정 전송버튼 클락
	$(document).on("click","#cinfoin",function(){
		
		newInfo = $(this).parent().find('.uclinfo').val()
		
		classInfoUpdate();
		
		$('#clinfoModal').modal('hide');
    	classInfo();
	})
	
	// 댓글등록
	$(document).on("click","#cerplyin",function(){
		clRpCont = $(this).parent().find('#replyWrite').val();
		classReplyRegist()
	})
	


	// 댓글 수정버튼
	$(document).on('click','.cerplyUp', function() {
		
	    clRpNo = $(this).parent().find('.replyNo').text();
		
		oldCont = $(this).parent().find('.replyCont').html();
		oldCont = oldCont.replace(/<br>/g,"\n");
		
		$('#updateClRplform textarea').val(oldCont);
        
        $(this).parent().html($('#updateClRplform'));
        
        $('#updateClRplform').show();

	})
	
	// 댓글수정창에서 취소버튼 클릭
	$('#btnreset').on('click', function() {
		
		//modifyform을 다시 body로 append
		$('body').append($('#updateClRplform'));
		$('#updateClRplform').hide();
		
		classReplyList()
	})
	
	// 댓글수정창에서 확인버튼 클릭
	$('#btnok').on('click', function() {
		
		// textarea에서 수정한 내용을 가져오기 - textarea -\r\n -> <br>
		oldCont = $('#updateClRplform textarea').val();
		
		newCont = oldCont.replace(/\r/g, "").replace(/\n/g, "<br>");
		
		// 수정폼닫기
		$('body').append($('#updateClRplform'));
		$('#updateClRplform').hide();
		
		classReplyUpdate();
		
	
	})
	
	// 댓글삭제
	$(document).on("click",".creplyupDel",function(){
		clRpNo = $(this).parent().find('.replyNo').text();
		classReplyDelete()
	})
	
})
</script>
</head>
<body>
<%@ include file="../static/header.jsp" %>
	<section id="class_container">
		<div id="clBanner" class="">
			<span id="clName"></span> &ensp;
<!-- 			<span id="clPrefer">❤</span> -->
			<input type="button" id="clPrefer" class="btn btn-sm" value="관심설정">
			<input type="button" id="cldelete" class="btn btn-sm" value="클래스삭제">
			<input type="button" id="lcBtn" class="btn btn-sm" value="강의개설">
		</div>
		
		<div id="clcenter" class="clDiv">
			<div id="imgBox" class="clDiv">
			</div>
			
			<div id="infoBox" class="clDiv">
			</div>
			
			<div id="reviewBox" class="clDiv">
			</div>
		</div>
		
		<div id="side" class="clDiv">
		
			<div id="lectureBox" class="clDiv">
			</div>
			<div id='container'>
			<div id='calendar'></div>
			</div>
		</div> <!--사이드 -->

	</section>

	<!--강의개설 Modal -->
	<div id="ltRegistModal" class="modal fade writef" role="dialog">
	  <div class="modal-dialog">
	  
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">강의수정</h4>
	      </div>
	      <div class="modal-body">
	        <form>
	        	 <label class="clabel">✏ 강의내용</label><input type="text" class="intxt" name="lecture_name"><br>
	        	 <label class="clabel">내용</label><br>
	        	 <textarea name="lecture_info" class="intxt" rows="10" cols="50"></textarea><br>
	        	 <label class="clabel">🕛 강의시간</label>
	        	 <input type="date" class="intxt" name="lecture_sdate"><br>
	        	 <input type="time" class="intxt" name="lecture_stime">~
	        	 <input type="time" class="intxt" name="lecture_etime"><br>
	        	 <label class="clabel">👨‍👩‍👧‍👦 인원</label><input type="text" class="intxt" name="lecture_limit"><br>
	        	 <label class="clabel">₩ 강의금액</label><input type="text" class="intxt" name="lecture_price"><br>
	        	 <input type="hidden" class="intxt" name="class_no">
	        	 
	        	 <input type="button" class="btn" value="전송" id="ltRegist">
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!--강의수정  Modal -->
	<div id="ltupdateModal" class="modal fade writef" role="dialog">
	  <div class="modal-dialog">
	  
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">강의수정</h4>
	      </div>
	      <div class="modal-body">
	        <form>
	        	 <label class="clabel">✏ 강의내용</label><input type="text" class="intxt" name="lecture_name"><br>
	        	 <label class="clabel">내용</label><br>
	        	 <textarea name="lecture_info" class="intxt" rows="10" cols="50"></textarea><br>
	        	 <label class="clabel">🕛 강의시간</label>
	        	 <input type="date" class="intxt" name="lecture_sdate"><br>
	        	 <input type="time" class="intxt" name="lecture_stime">~
	        	 <input type="time" class="intxt" name="lecture_etime"><br>
	        	 <label class="clabel">👨‍👩‍👧‍👦 인원</label><input type="text" class="intxt" name="lecture_limit"><br>
	        	 <label class="clabel">₩ 강의금액</label><input type="text" class="intxt" name="lecture_price"><br>
	        	 <input type="hidden" class="intxt" name="lecture_no">
	        	 
	        	 <input type="button" class="btn" value="전송" id="ltupdate">
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	
	<!--클래스 정보 수정 Modal -->
	<div id="clinfoModal" class="modal fade writef" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body">
	        <form>
	        	 <textarea name="class_info" class="intxt uclinfo" rows="10" cols="50"></textarea>
	        	 <br><input type="button" class="intxt btn" value="전송" id="cinfoin">
	        </form>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 이미지 수정 Modal -->
	<div id="cimgModal" class="modal fade writef" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body">
	        <form method="POST" enctype="multipart/form-data" id="uploadForm">
    			<input type="file" name="profile"/>
    			<input type="hidden" name="fileNm"/>
    			<input type="hidden" name="folderNm" value="class"/>
   				 <button id='cimgin'>확인</button>
			</form>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
		
	<!--댓글수정폼 -->
	<div id="updateClRplform">
		<textarea rows="5" cols="50"></textarea>
		<input type="button" value="확인" id="btnok">
		<input type="button" value="취소" id="btnreset">
	</div>
	
	
		
<%@ include file="../static/footer.jsp" %> 
</body>
</html>