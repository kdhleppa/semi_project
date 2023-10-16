var mapContainer = document.getElementById('mapbox'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var previousMarker = null;
var previousInfowindow = null;


document.getElementById("adress-btn").addEventListener("click", function(){
    const textbox = document.getElementById("input-adress")

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(textbox.value, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
			removePreviousMarker();
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">검색주소</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	        previousMarker = marker;
            previousInfowindow = infowindow;
	    } 
	});    
});

// 이전 마커와 인포윈도를 삭제하는 함수
function removePreviousMarker() {
    if (previousMarker !== null) {
        previousInfowindow.close();

        previousMarker.setMap(null);
        
       
    }
}


window.onload = function() {
        // 보증금, 월세, 월세 라벨 숨김
        var productDepositField = document.getElementById('productDeposit');
        var productDepositLabel = document.getElementById('depositLabel');
        var monthlyRentField = document.getElementById('productMonthlyRent');
        var monthlyRentLabel = document.getElementById('monthlyRentLabel');
        var depositWon = document.getElementById('depositWon');
        var rentWon = document.getElementById('rentWon');
        
        
        productDepositField.style.display = 'none';
        productDepositLabel.style.display = 'none';
        monthlyRentField.style.display = 'none';
        monthlyRentLabel.style.display = 'none';
        depositWon.style.display = 'none';
        rentWon.style.display = 'none';
       
    };

    function showFields(rentType) {
        var productDepositField = document.getElementById('productDeposit');
        var productDepositLabel = document.getElementById('depositLabel');
        var monthlyRentField = document.getElementById('productMonthlyRent');
        var monthlyRentLabel = document.getElementById('monthlyRentLabel');
        var rentTypeMessage = document.getElementById('rentTypeMessage');
		
		
		
        if (rentType === '전세') {
            productDepositField.style.display = 'block';
            productDepositLabel.style.display = 'block';
            depositWon.style.display = 'block';
            monthlyRentField.style.display = 'none';
            monthlyRentLabel.style.display = 'none';
            rentTypeMessage.style.display = 'none';
            rentWon.style.display = 'none';
        } else if (rentType === '월세') {
            productDepositField.style.display = 'block';
            productDepositLabel.style.display = 'block';
            depositWon.style.display = 'block';
            monthlyRentField.style.display = 'block';
            monthlyRentLabel.style.display = 'block';
            rentWon.style.display = 'block';
            rentTypeMessage.style.display = 'none';
        } else {
            productDepositField.style.display = 'none';
            productDepositLabel.style.display = 'none';
            monthlyRentField.style.display = 'none';
            monthlyRentLabel.style.display = 'none';
            rentTypeMessage.style.display = 'block';
        }
    }