<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/adminboard.js"></script>
<style>
/*  *{ */
/* 	box-sizing: border-box; /* content-box*/ */
/* 	border: 1px solid black; */
/* } */
.clabel{
	width: 100px;	
}

.pager{
  	width: 100px;
  	float: left;
  	margin: 5px;
 }
 #updateRplform{
 	display: none;
 }
 .heart{
	 font-size:20px;
	 color: rgb(220,220,220); 

 }
 .eyes{
	 font-size:15px;
	 

 }
 .btitle{
 	font-size : 40px;
 }
 .bcont{
 	height : 300px;
 }
 .binfoR{
 	text-align: right;
 }
 .board_container{
 	width: 100%;
 }
 .container {
    padding-right: 0px;
    padding-left: 0px;
    margin-right: 0px;
    margin-left: 0px;
}
.table table-condensed{
	width: auto;
}
</style>
<script>
<%
String memId = (String)session.getAttribute("sessionId");
String memDiv = (String)session.getAttribute("sessionDiv"); 
%>
$(function() {
currentPage = 1;
memId="<%=memId%>";
memDiv="<%=memDiv%>";
boardgrNo = <%=request.getParameter("grNo") %>
	
	boardList(currentPage)
	
	// 게시판 항목중 하나를 클릭시 (공지,자유,후기...)
// 	$(document).on("click","a.menu", function(){
// 		boardgrNo = $(this).attr("grNo");		
		
		
		
// 	});
	
	// 리스트에서 한 게시글을 선택할시
	$(document).on("click",".board", function(){
		boardNo = $('.boardNo', this).text();
		// 조회수 올리기
		updateBoardHit();
		
		// 게시글 정보 가져오기
		boardInfo()
	});
	
	// 페이지번호 리스트 이벤트
	$(document).on('click', '.paging', function() {
		currentPage = $(this).text().trim();
		boardList(currentPage);
	})
	
	// next 이벤트
	$(document).on('click', '.next', function() {
		currentPage = parseInt($('.paging').last().text().trim()) + 1;
		boardList(currentPage);
	})
	
	// prev 이벤트
	$(document).on('click', '.prev', function() {
		currentPage = parseInt($('.paging').first().text().trim()) - 1;
		boardList(currentPage);
	})
	
	// 글쓰기폼 띄우기
	$(document).on('click','#nWrite', function() {
		$('#writeModal').modal('show');

	})
	// 글쓰기폼 전송버튼
	$(document).on('click','#binsert', function() {
		adata = $('#writeModal form').serializeArray();
		insertAdminBoard()
	})
	

	// 목록클릭시 리스트로 돌아가기
	$(document).on('click','#list', function() {
		location.href="/Moram/adminboard/adminboard.jsp?grNo="+boardgrNo+""	
	})

	// 수정 클릭시 모달에 내용 가져오기
	$(document).on('click','#update', function() {

		$('#updateModal').modal('show');
		// list 화면에서 수정할 내용을 가져오기
		blist = $(this).parents('.board_container');
		btitle = $(blist).find('.btitle').text(); // 제목 
		bcont = $(blist).find('.bcont').html();  // 내용
		bcont = bcont.replace(/<br>/g, "\n");
		
		// modal창에 수정할 내용을 출력	
		$('#updateModal .uTitle').val(btitle);
		$('#updateModal .uCont').val(bcont);
		$('#updateModal .uBoardNo').val(boardNo);
	})
	
	// 수정 버튼클릭시 
	$(document).on('click','#updateBtn', function() {
		udata = $('#updateModal form').serializeArray();
		updateMrBoard();
	})
	
	// 삭제 버튼클릭시 
	$(document).on('click','#delete', function() {
		deleteMrBoard();
	})
	
	// 댓글 등록버튼
	$(document).on('click','#replyBtn', function() {
		rWrite = $('#replyWrite').val();
		rWrite = rWrite.replace(/\r/g, "").replace(/\n/g, "<br>");
		insertReply();
	})
	
	// 댓글 수정버튼
	$(document).on('click','.rupdate', function() {
		
		replyNo = $(this).parents(".rediv").find('.replyNo').text();
		
		//원래내용 - 수정할 내용
        oldCont = $(this).parents(".rediv").find('.replyCont').html();
        
        //내용을  줄바꿈(\n)하여 수정창(modifyform)에 textarea에출력 
        newCont = oldCont.replace(/<br>/g,"\n");
        $('#updateRplform textarea').val(newCont);
        
        $(this).parent().html($('#updateRplform'));
        
        $('#updateRplform').show();

	})
	
	// 댓글수정창에서 취소버튼 클릭
	$('#btnreset').on('click', function() {
		
		//modifyform을 다시 body로 append
		$('body').append($('#updateRplform'));
		$('#updateRplform').hide();
		
		boardInfo()
	})
	
	// 댓글수정창에서 확인버튼 클릭
	$('#btnok').on('click', function() {
		
		// textarea에서 수정한 내용을 가져오기 - textarea -\r\n -> <br>
		oldCont = $('#updateRplform textarea').val();
		newCont = oldCont.replace(/\r/g, "").replace(/\n/g, "<br>");
		
		// 수정폼닫기
		$('#updateRplform').hide();
		updateReply();
		
	
	})
	
	// 댓글 삭제버튼
	$(document).on('click','.rdelete', function() {
		replyNo = $(this).parents(".rediv").find('.replyNo').text();
		if(confirm("삭제하시겠습니까?") == true){
			deleteReply();
		}
			boardInfo()
	})
	
	// 좋아요 버튼
	$(document).on('click','.heart', function() {
		color = $(this).css('color');
		red = 'rgb(255, 0, 0)';
		gray = 'rgb(220,220,220)';
		
		like = $(this).parents('.board_container').find('.like');
		
		if(color == red){
			$(this).css('color', gray);
			likecnt = parseInt(like.text())-1;
			color = 'red';
		}else{
			$(this).css('color', red);
			likecnt = parseInt(like.text())+1;
			color = 'gray';
		}

		like.text(likecnt);
		
		boardLike();
	
	})
})

