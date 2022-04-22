<%@page import="moram.place.controller.CatFacilitiesList"%>
<%@page import="moram.vo.FacilitiesVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>allFacilitiesList</title>
<script type="text/javascript" src ="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/Moram/css/main.css">
<style>
.resultpage{
	width : 500px;
	height : 500px;
	background-color : gray;
	margin : 10px;
	float : left;
	margin-left : 39px;
	margin-right : 30px;
}
.category {
	list-style : none;
	margin : 1px;
}
li {
	float : left;
	margin-right : 40px;
	margin-bottom : 50px;
	width : 200px;
	height : 50px;
	background-color : #A123F1;
	text-align : center;
}
</style>


<script>
$(function(){
	
	$("input:button[name='button']").on('click',function(){
		var subject_name = $(this).val();
		console.log(subject_name);
		
	$.ajax({
		url : '<%= request.getContextPath()%>/CatFacilitiesList.do',
		type : 'post',
		data : { id : $(this).val(),
				"subject_name" : subject_name
				},
		success : function(res){


			htmlCode = "<table border = '1'>";
			
			$.each(res,function(i,v){
				
				htmlCode += "<tr><td>" +"<a href = 'facilitiesInfo.jsp?name='>" + v.facilities_name + "</a></td></tr>";
				htmlCode += "<tr><td>" + v.facilities_rgn +"</td></tr>";
				htmlCode += "<tr><td>" + v.facilities_addr + "</td></tr>";
				
			});
			htmlCode += "</table>";	
			
			
			$("#mainTable").html(htmlCode);
		},
		error : function(xhr){
			alert("상태 : " +xhr.status);
		},
		dataType : 'json'
		
	})
	
})
})
</script>
</head>
<body>
<%@ include file="../static/header.jsp" %> 
<%-- <% --%>
<!--  	List<FacilitiesVO> allFacilitiesList = (List<FacilitiesVO>)request.getAttribute("AllFacilitiesList"); -->
<%-- %> --%>

    
    <div class="panel">
        <h4>카테고리</h4><br>
        <div class="panel-body">
            <div class="form-inline" >
                <input type="button" id="button" name="button" value="전체" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="아웃도어/여행" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="운동/스포츠" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="음악/악기" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="봉사활동" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="사교/인맥" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="인문학/책/글" class="btn btn btn-primary btn-bg"/>
                <br>
                <input type="button" id="button" name="button" value="업종/직무" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="외국/언어" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="문화/공연/축제" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="공예/만들기" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="댄스/무용" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="사진/영상" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="게임/오락" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="요리/제조" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="반려동물" class="btn btn btn-primary btn-bg"/>
                <input type="button" id="button" name="button" value="자유주제" class="btn btn btn-primary btn-bg"/>
            </div><br><br>
        </div>
    </div> 
 
    <div class="panel">
        <div class="panel-body">
            <div class="pull-left mt10">
                총 개시물 개수 나타내기
            </div><br>    
            <div class="table-responsive">
                <table id="mainTable" class="table table-striped table-bordered text-center">
                    <caption></caption>
                        <colgroup>
                            <col width="5%">
                            <col width="10%">
                            <col width="10%">
                        </colgroup>
                        
                            
                        
                    
                
                </table>

                </div>
            </div>
        </div>
    
 
 

<%@ include file="../static/footer.jsp" %>
</body>
</html>