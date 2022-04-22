<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모람 개설</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

//중복검사 버튼 눌렀는지 확인
var count = 0;

//모람 저장
function saveMoram(){
	
	$.ajax({
		url: '<%=request.getContextPath()%>/MoramCreate.do',
		data : fdata,
		type : 'post',
		dataType : 'json',
		success : function(res){
			alert(res.sw)
			if(res.sw =="성공"){
				alert("모람이 개설되었습니다.")
			}else{
				alert("모람 개설에 실패했습니다.")
			} 
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
			
	})
}


$(function(){
	//개설 버튼 클릭시 모달 보이기 
	$('#cre').on('click', function(){
	
		
		$('#moramCreate').modal('show');
	});
	
	//전송버튼 클릭시 데이터 전송 - 데이터베이스에 완료
	$('#sub').on('click', function(){
		//중복검사 버튼 안눌렀을 때 
		if(count==0){
			alert("모람명 중복검사를 해주세요.");
			return false;
		}
		
		//모람명 중복될 때 전송 못하게하기
		
		var chkname = $('#chkname').text().trim();
		if(chkname == "중복되는 모람명"){
			alert("모람명을 확인해주세요.");
			return false;
		}
		
		fdata = $('#form1').serializeArray();
		
		console.log(fdata);
		
		saveMoram();
		
		
	});
	
	
	//중복체크하기
	 $('#chk').on('click', function(){
		//클릭횟수 증가
		 count++;
		
		var mrname = $('#mrname').val().trim();
		
		$.ajax({
			url : '<%=request.getContextPath()%>/MoramNameChk.do',
			data : {"mrname": mrname},
			dataType : 'json',
			type : 'get',
			success : function(res){
				
				if(res=="중복되는 모람명"){
					$('#chkname').text(res).css('color' , 'red');
				}else{
					$('#chkname').text(res).css('color' , 'blue');
				}
			},
			error : function(xhr){
				alert("상태 : " + xhr.status)
			}
			
		});
		$('#chkname').empty();
		
	});
	
	
})
</script>

<style>
#moramCreate{
	display: none;
}

span{
	margin-left: 5px;
}
</style>
</head>
<body>

<input type="button" name="create" id="cre" value="개설">

<!-- <form id="form1">

	<h2>모람 개설</h2>
	<label>모람명</label><input type="text" name="mr_name"><br><br>
	<input type="button" id="chk">
	<label>대표사진</label><br><input name="mr_image" type="file"><br><br>
	
	<div>
		<label>카테고리</label><br>
		<input type="radio" name="subject_no" class="cat" value="1">아웃도어/여행
		<input type="radio" name="subject_no" class="cat" value="2">운동/스포츠
		<input type="radio" name="subject_no" class="cat" value="3">음악/악기
		<input type="radio" name="subject_no" class="cat" value="4">봉사활동
		<input type="radio" name="subject_no" class="cat" value="5">사교/인맥<br>
		<input type="radio" name="subject_no" class="cat" value="6">인문학/책/글
		<input type="radio" name="subject_no" class="cat" value="7">업종/직무
		<input type="radio" name="subject_no" class="cat" value="8">외국/언어
		<input type="radio" name="subject_no" class="cat" value="9">문화/공연/축제
		<input type="radio" name="subject_no" class="cat" value="10">공예/만들기<br>
		<input type="radio" name="subject_no" class="cat" value="11">댄스/무용
		<input type="radio" name="subject_no" class="cat" value="12">사진/영상
		<input type="radio" name="subject_no" class="cat" value="13">게임/오락
		<input type="radio" name="subject_no" class="cat" value="14">요리/제조
		<input type="radio" name="subject_no" class="cat" value="15">반려동물<br>
		<input type="radio" name="subject_no" class="cat" value="16">자유주제
	</div>
	<br>
	
	모람지기 아이디 넣기
	<input type="hidden" name="moramjigi">
	
	<label>지역</label>
	<select name="mr_rgn" id="region">
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
	</select><br>
	<label>소개</label><br>
	<textarea name="mr_info" rows="5" cols="70"></textarea><br>
	
	<label>정원</label><br>
	<input type="text" name="mr_limit">명
	
	<input type="reset" value="초기화"> 
	<input id="sub" type="submit" value="등록"> 
</form> -->


<!-- 글쓰기폼 Modal -->
<div id="moramCreate" class="modal fade" role="dialog">
  <div class="modal-dialog">

  <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">모람 개설하기</h4>
      </div>
      <div class="modal-body">
      	<form id="form1">
	      	<label>모람명 </label> <input id="mrname" type="text" name="mr_name">
			<input type="button" id="chk" value="중복체크"><span id="chkname"> </span><br><br>
			<label>대표사진</label><br><input name="mr_image" type="file" accept="image"><br><br>
			
			<div>
				<label>카테고리</label><br>
				<input type="radio" name="subject_no" class="cat" value="1">아웃도어/여행
				<input type="radio" name="subject_no" class="cat" value="2">운동/스포츠
				<input type="radio" name="subject_no" class="cat" value="3">음악/악기
				<input type="radio" name="subject_no" class="cat" value="4">봉사활동
				<input type="radio" name="subject_no" class="cat" value="5">사교/인맥<br>
				<input type="radio" name="subject_no" class="cat" value="6">인문학/책/글
				<input type="radio" name="subject_no" class="cat" value="7">업종/직무
				<input type="radio" name="subject_no" class="cat" value="8">외국/언어
				<input type="radio" name="subject_no" class="cat" value="9">문화/공연/축제
				<input type="radio" name="subject_no" class="cat" value="10">공예/만들기<br>
				<input type="radio" name="subject_no" class="cat" value="11">댄스/무용
				<input type="radio" name="subject_no" class="cat" value="12">사진/영상
				<input type="radio" name="subject_no" class="cat" value="13">게임/오락
				<input type="radio" name="subject_no" class="cat" value="14">요리/제조
				<input type="radio" name="subject_no" class="cat" value="15">반려동물<br>
				<input type="radio" name="subject_no" class="cat" value="16">자유주제
			</div>
			<br>
			
			<!-- 모람지기 아이디 넣기 -->
			<input type="hidden" name="moramjigi">
			
			<label>지역</label>
			<select name="mr_rgn" id="region">
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
			</select><br>
			<label>소개</label><br>
			<textarea name="mr_info" rows="5" cols="70"></textarea><br>
			

			
			<input type="reset" value="초기화"> 
			<input id="sub" type="submit" value="등록"> 
		</form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
</body>
</html>