var map = new kakao.maps.Map(document.getElementById('main-right'), { // 지도를 표시할 div
    center : new kakao.maps.LatLng(37.402707, 126.922044), // 지도의 중심좌표 
    level : 3 // 지도의 확대 레벨 
});


// 마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 0, // 클러스터 할 최소 지도 레벨
    minClusterSize: 1 
});

// 밑의 좌표들을 서버에서 불러와서 뿌려줘야함.

var positions = [
    {
        title: '안양역', 
        "lat": 37.402707,
        "lng": 126.922044
    },
    {
        title: '안양역 주위 1', 
        "lat": 37.400707,
        "lng": 126.920044
    },
    {
        title: '안양역 주위 2', 
        "lat": 37.403007,
        "lng": 126.925044
    },
    {
        title: '안양역 주위 3',
        "lat": 37.405707,
        "lng": 126.925044
    }
];


var markers = positions.map(function(position) {
    return new kakao.maps.Marker({
        position : new kakao.maps.LatLng(position.lat, position.lng)
    });
});

// 클러스터러에 마커들을 추가합니다
clusterer.addMarkers(markers);



// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var previousMarker = null;
var previousInfowindow = null;

document.getElementById("adress-btn").addEventListener("click", function(){
    const textbox = document.getElementById("input-adress")
    
    geocoder.addressSearch(textbox.value, function(result, status) {
        
       

        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {
            console.log("hi");
            removePreviousMarker(); 
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    
            // 결과값으로 받은 위치를 마커로 표시합니다
            
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
    
             // 인포윈도우로 장소에 대한 설명을 표시합니다
             var infowindow = new kakao.maps.InfoWindow({
                 content: '<div id="div1" style="width:150px;text-align:center;padding:6px 0;">현재주소</div>'
             });
             infowindow.open(map, marker);
    
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
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






