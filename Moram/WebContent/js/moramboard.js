/**
 * 
 */

function boardImg() {
	$.ajax({
		url: "/Moram/boardImg.do",
		type : "post",
		data: {'board_no': boardNo
		},
		success: function(res) {
			
			bimg = '';
			
			$.each(res, function(i, v) {
				bimg += '<img src="/Moram/images/imageView.do?folderNm=board/'+mrNo+'/'+boardNo+'&fileNm='+v.attach_name+'">';
				
			})
			
			$('#bimg').html(bimg);
		},
		error: function(xhr) {
			alert(xhr.status)

		},
		dataType: "json"
		
	})
}
function boardLike() {
	$.ajax({
		url: "/Moram/BoardLike.do",
		type : "post",
		data: {'color' : color,
				'board_no': boardNo,
				'mem_id' : memId
		},
		success: function(res) {
			
		},
		error: function(xhr) {
			alert(xhr.status)

		},
		dataType: "json"
		
	})
}


function updateHOutBoard(){
	$.ajax({
		url: "/Moram/HOutBoardInsert.do",
		type: "post",
		data: hudata,
		success: function(res) {
			
			// 수정한 값 가져오기
			title = $('#hupdateModal .uTitle').val();
			content = $('#hupdateModal .uCont').val();
			date = $('#hupdateModal .uDate').val();
			stime = $('#hupdateModal .uStime').val();
			etime = $('#hupdateModal .uEtime').val();
			place = $('#hupdateModal .uPlace').val();
			
			content = content.replace(/\n/g, "<br>").replace(/\r/g, "");
			
			// list 화면에서 수정한 내용 출력하기
			$(blist).find('.btitle').text(title); // 제목 
			$(blist).find('.bcont').html(content); 
			$(blist).find('.bcont').html(date); 
			$(blist).find('.bcont').html(stime); 
			$(blist).find('.bcont').html(etime); 
			$(blist).find('.bcont').html(place); 
			
			
			$('#hupdateModal').modal('hide');
			
			$('.intxt').val('');
	    
		},
		error: function(xhr) {
			alert(xhr.status)

		},
		dataType: "json"
		})
}
function insertHOutBoard(){
	$.ajax({
		url: "/Moram/HOutBoardInsert.do",
		type: "post",
		data: hdata,
		success: function(res) {
			$('#hwriteModal').modal('hide');
			
			$('.intxt').val('');
			
			boardList(1);
			
		},
		error: function(xhr) {
			alert(xhr.status)

		},
		dataType: "json"
	})
}

function updateMrBoard(){
	$.ajax({
		url: "/Moram/MrBoardUpdate.do",
		type: "post",
		data: udata,
		success: function(res) {
			
			// 수정한 값 가져오기
			title = $('#updateModal .uTitle').val();
			content = $('#updateModal .uCont').val();
			
			content = content.replace(/\n/g, "<br>").replace(/\r/g, "");
			
			// list 화면에서 수정한 내용 출력하기
			$(blist).find('.btitle').text(title); // 제목 
			$(blist).find('.bcont').html(content); 
			
			
			$('#updateModal').modal('hide');
			
			$('.intxt').val('');
	    
		},
		error: function(xhr) {
			alert(xhr.status)

		},
		dataType: "json"
		})
}
function deleteMrBoard(){
	$.ajax({
		url: "/Moram/MrBoardDelete.do",
		type: "post",
		data: {'board_no' : boardNo},
		success: function(res) {
			boardList(1)
			
		},
		error: function(xhr) {
			alert(xhr.status)
			
		},
		dataType: "json"
	})
}

