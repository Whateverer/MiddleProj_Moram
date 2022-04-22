<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모람쌤 신청</title>

	<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="/Moram/css/main.css">

	<style>
		html, body{
			height: 100%;
			width: 100%;
		}
		section{
			height: 100%;
			width: 100%;
		}
		#title{
		  text-align: left;
		}
		.wrapper{
		  width: 60%;
		  display:inline-block;
		  text-align: center;
		}
		#content{
		  display:inline-block;
	
		}
		#title{
		  margin-left: 120px;
		}

		#btn{
		  float: right;
		  margin-right: 28px;
		}
		#text2{
		  padding-left: 130px;
		  text-align: left;
		}
		p{
		  font-weight: bold;
		}
	</style>

	<script>
		$(function(){
			$('#btn').on('click', function(){
				contVal = $('#content').val();
			$.ajax({
				
				url : '<%=request.getContextPath()%>/TeacherApply.do',
				type : 'get',
 				data : {'content': contVal},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				success : function(res){
					alert(res);
				},
				dataType : 'json'
				
			})
		  })
		})
	</script>


</head>
<body>
<%@ include file="../static/header.jsp" %>
<section>
	<div class="wrapper" style="display:inline-block">
	 <div id="text2">
	 <br>
	 <hr>
	  <h4>
	  <br>
	  안녕하세요. 모람입니다.<br><br>
	  저희 모람은 다양한 분야의 클래스들을 지원하고 있습니다.<br>
	  원활한 신청을 위해 저희가 제시한 양식에 따라 글을 작성해 주시기 바랍니다. 
	 </h4>
	 <h4>▶수업형태</h4>
	 <p style="color:red">
	 다회차, 원데이를 선택하여 작성해주세요.
	 다회차 클래스를 원하시는 경우 회차도 작성하여 주세요.
	 </p>
	 <h4>▶수업시간</h4>
	 <p style="color:red">
	 1회당 원하시는 수업 시간을 작성해주세요.
	 </p>
	 <h4>▶수업을 원하시는 날짜</h4>
	 <p style="color:red">
	 다회차 수업을 원하실 경우 복수의 날짜를 작성해주세요.
	 </p>
	 <h4>▶예정 수업 비용</h4>
	 <p style="color:red">
	 예정하고 계시는 출강비용을 작성해주세요.
	 협의가 가능하시면 '협의가능' 으로 작성해주세요.
	 </p>
	 <br><hr>
	 </div>
	 
		<form>
			<div id="title">
			</div><br>
			<div id="contentDiv">
				<textarea id="content" rows="20" cols="100" placeholder="
																		▶수업형태
				
																		▶수업시간
																		
																	         ▶수업을 원하시는 날짜
																	         
																	         ▶예정 수업 비용"></textarea>
			</div><br>

			  <input type="button" class="btn" id="btn" value="신청">
		</form>
	</div>
</section>
<%@ include file="../static/footer.jsp" %> 
</body>
</html>