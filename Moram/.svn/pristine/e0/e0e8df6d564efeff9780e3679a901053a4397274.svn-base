<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 관심 모람 리스트</title>
	<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="/Moram/css/main.css">
	
	<style>
		body{
			margin: 0;
		}
		
		#morambtn, #classbtn{
			cursor : pointer;
			width: 250px;
			height: 60px;
			background-color: #e9e9e9;
			font-size: 1.3em;
			text-align: center;
			line-height: 50px;
			margin: 0 20px;
			display : inline-block;
		}
		
		label{
			cursor:pointer;
		}
		
		#btnMoem{
			margin-top: 5%;
			margin-left: 26%;	
		}
		
		#contentlist{
			height: 300px;
			margin: 2%;
			margin-left: 13%;
			margin-top: 2%;
			background: #f8f8f8;
			margin-right: 20%;			
		}
		#title2{
			margin-left: 13%;
		}
		
		#contentlist #classimg, #moramimg{
			display: inline-block;
			height: 100%;
			width: 45%;
			float:left;
		}
		
		#mrimages, #climages{
			height: 100%;
			width: 100%;
		}
		
		
		#classname, #moramsem, #classinfo, #classaddr, #classrgn, #classcate{
			display: inline-block;
			font-size: 1.3em;
			margin-left: 5%;
		}
		
		#mrname, #moramjigi, #moraminfo, #morambirth, #mrlimit, #mrrgn, #category{
			display : inline-block;
			font-size: 1.3em;
			margin-left: 5%;
		}
		
	</style>
	

	
	
	<script>
	
		$(function(){
			$.ajax({
				
				url : '<%=request.getContextPath()%>/PreferClassList.do',
				dataType : 'json',
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				success : function(res){
					code = "";
					
					$.each(res, function(i, v){
						code += "<div id='contentlist'>";
						code += "<div id='moramimg'> <img id='mrimages' src='/Moram/images/imageView.do?folderNm=class&fileNm="+v.class_image+"'></div>";
						code += "<div id='classname'><h3>" + v.class_name + "</h3></div><br>";
						code += "<div id='moramsem'>" + "모람쌤 : " + v.mem_id + "</div><br><br>";
						
						clinfo = v.class_info.substring(0, 20);
						code += "<div id=classinfo>" + clinfo + "</div><br><br>";
						code += "<div id='classrgn'>" + "지역 : " + v.class_rgn + "</div><br>";
						code += "<div id='classaddr'>" + "상세주소 : " + v.class_addr + "</div><br>";
						
						cate = "";
						
						switch(v.subject_no){
							case 1 : cate = "아웃도어/여행"; break; case 9 : cate = "문화/공연/축제";break;
							case 2 : cate = "운동/스포츠"; break;  case 10 : cate = "공예/만들기";break;
							case 3 : cate = "음악/악기"; break; case 11 : cate = "댄스/무용";break;
							case 4 : cate = "봉사활동"; break; case 12 : cate = "사진/영상";break;
							case 5 : cate = "사교/인맥"; break; case 13 : cate = "게임/오락";break;
							case 6 : cate = "인문학/책/글"; break; case 14 : cate = "요리/제조";break;
							case 7 : cate = "업종/직무"; break; case 15 : cate = "반려동물";break;
							case 8 : cate = "외국/언어"; break; case 16 : cate = "자유주제";break;
						}

						
						code += "<div id='classcate'>" + cate + "</div>";
						lh = 'location.href=""';
						code += "</div>";						
					})
					$('#preferlist').html(code);
					}
				
			})
	
		
	
		$('#btnMoem #classbtn').on('click', function(){
				
			$('#btnMoem #morambtn').css('background', '#e9e9e9');
			$('#btnMoem #classbtn').css('background', 'gray');

			
				$.ajax({
					
					url : '<%=request.getContextPath()%>/PreferClassList.do',
					dataType : 'json',
					error : function(xhr){
						alert("상태 : " + xhr.status);
					},
					success : function(res){
						code = "";
					
						$.each(res, function(i, v){
							code += "<div id='contentlist'>";
							code += "<div id='moramimg'> <img id='climages' src='/Moram/images/imageView.do?folderNm=class&fileNm="+v.class_image+"'></div>";
							code += "<div id='classname'><h3>" + v.class_name + "</h3></div><br>";
							code += "<div id='moramsem'>" + "모람쌤 : " + v.mem_id + "</div><br><br>";
							
							clinfo = v.class_info.substring(0, 20);
							code += "<div id=classinfo>" + clinfo + "</div><br><br>";
							code += "<div id='classrgn'>" + "지역 : " + v.class_rgn + "</div><br>";
							code += "<div id='classaddr'>" + "상세주소 : " + v.class_addr + "</div><br>";
							
							cate = "";
							
							switch(v.subject_no){
								case 1 : cate = "아웃도어/여행"; break; case 9 : cate = "문화/공연/축제";break;
								case 2 : cate = "운동/스포츠"; break;  case 10 : cate = "공예/만들기";break;
								case 3 : cate = "음악/악기"; break; case 11 : cate = "댄스/무용";break;
								case 4 : cate = "봉사활동"; break; case 12 : cate = "사진/영상";break;
								case 5 : cate = "사교/인맥"; break; case 13 : cate = "게임/오락";break;
								case 6 : cate = "인문학/책/글"; break; case 14 : cate = "요리/제조";break;
								case 7 : cate = "업종/직무"; break; case 15 : cate = "반려동물";break;
								case 8 : cate = "외국/언어"; break; case 16 : cate = "자유주제";break;
							}

							
							code += "<div id='classcate'>" + cate + "</div>";
							lh = 'location.href=""';
							code += "</div>";						
						})
					 	
						$('#preferlist').html(code);
					  }
						
				})
		})
		
		$('#btnMoem #morambtn').on('click', function(){
				
			$('#btnMoem #morambtn').css('background', 'gray');
			$('#btnMoem #classbtn').css('background', '#e9e9e9');
			
				$.ajax({
				
					url : '<%=request.getContextPath()%>/PreferMoramList.do',
					dataType : 'json',
					error : function(xhr){
						alert("상태 : " + xhr.status);
					},
					success : function(res){
						

					code = "";
						$.each(res, function(i, v){
						code += "<div id='contentlist'>";
						code += "<div id='moramimg'> <img id='climages' src='/Moram/images/imageView.do?folderNm=moram&fileNm="+v.mr_image+"'></div>";
						code += "<div id='mrname'><h3>" + v.mr_name + "</h3></div><br>";
						code += "<div id='moramjigi'>" + "모람지기 : " + v.moramjigi + "</div><br><br>";
						mrinfo = v.mr_info.substring(0, 20);						
						code += "<div id='moraminfo'>" + mrinfo + "</div><br><br>";
						code += "<div id='morambirth'>" + "생성일 : " + v.mr_cdate + "</div><br>";
						code += "<div id='mrlimit'>" + "정원 : " + v.mr_limit + "</div><br>";
						code += "<div id='mrrgn'>" + "지역 : " + v.mr_rgn + "</div><br>";
						
						cate = "";
						
						switch(v.subject_no){
							case 1 : cate = "아웃도어/여행"; break; case 9 : cate = "문화/공연/축제";break;
							case 2 : cate = "운동/스포츠"; break;  case 10 : cate = "공예/만들기";break;
							case 3 : cate = "음악/악기"; break; case 11 : cate = "댄스/무용";break;
							case 4 : cate = "봉사활동"; break; case 12 : cate = "사진/영상";break;
							case 5 : cate = "사교/인맥"; break; case 13 : cate = "게임/오락";break;
							case 6 : cate = "인문학/책/글"; break; case 14 : cate = "요리/제조";break;
							case 7 : cate = "업종/직무"; break; case 15 : cate = "반려동물";break;
							case 8 : cate = "외국/언어"; break; case 16 : cate = "자유주제";break;
						}
						
						code += "<div id='category'>" + cate + "</div>";
						lh = 'location.href=""';
						code += "</div>";						
						})
					 
						
						$('#preferlist').html(code);
					}
				})
		})
			
			
		})	
		
	</script> 



</head>
<body>
<%@ include file="../static/header.jsp" %>
<section>
  <div class="wrapper">
    <div id ="title2" style="display:inline-block">
      	<h2>관심 목록</h2>
    </div>
	  <div id="btnMoem">
			<div id="classbtn">관심 클래스 보기</div>
		
			<div id="morambtn">관심 모람 보기</div>
	  </div>
	
	<div id="preferlist">
	</div>
  </div>
</section>
<%@ include file="../static/footer.jsp" %>
</body>
</html>


