<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script src="<%=request.getContextPath() %>/js/class.js"></script>
 <link rel="stylesheet" href="/Moram/css/main.css">
	
<style type="text/css">
{

}
.clinfo{
	float: left;
	margin: 10px;
}
#panel{
	clear: both;
}
img {
	width: 250px;
	height: 200px;
}
#classRegist{
	display: none;
}
		
</style>
<% 
	String mem_id = (String)session.getAttribute("sessionId");
	String mem_div = (String)session.getAttribute("sessionDiv");
%>

<script>
$(function(){
	memId = "<%=mem_id%>";
	memDiv = "<%=mem_div%>";
	
	if(memDiv=='모람쌤'){
		$('#myTitle').text('내 클래스');
	}
	// 
	youMoramSem();
	
	// 내 클래스리스트 (쌤 = 운영중인, 모라미= 예약한 모람 출력)
	myClassList();
	
	// 추천 클래스리스트
	recClassList();
	
	// 카테고리 선택시
	$('.btn').on('click', function() {
		subjectNm = $(this).text();
		categoryClassList();
		
	})
	
	// 클래스 개설하기 *권한필 폼띄우기
	$('#classRegist').on('click', function() {
		$('#classModal').modal('show');
	})
	
	// 클래스 개설폼에서 전송버튼
	$(document).on("click","#regBtn",function(){
		
		
		event.preventDefault();
	    
	    var form = $('#clrgForm')[0]
	    var data = new FormData(form);
	    
	    $('#regBtn').prop('disabled', true);
		
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "/Moram/ClassRegist.do",
	        data: data, 
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function (data) {
	        	$('#regBtn').prop('disabled', false);
	        },
	        error: function (e) {
	            $('#regBtn').prop('disabled', false);
	        }
	    });
		
	    $('#classModal').modal('show');
	    
	    
	})

	// 클래스 하나 클릭시
	$(document).on("click",".clinfo",function(){
		//클래스번호 가져오기
		clNo = $(this).attr('clNo');
		
		location.href= '/Moram/class/classInfo.jsp?clNo='+clNo+''
		
		
	});
	
})
	 function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
	
	
</head>
<body>
<%@ include file="../static/header.jsp" %>
	<section id="class_container">

		 	<div class="container">
				
				<div class="btn" name="subject_no" class="cat" data-no="0" value="전체">전체</div> 
				<div class="btn" name="subject_no" class="cat" data-no="1" value="아웃도어/여행">아웃도어/여행</div> 
				<div class="btn" name="subject_no" class="cat" data-no="2" value="운동/스포츠">운동/스포츠</div> 
				<div class="btn" name="subject_no" class="cat" data-no="3" value="음악/악기">음악/악기</div>      
				<div class="btn" name="subject_no" class="cat" data-no="4" value="봉사활동">봉사활동</div>        
				<div class="btn" name="subject_no" class="cat" data-no="5" value="사교/인맥">사교/인맥</div>       
				<div class="btn" name="subject_no" class="cat" data-no="6" value="인문학/책/글">인문학/책/글</div>   
				<div class="btn" name="subject_no" class="cat" data-no="7" value="업종/직무">업종/직무</div>       
				<div class="btn" name="subject_no" class="cat" data-no="8" value="외국/언어">외국/언어</div>      
				<div class="btn" name="subject_no" class="cat" data-no="9" value="문화/공연/축제">문화/공연/축제</div> 
				<div class="btn" name="subject_no" class="cat" data-no="10" value="공예/만들기">공예/만들기</div>    
				<div class="btn" name="subject_no" class="cat" data-no="11" value="댄스/무용">댄스/무용</div>  <br>   
				<div class="btn" name="subject_no" class="cat" data-no="12" value="사진/영상">사진/영상</div>      
				<div class="btn" name="subject_no" class="cat" data-no="13" value="게임/오락">게임/오락</div>      
				<div class="btn" name="subject_no" class="cat" data-no="14" value="요리/제조">요리/제조</div>     
				<div class="btn" name="subject_no" class="cat" data-no="15" value="반려동물">반려동물</div>      
				<div class="btn" name="subject_no" class="cat" data-no="16" value="자유주제">자유주제</div>       
			</div><br>

			<input type="button" class="btn btn-primary" id="classRegist" value="클래스개설">

		<div>
			
			<h3 id="myTitle">예약한 클래스</h3>
			<hr>
			<div id="myClassList">
			</div>
			<br><br>
			<h3 id="panel">클래스 목록</h3>
			<hr>
			<div id="recClassList">
			
			</div>
		</div>
		</div>

	</section>

	<!--클래스 개설 Modal -->
	<div id="classModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Modal Header</h4>
	      </div>
	      <div class="modal-body">
	        <form method="POST" enctype="multipart/form-data" id="clrgForm">
	        	 <label>클래스이름</label><input type="text" class="intxt" name="class_name"><br>
	        	 <label>클래스사진</label><input type="file" name="profile"/><br>
	       	 	 <label>클래스정보</label><br>
	       	 	 <textarea name="class_info" class="intxt" rows="10" cols="50"></textarea><br>
	         	 <label>주소</label> <br>
	         	 <input type="text" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="sample4_detailAddress" placeholder="상세주소">
					<input type="text" id="sample4_extraAddress" placeholder="참고항목">
			     
	        	 <label>활동지역</label>
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
				
				<br>
				<label>카테고리</label>
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
				
	        	 <br>
	        	 <input type="hidden" class="intxt" name="mem_id" value="<%=mem_id%>">
	        	 <input type="button" class="intxt" value="전송" id="regBtn">
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>


<%@ include file="../static/footer.jsp" %> 
</body>
</html>