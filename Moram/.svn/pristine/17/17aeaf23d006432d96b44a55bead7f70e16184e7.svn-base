/**
 * 
 */

function insertAdminBoard(){
	$.ajax({
		url: "/Moram/adminBoardInsert.do",
		type: "post",
		data: adata,
		success: function(res) {
			$('.writeModal').modal('hide');
			
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

function replyList() {
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
				if(memDiv=='관리자' || memId==v.reply_writer){
					console.log(memDiv);
					console.log(memId);
					console.log(v.reply_writer);
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
		url: "/Moram/adminBoardInfo.do",
		type: 'post',
		data: { 'board_no' : boardNo,
			    'boardgr_no' : boardgrNo,
			    },			
		success: function(res) {
			$('.board_container').empty();

			
			binfo = "";
			binfo +="<div class='container'>";
			  binfo +="<table class='table table-condensed'>";
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
			      binfo +="</tr>";
			      binfo +="<tr>";
			        binfo +="<td colspan='3' class='bcont'>"+res.board_cont+"</td>";
			      binfo +="</tr>";
			      binfo +="<tr>";
			        binfo +="<td colspan='3'></td>";
			      binfo +="</tr>";
			      binfo +="<tr>";
			        binfo +="<td colspan='3'>";
			        binfo +="<input type='button' id='list' class='action btn' value='목록'>&nbsp;";
				if(memDiv=='관리자'){
					binfo += '<input type="button" id="update" class="action btn" value="수정">&nbsp;';
					binfo += '<input type="button" id="delete" class="action btn" value="삭제">';
				}
				binfo +="</td>";
			    binfo +="</tr>";
			    binfo +="</tbody>";
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
		    replyList()
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

function boardList(cpage) {
	$.ajax({
		url: "/Moram/adminBoardList.do",
		type: 'post',
		data: { 'boardNo' : boardgrNo,
				'cpage' : cpage,
				'mem_id' : memId,
			    'mem_div' : memDiv
		},
		
		success: function(res) {
			asc = res.acs;
			
			$('.board_container').empty();
			bList ="";
			if(boardgrNo==1 && memDiv=='관리자'){
				
				bList += '<input type="button" class="btn" id="nWrite" value="글쓰기">'

			}else if (boardgrNo==2 && memDiv=='관리자') {
				bList += '<input type="button" class="btn" id="nWrite" value="글쓰기">'

			}else if (boardgrNo==3) {
				bList += '<input type="button" class="btn" id="nWrite" value="질문하기">'	
			}
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
		    
		    $('.board_container').html(bList);
		    $('.board_container').append("<div class='board_page'></div>");
		    
		    $('.board_page').empty();
			 //이전버튼 만들기 
			 if(res.sp > 1) {
		     	pager='<ul class="pager">';
				pager +=' <li><a class="prev" href="#">Previous</a></li>';
				pager +=' </ul>';
				  
				$('.board_page').append(pager)
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
			  }
			
		    
		},
		error: function(xhr) {
			alert(xhr.status)
		},
		dataType: "json"
	})
}