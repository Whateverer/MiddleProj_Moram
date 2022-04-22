<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%
	String ltNo = request.getParameter("ltNo");
%>
<script>
$(function() {
ltNo = "<%=ltNo %>";

	$.ajax({
		url: "/Moram/LectureRezList.do",
		type: "post",
		data:{'lecture_no' : ltNo,
		}, 
		success: function(res) {
			console.log(res)
			llist = '';
			if(res.length==0){
				llist += '<h2>예약이 없습니다.</h2>';
			}else{
				llist += '<table class="table table-striped">';
				llist += '<thead>';
				llist += '<tr>';
				llist += '<th>이름</th>';
				llist += '<th>전화번호</th>';
				llist += ' </tr>';
				llist += '</thead>';
				llist += '<tbody>';
				
				$.each(res, function(i, v) {
				llist += '<tr>';
					llist += '<td>'+v.mem_name+'</td>';
					llist += '<td>'+v.mem_tel+'</td>';
				llist += '</tr>';
				})
				
				llist += '</tbody>';
				llist += '</table>';
				console.log(llist);
			}
				
				$('.container').append(llist);
			},
			error : function(xhr) {
				alert(xhr.status)
			},
			dataType : "json"

		})

	})
</script> 

</head>
<body>
<div class="container">
  <h2>예약현황</h2>

</div>
</body>
</html>