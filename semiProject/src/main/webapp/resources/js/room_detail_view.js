var mapContainer = document.getElementById('mapin'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(nowAddress, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">매물위치</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});

var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map2 = new kakao.maps.Map(mapContainer, mapOption); 

// 주소로 좌표를 검색합니다
geocoder.addressSearch('서울특별시 금천구 남부순환로108길 20', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords2 = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker2 = new kakao.maps.Marker({
            map: map2,
            position: coords2
        });

        

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map2.setCenter(coords2);
    } 
});

var mapContainer = document.getElementById('map3'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  
 
var map3 = new kakao.maps.Map(mapContainer, mapOption); 

geocoder.addressSearch('서울특별시 관악구 행운1마길 20 2층201호', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords3 = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker3 = new kakao.maps.Marker({
            map: map3,
            position: coords3
        });

        

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map3.setCenter(coords3);
    } 
});


document.getElementById("modifyBtn").addEventListener("click", () => {
   
  location.href
    += "/update"
		+ location.search
    
//http://localhost:8080/link/boardReadMore/70
    //				   /board2/boardReadMore/70/update (GET 요청)

});



// 게시글 삭제 버튼이 클릭되었을 때

document.getElementById("deleteBtn").addEventListener("click", () => {
   
  location.href
    += "/delete"
		+ location.search
    
//http://localhost:8080/link/boardReadMore/70
    //				   /board2/boardReadMore/70/delete (GET 요청)

});




