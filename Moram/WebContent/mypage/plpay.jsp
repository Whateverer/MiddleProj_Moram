<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소예약 현황</title>

	<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="/Moram/css/main.css">
	
	<style>
	  html. body{
	  	height: 100%;
	  	width: 100%;
	  }
	  section{
	    height: auto;
	  }
	  h2{
	  	display: inline-block;
	  	margin-left: 13%;
	  }
		#contentList{
			height: 120px;
			margin: 2%;
			margin-left: 13%;
			margin-top: 2%;
			background: #e9e9e9;
			margin-right: 20%;			
		}
		td{
			text-align : center;
			width: 150px;
		}
		tr:nth-child(even){
			height: 90px;
			background: white;			
		}
		
 		#plimages{ 
			height: 120px; 
			width: 100%; 
 		} 
 		
		#plimg{
			display: inline-block;
		}
		#plList{
			display:inline-block;
		}
	</style>
	
	<script>
		$(function(){
			
			$.ajax({
				
				url : '<%=request.getContextPath()%>/PlaceTimeRezList.do',
				type : 'get',
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				success : function(res){
					if(res == "결제 내역이 확인되지 않습니다."){
						
						$('#payList').html("<div id='noList'>결제 내역이 확인되지 않습니다.</div>");
					
					}else{
						str = "";
					$.each(res, function(i, v){
						str += "<div id='contentList' style='background:#e9e9e9;'>";
						str += "<table id=plList>";
						str += "<tr>";
						str += "<td rowspan='2'><img id='plimages' src='/Moram/images/imageView.do?folderNm=place&fileNm="+v.place_no+".jpg'></td>";
						str += "<td>예약번호</td>";
						str += "<td>장소이름</td>";
						str += "<td>결제일</td>";
						str += "<td>결제금액</td>";
						str += "<td>예약일</td>";
						str += "<td>예약시작</td>";
						str += "<td>예약끝</td>";
						str += "<td> </td>";
						str += "</tr>";
						str += "<tr>";
						
						str += "<td>" + v.placetime_no + "</td>";
						str += "<td>" + v.place_name + "</td>";
						
						inde = v.placepay_date.indexOf(" ");
						ppdate = v.placepay_date.substring(0, inde);
						
						str += "<td>" + ppdate + "</td>";
						str += "<td>" + v.placepay_price + "</td>";
						
						indd = v.placetime_date.indexOf(" ");
						ptdate = v.placetime_date.substring(0, indd);
						
						str += "<td>" + ptdate + "</td>";
						str += "<td>" + v.placetime_stime + "</td>";
						str += "<td>" + v.placetime_etime + "</td>";
						if(v.placepay_state == "결제완료"){
							str += "<td><button type='button' id='refundbtn' value='"+v.placepay_no+"'>환불</button></td>";
						}else{
							str += "<td>환불완료</td>"
						}
							str += "</tr>";
						str += "</table>"
						str += "</div>";
					})
					$('#payList').html(str);		
					}
				},
				dataType : 'json'
			})
			
			
			$(document).on('click', '#refundbtn', function(){
					payNo = $(this).val();
					
					$.ajax({
						url : '<%=request.getContextPath()%>/PlaceRefund.do',
						data : {'payNo' : payNo},
						dataType : 'json',
						error : function(xhr){
							alert("상태 : " + xhr.status);
						},
						success : function(res){
							alert(res);
							location.reload();
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
			<h2>장소 결제 내역</h2>
			
			<div id="payList">
<!-- 									loca = "location.href='http://localhost/Moram/mypage/refund.jsp?payNo=" + v.placepay_no;  -->
			</div>
			
			
		
		</div>
	</section>
<%@ include file="../static/footer.jsp" %> 
</body>
</html>