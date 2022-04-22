<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모람 강퇴</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%
	String mrno = request.getParameter("mrno");	
%>
<script type="text/javascript">

var mrNo = '<%=mrno%>'

function close(){
	window.open('', '_self', '');
	window.close();
	return false;
}

$(function() {
	var memArray = {};
	$.ajax({
		url : '/Moram/GetAllMorami.do',
		type: 'post',
		data: {"mr_no": '<%=mrno%>'},
		success : function(res){
			if(res==''){
				htmlCode = "<p>모라미가 없습니다.</p><br><br>";
				
			}else{
				
				htmlCode ="<p>모라미 목록</p> <table border='1' id='moramiList' style='text-align:center;'>";
				htmlCode +="<tr><td>모라미 ID</td><td>";
				 $.each(res, function(i,v){
					htmlCode += "</td></tr>"
					htmlCode += "<tr><td class='tdMem' style='width:200px;'>" + v.mem_id + "</td>";
					htmlCode += "<td><input type='button' class='exbtn' data-id='"+ v.mem_id +"' value='강퇴'></td></tr>";
					
				});
				 htmlCode += "</table><br><br>";
			}
				$("body").html(htmlCode);
				
	
			/* 	htmlCode ="<p>모라미가 없습니다.</p>"
				$("body").html(htmlCode); */
	
			
			
			
		},
		error : function(xhr){
			alert(xhr.status);
			
		}
	});


	//선택해서 강퇴하기
	$(document).on('click', '.exbtn', function(){
		exId = $(this).attr('data-id');
		
		var answer = confirm(exId + "님을 강퇴하겠습니까?");
		
		if(answer){
			$.ajax({
				url : '/Moram/MoramBan.do',
				type: 'post',
				data: {"mr_no": mrNo,
						"mem_id" : exId},		
				success : function(res){
					if(res == 1){
						alert(exId + "님을 강퇴했습니다.")
					}else{
						alert("실패");
					}
				},
				error : function(xhr){
					alert(xhr.status);
				},
				dataType : 'json'
					
			})
		}else{
			return false;
		}
		
		
	});
	
	
	$(document).on('click', '#close', function(){
		window.close();
	})
	
});
</script>
<style>
.exbtn{
	border :1px solid #bdccd5;
	border-radius: 10%;
	color: white;
	background: #bdccd5;
	cursor: pointer;
}
.exbtn:hover{
	background: #97a6d2;
	color: #e7cad4;
}

</style>
</head>
<body>

</body>
</html>