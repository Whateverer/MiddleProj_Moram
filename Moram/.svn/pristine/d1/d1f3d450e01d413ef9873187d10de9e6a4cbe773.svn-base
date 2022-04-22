<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/Moram/css/main.css">

	
	
	<style>
	
		#myPagemoramLogo{
			height: 50%;
			width: 50%;
			display: block;
		}
		#modifymodalform{
			padding-left: 15%;
		}
		#modifyform, #psssModal{
		  display: none;
		}

 		.wrapper{ 
 		  text-align : center;
 		  margin : 5%; 
 		  padding: 2%; 
 		  width : 45%; 
 		  border : 1px solid #e9e9e9; 
 		}
		#listform{
		  display: inline-block;
		}
		#infoList{
		  font-size: 1.3em;
		}
		
		tr{
		  height: 60px;
		}
		td:nth-child(even){		
		  width: 350px;
		}
		td:nth-child(odd){
		  text-align:center;
		  width: 130px;
		  background: #e9e9e9;
		}
		
		tr:nth-child(even){
		  border-bottom: 1px solid black;
		  border-top: 1px solid black;
		}
		#updateModal{
			width: 110px;
			height: 50px;
		}
		#passUpdate{
			font-size : 0.7em;
			width: 60px;
			height: 2%;
			float: right;
			text-align: center;
		}
		
		#updatebtn, #deletebtn, #payListbtn{
			display: inline-block;
		}
		#btnMoem{
			text-align: right;
		}
		

	</style>
	
	
	<script>
	
	membervo = { }
	
		$(function(){
			
			$.ajax({
				url : '<%=request.getContextPath()%>/MemberInfo.do',
				error : function(xhr){
					alert('상태 : ' + xhr.status);
				},
				success : function(res){
					memId = res.mem_id;
						$('#mem_id').text(res.mem_id);
					memName = res.mem_name;	
						$('#mem_name').text(res.mem_name);
					memPass = res.mem_pass;
					str = "";
					for(i = 0; i < memPass.length; i++){
						str += "●";
					}
						$('#mem_pass').text(str);
					memBir = res.mem_bir;
						$('#mem_bir').text(res.mem_bir);
					memEmail = res.mem_email;
						$('#mem_email').text(res.mem_email);
					memTel = res.mem_tel; 
						$('#mem_tel').text(res.mem_tel);
					memRgn = res.mem_rgn;
						$('#mem_rgn').text(res.mem_rgn);
					memJdate = res.mem_jdate;
						$('#mem_jdate').text(res.mem_jdate);
				},
				dataType : 'json'
				
			})
			
			
			$('#deletebtn').on('click', function(){
				
				var flag = confirm("정말 탈퇴하시겠습니까?");
				
				if(flag == true){
				$.ajax({
				url : '<%=request.getContextPath()%>/MemberDelete.do',
				dataType : 'json',
				error : function(xhr){
					alert('상태 : ' + xhr.status);
				},
				success : function(res){
					alert(res);
					location.href = "http://localhost/Moram/login.jsp";
				}
				})
				}else{
					return false;
				}
				
			})
			
			
			
			$('#updatebtn').on('click', function(){
  				$('#modifyModal').modal('show');
  				
  				$('#id').val(memId);
  				$('#name').val(memName);
  				$('#bir').val(memBir);
  				$('#tel').val(memTel);
  				$('#email').val(memEmail);
  				$('#rgn').val(memRgn);
  				$('#jdate').val(memJdate);
  				$('#passmodal2').val(str);
		})
		
			$('#send').on('click', function(){
				
				membervo.mem_id = $('#id').val();
				membervo.mem_name = $('#name').val();
				membervo.mem_bir = $('#bir').val();
				membervo.mem_tel = $('#tel').val();
				membervo.mem_email = $('#email').val();
				membervo.mem_rgn = $('#rgn').val();
				membervo.mem_jdate = $('#jdate').val();
				
				$.ajax({
					url : '<%=request.getContextPath()%>/MemberInfoUpdate.do',
					data : membervo,
					error : function(xhr){
						alert("상태 : " + xhr.status);
					},
					success : function(res){
						alert(res);
						document.location.reload();
					},
					dataType : 'json'
					
				})

				$('#modifyModal').modal('hide');
			})
		
	
		$('#passUpdate').on('click', function(){
			$('#passModal').modal('show');			
		})	
			
		$('#change').on('click', function(){
			
			ol1 = $('#old_pass1').val();
			ol2 = $('#old_pass2').val();
			nl1 = $('#new_pass1').val();
			nl2 = $('#new_pass2').val();
			
			if(ol1 != ol2 || ol1.length != ol2.length){
				alert("기존 비밀번호가 틀립니다.");
				return false;
			}
			
			if(nl1 != nl2 || nl1.length != nl2.length){
				alert("새로운 비밀번호가 틀립니다.");
				return false;
			}
			if(ol1.length <= 0 || ol2.length <= 0 || nl1.length <= 0  || nl2.length <= 0 ){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			$.ajax({
					url : '<%=request.getContextPath()%>/PassUpdate.do',
					type : 'get',
					data : {"old_pass" : ol1,
							"new_pass" : nl1},
					dataType : 'json',
					error : function(xhr){
						alert("상태 : "+ xhr.status);
					},
					success : function(res){
						alert(res);
					}
					
				})
				$('#passModal').modal('hide');
				
		})
	
	
	
	})
	</script>

</head>
	<body>
<%@ include file="../static/header.jsp" %>
<section>
	<div class="wrapper">
		<div id="updateform">
		  <div id="listform">
			<table id="infoList">
				<tr>
				  <td>아이디</td>
				  <td id="mem_id" style="padding-left:100px"></td>
				</tr>
				
				<tr>
				  <td>이름  </td>
				  <td id="mem_name" style="padding-left:100px"></td>
				</tr>
			
				<tr>
				  <td>비밀번호</td>
				  <div><td style="padding-left:100px"><div id="mem_pass" style="display:inline-block"></div><input type="button" id="passUpdate" class="btn" value="변경"></td></div>
				</tr>
				
				<tr>
				  <td>생년월일  </td>
				  <td id="mem_bir" style="padding-left:100px"></td>
				</tr>
				
				<tr>
				  <td>이메일 </td>
				  <td id="mem_email" style="padding-left:100px"></td>
				</tr>
				
				<tr>
				  <td>전화번호  </td>
				  <td id="mem_tel" style="padding-left:100px"></td>
				</tr>
				
				<tr>
				  <td>지역  </td>
				  <td id="mem_rgn" style="padding-left:100px"></td>
				</tr>
				
				<tr>
				  <td>가입일  </td>
				  <td id="mem_jdate" style="padding-left:100px"></td>
				</tr>
			
			</table>
			<br><br><br><hr>
			<div id="btnMoem">
				<button type="button" class='btn' id="updatebtn">수정하기</button>
				<button type="button" class='btn' id="deletebtn">탈퇴하기</button>
			</div>
			</div>
		</div>
	</div>
		
		<div id="modifyModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
		    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body">
	        <form id="modifymodalform">
	        	<img id="myPagemoramLogo" src="/Moram/images/myPagemoram.png"><br><br>
	          <label id="updateModal">아이디</label> <input class="intext" type="text" name="id" id="id" readonly><br>
	          <label id="updateModal">이름</label><input class="intext" type="text" name="name" id="name"><br>
	          <label id="updateModal">비밀번호</label><input class="intext" type="password" name="pass" id="passmodal2" readonly><br> 
	          <label id="updateModal">생년월일</label> <input class="intext" type="text" name="bir" id="bir" readonly><br>
	          <label id="updateModal">이메일</label> <input class="intext" type="text" name="email" id="email"><br>
	          <label id="updateModal">전화번호</label> <input class="intext" type="text" name="tel" id="tel"><br>
	          <label id="updateModal">지역</label> <input class="intext" type="text" name="rgn" id="rgn"><br>
	          <label id="updateModal">가입일</label> <input class="intext" type="text" name="jdate" id="jdate" readonly><br>
<!-- 	          <label id="updateModal">프로필사진</label> <input class="intext" type="file" name="profil" id="profil"><br> -->
	          <input type="button" value="수정" id="send" class="btn" >
	          <input type="reset" value="초기화" class="btn" >
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
		</div>
		</div>
		
		<div id="passModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
		    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body">
	        <form>
	          <label id="updateModal">기존 비밀번호</label> <input class="intext" type="password" name="old_pass1" id="old_pass1"><br>
	          <label id="updateModal">비밀번호 확인</label> <input class="intext" type="password" name="old_pass2" id="old_pass2"><br>
	          <label id="updateModal">새 비밀번호</label><input class="intext" type="password" name="new_pass1" id="new_pass1"><br>
	          <label id="updateModal">새 비밀번호 확인</label><input class="intext" type="password" name="new_pass2" id="new_pass2"><br>
	          <input type="button" value="변경" id="change" class="btn" >
	          <input type="reset" value="초기화" class="btn" >
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