<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Insert title here</title>
<style type="text/css">
	#chatArea {
		
		padding: 5px;   width : 430px;
		margin: 0px auto;
	}
	#connectArea {
		border:2px solid green;	padding: 5px; width : 430px;
		margin: 0px auto;
	}
		
</style>
</head>
<body>
	<div id="">
		<div id="chatArea">
			<!-- 메시지 표시 영역 -->
			<textarea id="messageTextArea" readonly="readonly" rows="10" cols="63"></textarea><br><br>
			<!-- 송신 메시지 텍스트박스 -->
			<input type="text" id="messageText" size="40"> <!-- onkeydown="sendMessage()" -->
			<!-- 송신 버튼 -->
			<input type="button" value="Send" id="btnSend">
			<input type="button" value="접속종료" id="btnClose">
		</div>

  </div>
    
	<script type="text/javascript">
	id = "<%=session.getAttribute("sessionId") %>";
		var webSocket = null; // 웹소켓 변수 선언
		var messageTextArea = document.getElementById("messageTextArea");
		var messageText = document.getElementById("messageText");
		var userText = id;
		connectting();
		function connectting(){
// 			if(userText.value.trim()==""){
// 				alert("접속자 ID를 입력하세요");
// 				userText.focus();
// 				return;
// 			}
			//웹소켓 초기화
			webSocket = new WebSocket("ws://192.168.42.32/Moram/websocktMultichat.do");
				
			// 접속 성공하면 
			webSocket.onopen = function onOpen(event){

			webSocket.send(userText);
				
			}
			
			//메시지가 오면 messageTextArea요소에 메시지를 추가한다.
			webSocket.onmessage = function processMessge(message){
					//Json 풀기
					var jsonData = JSON.parse(message.data);
					if(jsonData.message != null) {
							messageTextArea.value += jsonData.message + "\n"
							messageTextArea.scrollTop = 9999999;
					};
			}
			
			webSocket.onerror = function showErrorMsg(event) {
				alert("오류 : " + event.data);
			}
			
			webSocket.onclose = function(event){
			

			}
		}
	
			
			//메시지 보내기
			function sendMessage(){
				if(messageText.value.trim()==""){
					messageText.focus();
				return;
			}
				webSocket.send(messageText.value);
				messageText.value = "";
			}
			
			function closing(){
				webSocket.close();
			}
			
			// 이벤트 설정
			function addEvent(){    
// 				document.getElementById("btnConnect").addEventListener("click", connectting, false);
				document.getElementById("btnSend").addEventListener("click", sendMessage, false);
				document.getElementById("btnClose").addEventListener("click", closing, false);
			}
			window.addEventListener("load", addEvent, false);

			window.onbeforeunload = function(){
				closing();
			}
			addEvent();
	</script>
</body>
</html>