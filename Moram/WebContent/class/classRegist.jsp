<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <script src="../js/jquery.serializejson.min.js"></script>
 <script src="<%=request.getContextPath() %>/js/class.js"></script>

<script>
$(function() {
	
$('form').on('submit', function() {
	//입력한 모든 값을 가져오기	
	$.ajax({
		url: "/Moram/ClasRegist.do",
		data: $('form').serializeArray(),
		type: "post",
		success: function (res) {
			
		},
		error: function (xhr) {
			alert(xhr.status);
		},
		dataType: "json"
	})
})
	
$('#zipbtn').on('click', function() {
		$('#myModal').modal('show');
})
	
$('#but').on('click', function() {
	dongvalue = $('#dong').val().trim();
	console.log(dongvalue);
	
	if(dongvalue.length<1){
		alert("입력하세요");
		return false;
	}

	// 서버로 전송하기
	$.ajax({
		url: "<%= request.getContextPath()%>/ZipSearch.do",
		data: {"dong" : dongvalue},
		type: "post",
		success : function (res) {
			
			str = "<table>"
			str += "<tr><td>우편번호</td>";
			str += "<td>주소</td><td>번지</td></tr>"
			$.each(res, function (i, v) {
				
				str += "<tr class = 'ziptr'><td>"+ v.zipcode +"</td>";
				str += "<td>"+ v.addr +"</td><td>"+ v.bunji +"</td></tr>"
				
				$('#result').html(str);
			})
			
			str += "</table>"
		},
		error: function (xhr) {
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
	})
})
// 
$(document).on('click', '.ziptr',function() {
	zip = $('td:eq(0)', this).text();
	addr = $('td:eq(1)', this).text();
	
	$('#zip').val(zip);
	$('#add1').val(addr);
	
	// 실행경과 지우기1
	$('#dong').val("");
	$('#result').empty();
	
	// 모달창 닫기
	$('#myModal').modal('hide');
})
	
// 모달 닫는 이벤트 - 실행결과 지우기2
$("#myModal").on('hide.bs.modal', function(){
	$('#dong').val("");
	$('#result').empty();
 });
	
})
</script>
</head>
<body>
  <form class="form-horizontal" onsubmit="return false;">
  
  	<div class="form-group">
      <label class="control-label col-sm-2" for="id">클래스이름:</label>
      <div class="col-sm-2">
        <input type="text" class="form-control" id="class_name" placeholder="Enter id" name="class_name"> 
      </div>
      <button type="button" onclick="CheckId()" id="chkBtn" class="btn btn-danger btn-sm">중복검사</button>
   	  <span id="spanid"></span>
	</div>
  
  	<div class="form-group">
      <label class="control-label col-sm-2" for="name">클래스정보:</label>
      <div class="col-sm-2">
        <textarea name="class_info" class="intxt" rows="10" cols="50"></textarea>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="zip">우편번호:</label>
      <div class="col-sm-2">
        <input type="text" class="form-control" id="zip" placeholder="Enter zip">
      </div>
      <button id="zipbtn" type="button" class="btn btn-danger btn-sm">번호검색</button>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="add1">주소:</label>
      <div class="col-sm-5">
        <input type="text" class="form-control" id="add1" placeholder="Enter add1" name="mem_addr">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="add2">상세주소:</label>
      <div class="col-sm-5">
        <input type="text" class="form-control" id="add2" placeholder="Enter add2">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="add2">활동지역:</label>
      <div class="col-sm-5">
        <select id="rgn"  name ="class_rgn" aria-label="활동지역" >
						<option>서울</option>
				<option>인천</option>
				<option>경기</option>
				<option>부산</option>
				<option>대구</option>
				<option>광주</option>
				<option>대전</option>
				<option>울산</option>
				<option>세종</option>
				<option>강원</option>
				<option>경남</option>
				<option>경북</option>
				<option>전남</option>
				<option>전북</option>
				<option>충남</option>
				<option>충북</option>
				<option>제주</option>
		 </select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="add2">카테고리:</label>
      <div class="col-sm-5">
        <select id="rgn"  name ="subject_no" aria-label="카테고리" >
					<option value="">카테고리선택</option>
					<option value="1">아웃도어/여행</option>
					<option value="2">운동/스포츠</option>
					<option value="3">음악/악기</option>
					<option value="4">봉사활동</option>
					<option value="5">사교/인맥</option>
					<option value="6">인문학/책/글</option>
					<option value="7">외국/언어</option>
					<option value="8">업종/직무</option>
					<option value="9">문화/공연/축제 </option>
					<option value="10">공예/만들기</option>
					<option value="11">댄스/무용</option>
					<option value="12">사진/영상</option>
					<option value="13">게임/오락</option>
					<option value="14">요리/제조</option>
					<option value="15">반려동물</option>
					<option value="16">자유주제</option>
		 </select>
		 
		 <input type="hidden" class="intxt" name="mem_id">
      </div>
    </div>
 
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-primary btn-lg">전송</button>
      </div>
    </div>
    
  </form>

<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
        	<h3>찾는 동이름을 입력하세요</h3>
			<input type="text" name="dong" id="dong">
			<button type="button" id="but">검색</button>
			<br><br>
			<div id="result"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>