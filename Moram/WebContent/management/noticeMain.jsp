<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="/Moram/css/main.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="<%=request.getContextPath() %>/js/moram.js"></script>
<style type="text/css">
img{
	width: 200px;
	
}
.mrinfo{
	display: inline-block;
	border: 1px solid black;
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
	$('.cat').on('click', function(){
		$('#selmoram_container').empty();
		catNo = $(this).attr('data-no');
		selCatMoramList(catNo);
	});
	
	
	$(document).on("click",".mrinfo",function(){
		//모람번호 가져오기
		mrNo = $(this).attr('mrNo');
		//선택한 모람info
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
	
 
 			<div>
				
				<input type="button" name="subject_no" class="cat" data-no="1" value="아웃도어/여행">  
				<input type="button" name="subject_no" class="cat" data-no="2" value="운동/스포츠">    
				<input type="button" name="subject_no" class="cat" data-no="3" value="음악/악기">      
				<input type="button" name="subject_no" class="cat" data-no="4" value="봉사활동">       
				<input type="button" name="subject_no" class="cat" data-no="5" value="사교/인맥">      
				<input type="button" name="subject_no" class="cat" data-no="6" value="인문학/책/글">  
				<input type="button" name="subject_no" class="cat" data-no="7" value="업종/직무">      
				<input type="button" name="subject_no" class="cat" data-no="8" value="외국/언어">      
				<input type="button" name="subject_no" class="cat" data-no="9" value="문화/공연/축제">
				<input type="button" name="subject_no" class="cat" data-no="10" value="공예/만들기">   
				<input type="button" name="subject_no" class="cat" data-no="11" value="댄스/무용">     
				<input type="button" name="subject_no" class="cat" data-no="12" value="사진/영상">     
				<input type="button" name="subject_no" class="cat" data-no="13" value="게임/오락">     
				<input type="button" name="subject_no" class="cat" data-no="14" value="요리/제조">    
				<input type="button" name="subject_no" class="cat" data-no="15" value="반려동물">      
				<input type="button" name="subject_no" class="cat" data-no="16" value="자유주제">      
			</div>

		<h3>내 모람</h3>
		<div id="mymoram_container">
		</div>
		
		<br>
		<hr>
		
		<h3>선택한 모람</h3>		
		<div id="selmoram_container">
		</div>
	 	<hr>
	 	<br>
	 	
	 	<h3>나와 같은 지역/카테고리 모람</h3>
	 	<div id="samemoram_container">
	 	</div>


</section>

<%@ include file="../static/footer.jsp" %>
</body>
</html>
