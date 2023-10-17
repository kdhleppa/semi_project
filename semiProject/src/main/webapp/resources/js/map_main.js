fetch("/link/getProducts")
.then(res => res.json())
.then(products => console.log(products))

var map = new kakao.maps.Map(document.getElementById('main-right'), { 
    center : new kakao.maps.LatLng(37.402707, 126.922044),
    level : 3 
});

var geocoder = new kakao.maps.services.Geocoder();

var clusterer = new kakao.maps.MarkerClusterer({
    map: map,  
    averageCenter: true, 
    minLevel: 0, 
    minClusterSize: 1 
});

var markers = [];

// products는 서버로부터 받아온 주소 데이터 배열
products.forEach(product => {
    var address = product.productAddress;

    // 주소로 좌표를 검색
    geocoder.addressSearch(address, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 검색된 좌표로 마커 생성
            var marker = new kakao.maps.Marker({
                position: coords
            });

            markers.push(marker);
        } else {
            console.error("주소로 좌표 변환 실패:", address);
        }
    });
});

// 마커들을 클러스터러에 추가
clusterer.addMarkers(markers);	



	
	




var previousMarker = null;
var previousInfowindow = null;

document.getElementById("adress-btn").addEventListener("click", function(){
    const textbox = document.getElementById("input-adress")
    
    geocoder.addressSearch(textbox.value, function(result, status) {
        
       

         
         if (status === kakao.maps.services.Status.OK) {
            console.log("hi");
            removePreviousMarker(); 
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    
            
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
    
             var infowindow = new kakao.maps.InfoWindow({
                 content: '<div id="div1" style="width:150px;text-align:center;padding:6px 0;">현재주소</div>'
             });
             infowindow.open(map, marker);
    
            map.setCenter(coords);
            previousMarker = marker;
            previousInfowindow = infowindow;
        } else {
            console.log("nohi");
        }
        
    });

    console.log((textbox.value));
    


});





// 이전 마커와 인포윈도를 삭제하는 함수
function removePreviousMarker() {
    if (previousMarker !== null) {
        previousInfowindow.close();

        previousMarker.setMap(null);
        
       
    }
}






