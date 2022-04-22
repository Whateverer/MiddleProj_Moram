/**
 * 
 */

function clCalendar(){
    $.ajax({
      	url : '/Moram/ClCalendar.do',
      	data : {'clNo' : clNo},
      	dataType : 'json',
      	type : 'post',
      	
      	success : function(res){
//       			
      		var data = [];
      		
      		$.each(res,function(i,v){
      			var obj = {};
  				obj.title = v.lecture_name;
  				obj.start = v.startd;
  				obj.end = v.endd;
  				data.push(obj);
  		   })
  		   

      		var calendarEl = document.getElementById('calendar');
      		var calendar = new FullCalendar.Calendar(calendarEl, {
      		initialView: 'dayGridMonth',
      		//event
      		locale : 'ko',
      		events : data,
      		height: 550, 
      		contentHeight:"auto",
      		selectable: true

      		        });
      		        
      		        calendar.render();
      		 
      	},
      	error : function(xhr){
      		alert("상태: " + xhr.status)
      	}
      	
 })
}
function youMoramSem(){
	$.ajax({
		url: "/Moram/YouMoramSem.do",
		type: "post",
		data: {
			'mem_id' : memId
		},
		success: function(res) {
			if(res.sw=='실패'){
				$('#classRegist').show();
			}
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}

function classRegist(){
	
}

function classInfoUpdate(){
	$.ajax({
		url: "/Moram/ClassInfoUpdate.do",
		type: "post",
		data: {
			"class_no" : clNo,
			"class_info": newInfo
		},
		success: function(res) {
			classInfo()
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}

function classDelete(){
	$.ajax({
		url: "/Moram/ClassDelete.do",
		type: "post",
		data: {"mem_id" : memId,
			 "class_no" : clNo
		},
		success: function(res) {
			
		
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}
function chkClassPrefer() {
	$.ajax({
		url: "/Moram/ChkClassPrefer.do",
		type: "post",
		data: {
			"class_no" : clNo,
			'mem_id' : memId
		},
		success: function(res) {
			if(res.sw=='성공'){
				$("#clPrefer").addClass("btn-danger");
			}else {
				$("#clPrefer").removeClass("btn-danger");
			}
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}
function classPrefer(){
	$.ajax({
		url: "/Moram/ClassPrefer.do",
		type: "post",
		data: {"mem_id" : memId,
			  "class_no" : clNo
		},
		success: function(res) {
			$("#clPrefer").addClass("btn-danger");
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

function classNotPrefer(){
	$.ajax({
		url: "/Moram/ClassNotPrefer.do",
		type: "post",
		data: {"mem_id" : memId,
			  "class_no" : clNo
		},
		success: function(res) {
			$("#clPrefer").removeClass("btn-danger");
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

function myClassList(){
	$.ajax({
		url: "/Moram/MyClassList.do",
		type: "post",
		data: {"mem_id" : memId,
			  "mem_div" : memDiv
		},
		success: function(res) {
			$('#myClassList').empty();
			$.each(res, function(i, v) {
				clist = "";
				clist += '<div class="clinfo" clNo="'+v.class_no+'">';
				clist += '<img src="/Moram/images/imageView.do?folderNm=class&fileNm='+v.class_image+'"><br><br>';
				clist += v.class_name;
				clist += '</div>';
				$('#myClassList').append(clist);
			})
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

function recClassList(){
	$.ajax({
		url: "/Moram/RecClassList.do",
		type: "post",
		data: {"mem_id" : memId,
		},
		success: function(res) {
			$('#recClassList').empty();
			$.each(res, function(i, v) {
				clist = "";
				clist += '<div class="clinfo" clNo="'+v.class_no+'">';
				clist += '<img src="/Moram/images/imageView.do?folderNm=class&fileNm='+v.class_image+'"><br><br>';
				clist += v.class_name;
				clist += '</div>';
				$('#recClassList').append(clist);
			})
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}



function categoryClassList(){
	$.ajax({
		url: "/Moram/CategoryClassList.do",
		type: "post",
		data: {"subject_name" : subjectNm,
		},
		success: function(res) {
			$('#recClassList').empty();
			$.each(res, function(i, v) {
				clist = "";
				clist += '<div class="clinfo" clNo="'+v.class_no+'">';
				clist += '<img src="/Moram/images/imageView.do?folderNm=class&fileNm='+v.class_image+'"><br><br>';
				clist += v.class_name;
				clist += '</div>';
				$('#recClassList').append(clist);
			})
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

function classInfo(){
	clAddr =  "";
	$.ajax({
		url: "/Moram/ClassInfo.do",
		type: "post",
		data: {"class_no" : clNo,
			   "mem_id" : memId
		},
		success: function(res) {
			clAddr = res.class_addr;
			clAcs = res.class_acs;
			semId= res.mem_id;
			
			
			$('#clName').text(res.class_name);
			
			cimg='<img src="/Moram/images/imageView.do?folderNm=class&fileNm='+res.class_image+'">'
			
			// 해당 클래스 모람쌤만 수정버튼 출력
			if(clAcs>0){
			cimg += '<br><br><input type="button" class="btn btn-xs" value="수정하기" id="cimgBtn">';
			}
			$('#imgBox').html(cimg);
			
			cinfo = '<span id="spaninfo">'+res.class_info+'</span>';
//			cinfo= '<input type="hidden" id="haddr" claddr="'++'">';
			cinfo = cinfo.replace(/\n/g, "<br>").replace(/\r/g, "");
			if(clAcs>0){
				cinfo += '<br><br><input type="button" class="btn btn-xs" value="수정하기" id="cinfoBtn">';
			}
			$('#infoBox').html(cinfo);
			
			
			
			// 클래스의 강의들
			lectureOfClass();
			
			// 관심설정한 상태인지 체크
			chkClassPrefer();
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

function cinfoImgUpdate(){
	$.ajax({
		url: "/Moram/fileUpload.do",
		type: "post",
		data:{'fileNM' : 'class',
			   'folderNm' : clNo
			   }, 
		success: function(res) {
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

function lectureRegist(){
	$.ajax({
		url: "/Moram/LectureRegist.do",
		type: "post",
		data: ltRdata, 
		success: function(res) {
			$('#ltRegistModal').modal('hide');
			
			$('.intxt').val('');
			classInfo()
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

function lectureUpdate(){
	$.ajax({
		url: "/Moram/LectureUpdate.do",
		type: "post",
		data: ltUdata, 
		success: function(res) {
			$('#ltupdateModal').modal('hide');
			
			$('.intxt').val('');
			classInfo()
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
			
	})
}

function lectureDelete(){
	$.ajax({
		url: "/Moram//LectureDelete.do",
		type: "post",
//		data:{'lecture_no' : }, 
		success: function(res) {
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

function lectureRezList(){
	$.ajax({
		url: "/Moram/LectureRezList.do",
		type: "post",
		data:{'lecture_no' : lcNo}, 
		success: function(res) {
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

function lectureRez(){
	$.ajax({
		url: "/Moram/LectureRez.do",
		type: "post",
		data:{'lecture_no' : lcNo,
			  "mem_id" : memId}, 
		success: function(res) {
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
	
	
}

function lectureNotRez(){
	$.ajax({
		url: "/Moram/LectureRezNot.do",
		type: "post",
		data:{'lecture_no' : lcNo,
			  "mem_id" : memId}, 
		success: function(res) {
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

function lectureOfClass(){
	$.ajax({
		url: "/Moram/LectureOfClass.do",
		type: "post",
		data: {"class_no" : clNo,
		},
		success: function(res) {
			
			ltinfo ='';
			if(clAcs>0){
				$('#cldelete').show();
				$('#lcBtn').show();
			}
			if(res.length==0){
				ltinfo += '<h2>강의 <br>준비중...</h2>'
			}
	
			ltinfo += '<div id="slideWrap" class="carousel" data-ride="carousel">';
			ltinfo += '<div class="container">';
			ltinfo += '<div id="myCarousel" class="carousel slide" data-ride="carousel">';
			ltinfo += '<div class="carousel-inner">';
			$.each(res, function(i, v) {
				if(i==0){
					ltinfo += '<div class="item active">';
				}else {
					ltinfo += '<div class="item">';
				}
				ltinfo += '<div class="ltinfo">';
				ltinfo += '<input type="hidden" class="intxt lcNo" id="lcNo" value="'+v.lecture_no+'">';
				ltinfo += '✔ 이름 <br>';
				ltinfo += '<span class="ltNm">'+v.lecture_name+'</span> <br><br>';
				ltinfo += '✏ 강의내용 <br>';
				ltinfo += '<span class="ltif">'+v.lecture_info+'</span><br><br>';
				ltinfo += ' 📌 장소 <br>';
				ltinfo += '<span class="">'+clAddr+'</span><br><br>';
				ltinfo += '🕛 강의시간 <br>';
				ltinfo += '<span class="ltdate">'+v.lecture_sdate+'</span><br>';
				ltinfo += '<span class="ltstime">'+v.lecture_stime+'</span>~<span class="ltetime">'+v.lecture_etime+'</span><br><br>';
				ltinfo += '👨‍👩‍👧‍👦 인원 <br>';
				ltinfo += '<span class="ltlimit">'+v.lecture_limit+'</span><br><br>';
				ltinfo += '₩ 강의금액<br>';
				ltinfo += '<span class="ltprice">'+v.lecture_price+'</span><br><br>';
				
				if(clAcs>0){
					ltinfo += '<input type="button" class="btn btn-sm" value="예약현황" id="rezListBtn">&nbsp;';					
					ltinfo += '<input type="button" class="btn btn-sm" value="수정하기" id="upBtn">&nbsp;';
					ltinfo += '<input type="button" class="btn btn-sm" value="삭제하기" id="delBtn">';
				}else {
					lectureRezChk(v.lecture_no);
					ltinfo += '<input type="button" class="btn btn-sm" value="예약취소" id="nRezBtn">';					
					ltinfo += '<input type="button" class="btn btn-sm" value="예약하기" id="rezBtn">';
				}	
				
				ltinfo += '</div>';
				ltinfo += '</div>';
			})
			ltinfo += '<a class="left carousel-control" href="#myCarousel" data-slide="prev">';
			ltinfo += '<span class="glyphicon glyphicon-chevron-left"></span>';
			ltinfo += '<span class="sr-only">Previous</span>';
			ltinfo += '<a class="right carousel-control" href="#myCarousel" data-slide="next">';
			ltinfo += '<span class="glyphicon glyphicon-chevron-right"></span>';
			ltinfo += '</a>';
			ltinfo += '<span class="sr-only">Next</span>';
			ltinfo += '</a>';
			
			ltinfo += '</div>';
			ltinfo += '</div>';
			ltinfo += '</div>';
			
			
			
			$('#lectureBox').html(ltinfo);
			
			classReplyList()
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}
function lectureRezChk(lcNo) {
	$.ajax({
		url: "/Moram/LectureRezChk.do",
		type: "post",
		data:{'lecture_no' : lcNo,
			  "mem_id" : memId},
		success: function(res) {
			if(res.sw=='성공'){
			
				$('input[value='+lcNo+']').parent().find('#nRezBtn').css("display", 'block');
				$('input[value='+lcNo+']').parent().find('#rezBtn').css("display", 'none');
			}
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

function completeLecture(){
	
}
function classReplyAcs(){
	$.ajax({
		url: "/Moram/.do",
		type: "post",
		data:{"class_no" : clNo
		}, 
		success: function(res) {
			
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}

function classReplyList(){
	$.ajax({
		url: "/Moram/ClassReplyList.do",
		type: "post",
		data:{"class_no" : clNo,
			  "mem_id" : memId	
		}, 
		success: function(res) {
			$('#reviewBox').empty();
			rlist='';
			//rlist += '<p>';
			rlist += '<h3>문의하기</h3>';
			rlist += '<textarea class="form-control" id ="replyWrite" rows="" cols="100"></textarea>';
			rlist += '<input type="button" value="등록 " id="cerplyin" class="action btn btn-sm">';
			//rlist += '</p>';
			$.each(res, function(i, v) {
				if(semId==v.classcmt_writer){
					rlist += '<div class= "srediv sbubble">';
				}else {
					rlist += '<div class= "rediv bubble">';
				}
				rlist += "<p><span class='replyNo'>"+v.classcmt_no+"</span>&nbsp;&nbsp;"+ v.mem_name +"&nbsp;&nbsp;"+v.classcmt_wdate+"</p>";
				rlist += "<p class='replyCont'>"+v.classcmt_cont.replace(/\r/g, "").replace(/\n/g, "<br>")+"</p>";
				if(memDiv=='관리자' || memId==v.classcmt_writer){
					rlist += '<input type="button" class="cerplyUp btn btn-sm" value="수정">&nbsp;';
					rlist += '<input type="button" class="creplyupDel btn btn-sm" value="삭제">';
				}
				rlist += '</div>';
			})
			$('#reviewBox').append(rlist);
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}


function classReplyRegist(){
	$.ajax({
		url: "/Moram/ClassReplyRegist.do",
		type: "post",
		data:{"class_no" : clNo,
			  "mem_id" : memId,
			  "classcmt_cont" : clRpCont
		}, 
		success: function(res) {
			classReplyList();
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}
function classReplyUpdate(){
	$.ajax({
		url: "/Moram/ClassReplyUpdate.do",
		type: "post",
		data:{"classcmt_no" : clRpNo,
			  "mem_id" : memId,	
			  "classcmt_cont" : newCont
		}, 
		success: function(res) {
			classReplyList();
		},
		error: function(xhr) {
			alert(xhr.status) 
		},
		dataType: "json"
		
	})
}

function classReplyDelete(){
	$.ajax({
		url: "/Moram/ClassReplyDelete.do",
		type: "post",
		data:{"classcmt_no" : clRpNo,
		}, 
		success: function(res) {
			classReplyList();
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		
	})
}




