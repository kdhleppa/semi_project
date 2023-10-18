var map = new kakao.maps.Map(document.getElementById('main-right'), { 
    center : new kakao.maps.LatLng(37.484165, 126.929452),
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

async function fetchProductsAndAddMarkers() {
    try {
        // 백엔드에서 물건 정보 가져오기
        let response = await fetch("/link/getProducts");
        let products = await response.json();

        // 주소를 좌표로 변환하고 마커 클러스터러에 추가
        products.forEach(product => {
            let address = product.productAddress;

            geocoder.addressSearch(address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    var marker = new kakao.maps.Marker({
                        position: coords
                    });
                    clusterer.addMarker(marker);
                } else {
                    console.error("Failed to get coords for address:", address);
                }
            });
        });

    } catch (error) {
        console.error("Error fetching products:", error);
    }
}

// 함수 호출
fetchProductsAndAddMarkers();

	



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






