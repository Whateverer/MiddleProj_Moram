<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모람</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="/Moram/js/slick.js"></script>
  <link rel="stylesheet" href="/Moram/css/main.css">
  <link rel="stylesheet" href="/Moram/css/slick.css">
  
  <style>
/*    	#mainSection{  */
/*    		width: 85%;  */
/*    	}  */
   	#mainPage{ 
   		width: 100%; 
   		height: 98%; 
   		margin: 10px; 
   	} 
    #moram{ 
    	display : inline-block;
    	padding-top: 40px;
    }  
   	#fixmoram{ 
   		width: 85%; 
   	} 
/*    	.btn{  */
/*    		float: right;  */
/*    		margin-top: 50px;  */
   		
/*    	}  */
   	#moramMain, #classMain{ 
   		background: gray; 
   	} 
  	
    #mainPage div{  
 	   		display: inline-block;  
 	   		height: 400px;  
 	   		width: 250px;  
	   		margin: 30px;	  
     }  
  	#mainPage2 div{
  		display : inline-block;
  		height: 400px;
  		width: 250px;
  		margin: 30px;
  	}
   	 hr{  
   	 		clear: both;  
   	 }  
   	 #moramCreate{
	display: none;
	}

	span{
	margin-left: 5px;
	}
  	
   .moramMain img, .classMain img{
  		width: 250px;
  		height: 300px;
  	}
  	
  	/* 배너 스타일 */
.ban1{
	width: 100%;
	margin-left: 2%;
	/* margin-top: 3%; */
	position: relative;
}  	
  	
.your-class{
		
	
	
}
.your-class .slick-prev{
	position: absolute; left: -30px; top: 160px;
	width: 100px; heigth: 100px; background: url(/Moram/images/왼쪽.png); background-position: -193px 0px;
	text-indent: -9999px;
	z-index: 999; border: none;
	}

  	
.your-class .slick-next{
	position: absolute; right: -5px; top: 160px;
	width: 100px; heigth: 100px; background: url(/Moram/images/오른쪽.png); background-position: -193px 0px;
	text-indent: -9999px; border: none;
}  	
  	
  	
  </style>
  <%
  	String memId = (String)session.getAttribute("sessionId");
  %>
  
  <script>
  $(function(){
//중복검사 버튼 눌렀는지 확인
  var count = 0;

  //모람 개설, 저장
  function saveMoram(){
  	newMrNo = "";
  	
  	event.preventDefault();
    
    var form = $('#form1')[0];
    var data = new FormData(form);
    //moram_image
    console.log(data);
  	
  	$.ajax({
  		type: 'post',
  		enctype: 'multipart/form-data',
  		url: '/Moram/MoramRegist.do',
  		data : data,
  		processData: false,
	    contentType: false,
	    cache: false,
        timeout: 600000,
  		success : function(res){
			
			alert("모람을 개설했습니다.");
			newMrNo = res;
  		},
  		error : function(xhr){
  			alert("상태 : " + xhr.status);
  		}
  			
  	})
  	//모람지기를 모람멤버에 추가
  	<%-- $.ajax({
  		url : '<%=request.getContextPath()%>/InsertMoramjigi.do',
  		data : {
  			"mr_no" : newMrNo		
  		},
  		dataType : 'json',
  		async: false,
  		success : function(res){
  			alert("모람을 개설했습니다.")
  		},
  		error : function(xhr){
  			alert("상태 : " + xhr.status);
  		}
  		
  	}) --%>
  	
  }

	//모람쌤 버튼 클릭시 모달 보이기 
	$('.MoramSemApplybtn').on('click', function(){
		location.href = "/Moram/mypage/moramSem.jsp"
	});
 
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
  		
  		//console.log(fdata);
  		
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
  		
  	
  	
  	
  })
  
  
	
  		
  		search = '<%=request.getParameter("query")%>';
  		
  		if(search == null){
  			search = "";
  		}
  		
  		$.ajax({
  			url : '<%=request.getContextPath()%>/MainMoram.do',
  			type : 'get',
  			data : {'search' : search},
  			dataType : 'json',
  			error : function(xhr){
  				alert('상태 : ' + xhr.status);
  			},
  			success : function(res){
  				mlist = "";
 	 			$.each(res, function(i, v) {
 	 				$('#mainPage').empty();
  					
 	 				mlist += '<div class="moramMain" mrNo="'+v.mr_no+'">';
 	 				mlist += '<img src="/Moram/images/imageView.do?folderNm=moram&fileNm='+v.mr_image+'"><br><br>';
 	 				//mlist += '<img src="/Moram/images/moram/'+v.mr_no+'.jpg"><br>';
 	 				mlist += v.mr_name;
 	 				mlist += '</div>';
 	 			})
 	 			$('#mainPage').html(mlist);
  				
  			}
  		})
  		
  		
  		  	$.ajax({
  			
  			url : '<%=request.getContextPath()%>/MainClass.do',
  			type : 'get',
  			data : {'search' : search},
  			dataType : 'json',
  			error : function(xhr){
  				alert('상태 : ' + xhr.status);
  			},
  			success: function(res) {
 	 			$('#mainPage2').empty();
 	 			$.each(res, function(i, v) {
 	 				clist = "";
 	 				clist += '<div class="classMain" clNo="'+v.class_no+'">';
 	 				clist += '<img src="/Moram/images/imageView.do?folderNm=class&fileNm='+v.class_image+'"><br><br>';
 	 				clist += v.class_name;
 	 				clist += '</div>';
 	 				$('#mainPage2').append(clist);
 	 			})
 	 		}
  			
  		})
	
  		
  		