function replyList(asc) {
	$.ajax({
		url: "/Moram/MrReplyList.do",
		type: 'post',
		data: { 'board_no' : boardNo},			
		success: function(res) {
			rlist = "";
			$.each(res, function(i, v) {
				rlist += '<div class= "rediv">';
				rlist += "<p><span class='replyNo'>"+v.reply_no+"</span>&nbsp;&nbsp;"+ v.reply_writer +"&nbsp;&nbsp;"+v.reply_wdate+"</p>";
				rlist += "<p class='replyCont'>"+v.reply_cont+"</p>";
				if(asc>0 ||memId==v.reply_writer){
					rlist += '<input type="button" class="rupdate btn" value="수정">&nbsp;';
					rlist += '<input type="button" class="rdelete btn" value="삭제">';
				}
				rlist += '</div>';
			})
		
			$('.board_container').append(rlist);
	    
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
		})
}

function insertReply() {
	$.ajax({
		url: "/Moram/ReplyInsert.do",
		type: "post",
		data: { 'board_no' : boardNo,
		    	'mem_id' : memId,
		    	'reply_cont' : rWrite
		},
		success: function(res) {
			boardInfo()
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}
function updateReply() {
	$.ajax({
		url: "/Moram/ReplyUpdate.do",
		type: "post",
		data: {
			'reply_cont' : newCont,
			'reply_no' : replyNo
		},
		success: function(res) {
			boardInfo()
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}
function deleteReply() {
	$.ajax({
		url: "/Moram/ReplyDelete.do",
		type: "post",
		data: {
			'reply_no' : replyNo
		},
		success: function(res) {
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}

function boardInfo() {
	$.ajax({
		url: "/Moram/MrBoardInfo.do",
		type: 'post',
		data: { 'board_no' : boardNo,
			    'boardgr_no' : boardgrNo,
			    'mr_no' : mrNo,
			    },			
		success: function(res) {
			$('.board_container').empty();
			
			// 권한체크
			
			binfo = "";
			binfo +="<div class='container'>";
			  binfo +="<table class='table table-condensed'>";
			  
			if(boardgrNo==7){
				
				 binfo +="<thead>";
			      binfo +="<tr>";
			        binfo +="<th class='btitle'>"+res.board_title+"</th>";
			        binfo +="<th class='binfoR'>";
			        binfo +="<span class='heart'>♥</span>";
			        binfo +="<span class='like'>"+res.board_like+"</span>&nbsp;&nbsp;";
			        binfo +="<span class='eyes'>👀</span>";
			        binfo +="<span class='hit'>"+res.board_hit+"</span>";
			        binfo +="</th>";
			        binfo +="<th></th>";
			     binfo +=" </tr>";
			    binfo +="</thead>";
			   binfo +="<tbody>";
			      binfo +="<tr>";
			        binfo +="<td></td>";
			        binfo +="<td class='binfoR'>"+res.board_udate +"</td>";
			        binfo +="<td>"+res.mem_name+"</td>";
			      binfo +="</tr>";
			      binfo +="<tr>";
			      binfo +="<td colspan='3' class='bcont'>"+res.board_cont+"<br>정모일자 : "+res.hout_sdate;
			      
			      binfo +="<br>정모일자 : "+res.hout_sdate;
			  
			      binfo +="<br>정모시간 : "+res.hout_stime+" ~ "+res.hout_etime;
	
			      binfo +="<br>정모장소 : "+res.hout_place+"</td>";
			      binfo +="</tr>";
			      binfo +="<tr>";
			        binfo +="<td id='bimg' colspan='3'>";
			        binfo +="</td>";
			      binfo +="</tr>";
			      binfo +="<tr>";
			        binfo +="<td colspan='3'>";
			        binfo +="<input type='button' id='list' class='action btn' value='목록'>&nbsp;";
				if(asc>0 ||memId==res.board_writer){
					binfo += '<input type="button" id="update" class="action btn" value="수정">&nbsp;';
					binfo += '<input type="button" id="delete" class="action btn" value="삭제">';
				}
				binfo +="</td>";
			    binfo +="</tr>";
			    binfo +="</tbody>";
			}else {
			    binfo +="<thead>";
			      binfo +="<tr>";
			        binfo +="<th class='btitle'>"+res.board_title+"</th>";
			        binfo +="<th class='binfoR'>";
			        binfo +="<span class='heart'>♥</span>";
			        binfo +="<span class='like'>"+res.board_like+"</span>&nbsp;&nbsp;";
			        binfo +="<span class='eyes'>👀</span>";
			        binfo +="<span class='hit'>"+res.board_hit+"</span>";
			        binfo +="</th>";
			        binfo +="<th></th>";
			     binfo +=" </tr>";
			    binfo +="</thead>";
			   binfo +="<tbody>";
			      binfo +="<tr>";
			        binfo +="<td></td>";
			        binfo +="<td class='binfoR'>"+res.board_udate +"</td>";
			        binfo +="<td>"+res.mem_name+"</td>";
			      binfo +="</tr>";
			      binfo +="<tr>";
			        binfo +="<td colspan='3' class='bcont'>"+res.board_cont+"</td>";
			      binfo +="</tr>";
			      binfo +="<tr>";
			        binfo +="<td id='bimg' colspan='3'>";
			        binfo +="</td>";
			      binfo +="</tr>";
			      binfo +="<tr>";
			        binfo +="<td colspan='3'>";
			        binfo +="<input type='button' id='list' class='action btn' value='목록'>&nbsp;";
				if(asc>0 ||memId==res.board_writer){
					binfo += '<input type="button" id="update" class="action btn" value="수정">&nbsp;';
					binfo += '<input type="button" id="delete" class="action btn" value="삭제">';
				}
				binfo +="</td>";
			    binfo +="</tr>";
			    binfo +="</tbody>";

			}
			  binfo +="</table>";
			  binfo +="</div>";
			  
			  
			binfo += '<p>';
			binfo += '<textarea class="form-control" id ="replyWrite" rows="" cols="100"></textarea>';
			binfo += '<input type="button" value="등록 " id="replyBtn" class="action btn">';
			binfo += '</p>';
			
		    $('.board_container').html(binfo);
		    
		    // 좋아효한 상태인지 체크
		    chkBoardLike();
		    
		    // 댓글리스트
		    replyList(asc);
		    
		    // 게시글의 이미지들 가져오기
		    boardImg();
		    
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}

function updateBoardHit() {
	$.ajax({
		url: "/Moram/BoardHitUpdate.do",
		type: "post",
		data: {
			'board_no' : boardNo
		},
		success: function(res) {
			
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}

function chkBoardLike() {
	$.ajax({
		url: "/Moram/BoardLikeChk.do",
		type: "post",
		data: {
			'board_no' : boardNo,
			'mem_id' : memId
		},
		success: function(res) {
			if(res.sw=='성공'){
				$('.heart').css('color', 'rgb(255, 0, 0)');
			}else {
				$('.heart').css('color', 'rgb(220,220,220)');
			}
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}

function boardList(cpage) {
	$.ajax({
		url: "/Moram/MrBoardList.do",
		type: 'post',
		data: { 'boardNo' : boardgrNo,
				'mrNo' : mrNo,
				'cpage' : cpage,
				'mem_id' : memId,
			    'mem_div' : memDiv
		},
		
		success: function(res) {
			asc = res.acs;
			
			$('.board_container').empty();
			bList ="";
			
			bList += "<table class='table table-striped'>";
			bList += "<thead>";
			bList += "<tr>";
			bList += "<th>글번호</th>";
			bList += "<th>제목</th>";
			bList += "<th>작성자</th>";
			bList += "</tr>";
			bList += "</thead>";
			bList += "<tbody>";
			$.each(res.datas, function(i, v) {
				bList += "<tr class='board'>";
				bList += " <td class='boardNo'>"+v.board_no+"</td>";
				bList += "<td>"+v.board_title+"</td>";
				bList += " <td>"+v.mem_name+"</td>";
				bList += " </tr>";
			})
			
		    bList += "</tbody>";
		    bList += "</table>";
		    if(boardgrNo==7){
				bList += '<input type="button" class="btn" id="hWrite" value="정모올리기">'

			}else if (boardgrNo==8) {
				bList += '<input type="button" id="vWrite" value="투표올리기">'

			}else if (boardgrNo==4) {
				if(asc>0){
					bList += '<input type="button" id="bWrite" class="btn" value="글쓰기">'
				}
			}else {
				
				bList += '<input type="button" id="bWrite" class="btn" value="글쓰기">'
			}
		    $('.board_container').html(bList);
		    $('.board_container').append("<div class='board_page'></div>");
		    $('.board_page').empty();
		
			 //이전버튼 만들기 
			 if(res.sp > 1) {
		     	pager = '<ul class="pager">';
				pager +=' <li><a class="prev" href="#">Previous</a></li>';
				pager +=' </ul>';
				  
				$('.board_page').append(pager)
				console.log(pager);
			}
			 //페이지번호 만들기 
			  pager = '<ul class="pagination pager">';
			  for(i=res.sp; i<=res.ep; i++){
				if(currentPage == i) {
					 pager += '<li class="active"><a class="paging" href="#">'+i+'</a></li>';
				}else{
					 pager += '<li><a class="paging" href="#">'+i+'</a></li>';
				} 
			 }
			  pager += '</ul>';
			  $('.board_page').append(pager) 
			  
			 //다음버튼 만들기 
			  if(res.ep < res.tp){
				  pager='<ul class="pager">';
				  pager +=' <li><a class="next" href="#">Next</a></li>';
				  pager +=' </ul>';
				  
				  $('.board_page').append(pager)
				  console.log(pager);
			  }
		    
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}