</script>
</head>
<body>
<%@ include file="../static/header.jsp"%> 

<section>
<form>
<a href="/Moram/adminboard/adminboard.jsp?grNo=1">전체공지사항</a>
<a href="/Moram/adminboard/adminboard.jsp?grNo=2">자주묻는질문</a>
<a href="/Moram/adminboard/adminboard.jsp?grNo=3">1:1게시판</a>
</form>
	<div class="board_container">
	
	<div class="board_List">
	</div>
	
	</div>

</section>


	<!--글쓰기폼 Modal -->
	<div id="writeModal" class="modal fade writef" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">글쓰기</h4>
	      </div>
	      <div class="modal-body">
	        <form>
	        	 <label class="clabel">제목</label><input type="text" class="intxt" name="board_title"><br>
	        	 <label class="clabel">내용</label><br>
	        	 <textarea name="board_cont" class="intxt" rows="10" cols="50"></textarea>
	        	 <input type="hidden" id="boardgr_no" name="boardgr_no">
	        	 <input type="hidden" id="board_writer" name="board_writer">

	        	 <input type="button" class="intxt" value="전송" id="binsert">
	        </form>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
         
	<!--글쓰기 수정 폼 Modal -->
	<div id="updateModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">수정하기</h4>
	      </div>
	      <div class="modal-body">
	        <form method="post" enctype = "muLtipart/form-data" action="/Moram/adminBoardInsert.do">
	        	 <label class="clabel">제목</label><input type="text" class="intxt uTitle"  name="board_title"><br>
	       	 	 <input type="hidden" name="num">
	        	 <label class="clabel">내용</label><br>
	        	 <textarea name="board_cont" class="intxt uCont" rows="10" cols="50"></textarea>

	        	 <br>
	        	 <input type="hidden" class="uBoardNo" name="board_no">
	        	 <input type="button" class="intxt" value="수정" id="updateBtn">
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
         

	<!--댓글수정폼 -->
	<div id="updateRplform">
		<textarea rows="5" cols="50"></textarea>
		<input type="button" value="확인" id="btnok">
		<input type="button" value="취소" id="btnreset">
	</div>
<%@ include file="../static/footer.jsp"%> 
</body>
</html>