//   	$.ajax({
// 		url: "/Moram/SameCatMoramList.do",
// 		type: 'post',
<%-- 		data: {"mem_id": "<%=memId%>"}, --%>
// 		success: function(res) {
// 			mlist = "";
// 			$.each(res, function(i, v) {
// 				$('#mainPage').empty();
				
// 				mlist += '<div class="moramMain" mrNo="'+v.mr_no+'">';
// 				mlist += '<img src="/Moram/images/imageView.do?folderNm=moram&fileNm='+v.mr_image+'"><br><br>';
// 				//mlist += '<img src="/Moram/images/moram/'+v.mr_no+'.jpg"><br>';
// 				mlist += v.mr_name;
// 				mlist += '</div>';
// 			})
// 			$('#mainPage').html(mlist);
			
// 		},
// 		error: function(xhr) {
// 			alert(xhr.status)
// 		},
// 		dataType: "json"
// 		});
  		


//   		$.ajax({
// 		url: "/Moram/CategoryClassList.do",
// 		type: "post",
// 		data: {"subject_name" : "전체",
// 		},
// 		success: function(res) {
// 			$('#mainPage2').empty();
// 			$.each(res, function(i, v) {
// 				clist = "";
// 				clist += '<div class="classMain" clNo="'+v.class_no+'">';
// 				clist += '<img src="/Moram/images/imageView.do?folderNm=class&fileNm='+v.class_image+'"><br><br>';
// 				clist += v.class_name;
// 				clist += '</div>';
// 				$('#mainPage2').append(clist);
// 			})
// 		},
// 		error: function(xhr) {
// 			alert(xhr.status)
// 		},
// 		dataType: "json"
		
// 	})
	
	$(document).on("click",".moramMain",function(){
		//모람번호 가져오기
		mrNo = $(this).attr('mrNo');
		
		//선택한 모람info로 가기
		location.href="/Moram/moram/moramInfo.jsp?mrNo="+mrNo+""
	
		
	});
	$(document).on("click",".classMain",function(){
		//모람번호 가져오기
		clNo = $(this).attr('clNo');
		
		//선택한 모람info로 가기
		location.href="/Moram/class/classInfo.jsp?clNo="+clNo+""
	
		
	})
  		
  		 /* 배너 */
  		 $('.your-class').slick({
  		   
		  });
  		
  		
  	})
 

 

 
  </script>
  
</head>
<body>
<%@ include file="static/header.jsp"%> 
<%String sessionId = (String)session.getAttribute("sessionId"); %>
		<section id="mainSection">
			  
			  <!-- slick 사용법 -->
			  <div class="your-class">
				  <div><a href="#"><img class="ban1" src="<%=request.getContextPath()%>/images/배너1.jpg" alt="모람"></a></div>
				  <div><a href="#"><img class="ban1" src="<%=request.getContextPath()%>/images/배너2.jpg" alt="클래스"></a></div>
				  <div><a href="#"><img class="ban1" src="<%=request.getContextPath()%>/images/배너3.jpg" alt="플레이스"></a></div>
			  </div>
			  
			  
			  <div id="fixmoram">
				 <div id="moram">
				   <h2>모람</h2>
				 </div>
					<input id="cre" class="MoramCreatebtn" type="button" value="모람 개설">
			  </div>
			   <hr>
			
			<div id="mainPage">
			</div>
			
			  <div id="fixmoram">
				<div id="moram">
				  <h2>클래스</h2>
				</div>
					<input class="MoramSemApplybtn" type="button" value="모람쌤 신청하러 가기">
			  </div>
			  <hr>
			  
			  <div id="mainPage2">
			  </div>
			  
			  
<div id="moramCreate" class="modal fade" role="dialog">
  <div class="modal-dialog">

  <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">모람 개설하기</h4>
      </div>
      <div class="modal-body">
      	<form id="form1" >
	      	<label>모람명 </label> <input id="mrname" type="text" name="mr_name">
			<input type="button" id="chk" value="중복체크"><span id="chkname"> </span><br><br>
			<label>대표사진</label><br><input name="mr_image" type="file"><br><br>
			
			<div>
				<label>카테고리</label><br>
				<select id="cat"  name ="subject_no" aria-label="카테고리" >
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
			</div>
			<br>
			
			<!-- 모람지기 아이디 넣기 -->
			<input type="hidden" value="<%=sessionId%>" name="moramjigi">
			
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

		</section>
<%@ include file="../static/footer.jsp" %> 
</body>
</html>