<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link rel="stylesheet" href="/Moram/css/main.css">
 <script src="<%=request.getContextPath() %>/js/moram.js"></script>
<style type="text/css">
img{
	width: 250px;
	height: 200px;
	
}
.mrinfo{
	cursor: pointer;
	float: left;
	margin: 10px;
}
#panel{
	clear: both;
	margin-top: 50px;
}
</style>
<% 
	String menu = request.getParameter("menu");
	String mem_id = (String)session.getAttribute("sessionId");
%>

<script>
$(function() {
	mem_id = "<%=mem_id%>";
	
	myMoramList()
	sameCatMoramList()
	
	//카테고리 선택 시
	$('.btn').on('click', function(){
		$('#selmoram_container').empty();
		catNo = $(this).attr('data-no');
		selCatMoramList(catNo);
	});
	
	
	$(document).on("click",".mrinfo",function(){
		//모람번호 가져오기
		mrNo = $(this).attr('mrNo');
		
		//선택한 모람info로 가기
		location.href="/Moram/moram/moramInfo.jsp?mrNo="+mrNo+""
	
		
	});
	
	
	
	
	//캘린더 가져오기
	<%-- 	$.ajax({
			url : '<%=request.getContextPath()%>/moram/moramCalendar.jsp?"mrNo"=mrNo',
			type : 'get',
			success : function(rtnHtml){
				
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'html'
		}); --%>
	
	if( "board" == "<%=menu%>" ){
		$(".mrinfo").trigger("click");
	}
	
	
}) // $(function()
		
</script>
</head>
<body>

<%@ include file="../static/header.jsp" %> 



		<section id="moram_container">
	
 
 			<div class="cat_container">
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
			</div>

		<h3 id="myTitle">내 모람</h3>
		<hr>
		<div id="mymoram_container">
		</div>
		
		<br><br><br>
		
	 	
	 	<h3 id="panel">모람 목록</h3>
	 	<hr>
	 	<div id="samemoram_container">
	 	</div>


</section>

<%@ include file="../static/footer.jsp" %>
</body>
</html>
