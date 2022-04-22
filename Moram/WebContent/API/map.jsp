<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <title>지도 생성하기</title>
</head>

	<body>
	
			<!-- 지도를 표시할 div 입니다 -->
			<div id="map" style="width:60%;height:350px;"></div>
			
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=740f60de4554af42681d639629de1442"></script> 지도 생성 라이브러리 
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=740f60de4554af42681d639629de1442&libraries=services"></script> <!--  지도 주소 서비스 라이브러리 -->
			<script>
				///------------------------------------------------------------------------지도 생성미당
				var mapContainer = document.getElementById('map'),
				    mapOption = { 
				        center: new kakao.maps.LatLng(33.450701, 126.570667), 
				        level: 3 
				    };
				
				
				var map = new kakao.maps.Map(mapContainer, mapOption);
				///------------------------------------------------------------------------지도 생성미당
				///------------------------------------------------------------------------마커 생성미당
				var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);
				
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				marker.setMap(map);
				
				// marker.setMap(null);    // 지도위 마커 제거 표시임당당당
				///------------------------------------------------------------------------마커 생성미당								
				
				
				///------------------------------------------------------------------------지도 이동하게 임미당								
				var mapTypeControl = new kakao.maps.MapTypeControl();
				
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
				
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				///------------------------------------------------------------------------지도 이동하게 임미당								

				
				///------------------------------------------------------------------------주소 검색하게 임미당								
				// 주소->>>>>>>>>>>좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('대전 중구 문화동 1-135', function(result, status) {   // 여기만 변수로 변경 해주십쇼
				
				    // 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					console.log(status);
					
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    		} 
				});  
			</script>
	
	</body>

</html>