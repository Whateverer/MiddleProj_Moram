<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="/Moram/css/main.css">
	
	<style>
		#contentList{
			height: 100px;
			margin: 2%;
			margin-left: 5%;
			margin-top: 3%;
			padding: 2%;
		}
		#wrapper{
			margin-right: 20%;
			margin-left: 10%;
		}
		
		#allpay, #morampay, #classpay{
			text-align : center;
			height: 60px;
			width: 250px;
			background: #f8f8f8;
			padding-top: 3%;
		}
		#topbtn{
			margin-left: 23%;
			margin-top: 3%;
		}
		#title2{
			margin-left: 13%;
		}
		td{
			text-align : center;
			width: 150px;
		}
		tr:nth-child(even){
			height: 90px;
			background: white;			
		}
		
		
	</style>
	
	
	<script>
		$(function(){
			
			$('#allpay').css('background', 'gray');
			
			$.ajax({
				url : '<%=request.getContextPath()%>/MoramPayList.do',
				dataType : 'json',
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				success : function(res){
					str = "";
					$.each(res, function(i, v){
						str += "<div id='contentList' style='background:#f8f8f8' class='pay'"+ i +">";
						str += "<table>";
						str += "<tr>";
						str += "<td>결제번호</td>";
						str += "<td>이용권</td>";
						str += "<td>구매일</td>";
						str += "<td>종료일</td>";
						str += "<td>결제종류</td>";
						str += "<td>결제상태</td>";
						str += "<td>환불하기</td>";
						str += "</tr>";
						str += "<tr>";
						str += "<td>" + v.subscribe_payno + "</td>";
						if(v.subscribe_no == 1){
							str += "<td>클래스권</td>";
						}else if(v.subscribe_no == 2){
							str += "<td>모람권49</td>";
						}else if(v.subscribe_no == 3){
							str += "<td>모람권59</td>";
						}
						
						inde2 = v.subscribe_pdate.indexOf(" ");
						subscribePdate = v.subscribe_pdate.substring(0, inde2);
						str += "<td>" + subscribePdate + "</td>";
						
						inde = v.subscribe_edate.indexOf(" ");
						subscribeEdate = v.subscribe_edate.substring(0, inde);
						
						str += "<td>" + subscribeEdate + "</td>";
						
						var today = new Date();
						var year = today.getFullYear();
						var month = today.getMonth();
						var day = today.getDate();
						
						var now = year + "-" + month + "-" + day;
						
						str += "<td>" + v.subscribe_paytype + "</td>";
						
						if(subscribeEdate < now){
							v.subscribe_pstate = "기간만료";
						}
						
						
						str += "<td>" + v.subscribe_pstate + "</td>";
						
						
						if(v.subscribe_pstate == "결제완료"){
							str += "<td><button type='button' id='rebtn' value="+ v.subscribe_payno +">환불</button></td>";
							
						}else if(v.subscribe_pstate == "환불완료" || v.subscribe_pstate == "기간만료"){
							str += "<td>.</td>";
						}
						str += "</tr>";	
						str += "</table>";
						str += "</div>";
					})
					$('#wrapper').html(str);
				}
				
			})
			
			$('#morampay').on('click', function(){
				
				$('#morampay').css('background', 'gray');
				$('#allpay').css('background', '#f8f8f8');
				$('#classpay').css('background', '#f8f8f8');
				
				$('#wrapper div:contains("클래스권")').hide();
				$('#wrapper div:contains("모람권")').show();
			
				
				
			})
			
			$('#classpay').on('click', function(){
				
				$('#classpay').css('background', 'gray');
				$('#allpay').css('background', '#f8f8f8');
				$('#morampay').css('background', '#f8f8f8');
				
				$('#wrapper div:contains("모람권")').hide();
				$('#wrapper div:contains("클래스권")').show();

			})
			
			$('#allpay').on('click', function(){				
				location.reload();	
			})

			$(document).on('click', '#rebtn', function(){
				
				subval = $('#rebtn').val();
				
				if(confirm('정말 환불하시겠습니까?') == true){
					
					$.ajax({
						url : '<%=request.getContextPath()%>/MoramRefund.do',
						data : {"subNo" : subval},
						dataType : 'json',
						error : function(xhr){
							alert("상태 : " + xhr.status);
						},
						success : function(res){
							alert(res);
							location.reload();
						}
						
						
					})
					
				}else{
					return false;
				}
				
			})
		
		
		})
	</script>
	
	
</head>
<body>
<%@ include file="../static/header.jsp" %>
	<section>
	  <div id="title2" style="display:inline-block">
	    <h2>이용권 결제내역</h2>
	  </div>
	  <div id=topbtn>
	  	<div id="allpay" style="display:inline-block">전체보기</div>
		<div id="morampay" style="display:inline-block">모람권 결제내역</div>
		<div id="classpay" style="display:inline-block">클래스권 결제내역</div>
	  </div>
		<div id="wrapper">
			
				
			
		</div>
	</section>
<%@ include file="../static/footer.jsp" %> 
</body>
</html>