<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모람 위임 신청</title>
	<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="/Moram/css/main.css">
	
	<style>
		#wrapper{
			height: 100%;
		}

		#endTr{
			text-align: right;
		}
		#moramiSel{
			width: 177px;
		}
		#text2{
			margin: 8%;
			margin-top: 5%;
		}
		
	</style>
	
	<script>
	
	$(function(){
		
		$('#moramName').val("모람지기가 아닙니다.");
		
		$.ajax({
			url : '<%=request.getContextPath()%>/MoramItzy.do',
			dataType : 'json',
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			success : function(res){
					$('#moramName').val(res.mr_name);
				
			}
		})
		
		
		
		
		$.ajax({
			url : '<%=request.getContextPath()%>/MoramiItzy.do',
			dataType : 'json',
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			success : function(res){
		
					str = "<option value='모라미 선택'>모라미 선택</option>";
					$.each(res, function(i, v){
						str += "<option value='" + v.mem_id + "'>";
						str += v.mem_id;
						str += "</option>";
					})
					
					$('#moramiSel').html(str);
			}
			
		})
		
		
		$('#btn').on('click', function(){
			
			
			if($('#moramName').val().length == 0){
				alert("모람명을 입력해주세요");
				return false;
			}
			if($("#moramiSel option:selected").val() == 0 || $("#moramiSel option:selected").val() == "모라미 선택"){
				alert("모라미를 선택해주세요.");
				return false;
			}
			
			
			$.ajax({
				url : '<%=request.getContextPath()%>/YouMoramJigi.do',
				dataType : 'json',
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				success : function(res){
					if(res == 0){
						flag = 1;
						alert("모람지기만 신청할 수 있습니다.");
						return false;
					}else if(res == 1){
						flag = 2;
						
					}
				}
			
			})
			
			if(flag == 2){
			$.ajax({
				url : '<%=request.getContextPath()%>/MoramWeim.do',
				data : {"moramName" : $('#moramName').val(),
						"moramiName" : $("#moramiSel option:selected").val()},
				dataType : 'json',
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				success : function(res){
					if(res <= 0){
						alert("위임신청 실패");
					}else{
						alert("위임신청 성공");
					}
				}
				
			})
			}else if(flag == 1){
				return false;
			}
		})
	})
	</script>

</head>
<body>
<%@ include file="../static/header.jsp" %>
<section>
	<div class="wrapper">
	 <div id="text2">
	  <hr>
	  <h4>
	  <br>
	  안녕하세요. 모람입니다.<br><br>
	  불가피하게 모람지기로 활동 중인 모람을 탈퇴해야할 경우 사용하는 서비스 입니다.<br> 
	  저희 모람은 건전한 활동을 위해 모람지기 위임의 경우 관리자의 수락이 필요합니다.<br>
	  해당 서비스는 모람지기만 이용할 수 있습니다.<br><br> 신청하기 전 위임받을 모라미와 모람지기의 충분한 대화를 필요로 합니다.<br>
	 </h4>
	 <p style="color:red">
	 ※ 모람지기가 모람권을 사용 중일 시 정상적인 신청 완료 후 부터 모람권의 소유자가 위임받는 모람지기로 위임됩니다. 
	 </p>
	 <p style="color:red">
	 ※ 위임받을 모라미의 동의 없는 위임신청은 취소될 수 있습니다.
	 </p>
	 <p style="color:red">
	 ※ 위임 받은 모라미가 결제를 미납할 경우 해당 모람의 모람권은 취소 될 수 있습니다.
	 </p><br><hr><br><br>
		<table id="weim" style="display: inline-block">
			<tr>
			  <td>위임할 모람명</td>
			  <td><input type="text" id="moramName"></td>
			</tr>
			<tr>
			  <td>위임받을 모라미ID</td>
			  <td>
			  	<select id="moramiSel">
			  		
			  	</select>
			  </td>
			</tr>
			<tr><td> </td><td> </td></tr>
			<tr id="endTr">
			  <td></td>
			  <td><button type="button" class='btn' id="btn">신청하기</button></td>
			</tr>
		</table>
		<br>
			
	</div>
	</div>
</section>
<%@ include file="../static/footer.jsp" %> 
</body>
</html>