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


var debounceTimer;
function displayMarkersWithinBounds(products) {
    if (debounceTimer) {
        clearTimeout(debounceTimer);
    }

    debounceTimer = setTimeout(() => {
        var bounds = map.getBounds();
        const moveProducts = [];
        
        clusterer.clear();

        // 각 주소 검색에 대한 Promise를 저장할 배열
        let promises = products.map(product => {
            return new Promise((resolve, reject) => {
                let address = product.productAddress;
                geocoder.addressSearch(address, (result, status) => {
                    if (status === kakao.maps.services.Status.OK) {
                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                        if (bounds.contain(coords)) {
                            var marker = new kakao.maps.Marker({
                                position: coords
                            });
                            clusterer.addMarker(marker);
                            moveProducts.push(product);
                        }
                    } else {
                        console.error("Failed to get coords for address:", address);
                    }
                    resolve();  // 주소 검색 완료
                });
            });
        });

        // 모든 주소 검색이 완료되면 DOM 업데이트
        Promise.all(promises).then(() => {
            var mainLeftElem = document.getElementById("main-left");
            mainLeftElem.innerHTML = '';

            if (moveProducts.length === 0) {
                var emptyMsgElem = document.createElement("p");
                emptyMsgElem.textContent = "앗! 이 주변에는 방이 없어요!";
                mainLeftElem.appendChild(emptyMsgElem);
            } else {
                moveProducts.forEach(product => {
                    var productContainer = document.createElement("div");
                    productContainer.className = "preview-container";
                    
                    var productImgElem = document.createElement("div");
                    productImgElem.className = "preview-img";
                    productImgElem.textContent = "방 대표사진자리";
                    productContainer.appendChild(productImgElem);

                    var productTextContainer = document.createElement("div");
                    productTextContainer.className = "preview-text-container";

                    var rentTypeElem = document.createElement("p");
                    rentTypeElem.textContent = product.productRentType;
                    productTextContainer.appendChild(rentTypeElem);

                    var depositElem = document.createElement("p");
                    depositElem.textContent = "보증금 : " + product.productDeposit + " 만원";
                    productTextContainer.appendChild(depositElem);

                    if (product.productMonthlyRent != 0) {
                        var monthlyRentElem = document.createElement("p");
                        monthlyRentElem.textContent = "월세 : " + product.productMonthlyRent + " 만원";
                        productTextContainer.appendChild(monthlyRentElem);
                    }

                    if (product.productMaintenace) {
                        var maintenanceElem = document.createElement("p");
                        maintenanceElem.textContent = "관리비 : " + product.productMaintenace + " 만원";
                        productTextContainer.appendChild(maintenanceElem);
                    }

                    productContainer.appendChild(productTextContainer);
                    mainLeftElem.appendChild(productContainer);
                });
            }
        });

    }, 300);
}

/*
function displayMarkersWithinBounds(products) {
    if (debounceTimer) {
        clearTimeout(debounceTimer);
    }

    debounceTimer = setTimeout(() => {
        // 현재 지도의 범위를 가져옴
        var bounds = map.getBounds();
		const moveProducts = [];
        // 마커 클러스터러에 추가된 마커들을 모두 제거
        clusterer.clear();
		
        products.forEach(product => {
            let address = product.productAddress;
            geocoder.addressSearch(address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 좌표가 현재 지도 범위 안에 있는지 확인
                    if (bounds.contain(coords)) {
                        var marker = new kakao.maps.Marker({
                            position: coords
                        });
                        clusterer.addMarker(marker);
                        console.log("프로덕트", product);
                        console.log("범위안의주소", address);
                        
                        moveProducts.push(product);
                        
                        console.log("범위안의주소의프로덕트", moveProducts);
                        
                        
                    } else {
                    	moveProducts.length = 0;
                    	console.log("범위안의주소의프로덕트", moveProducts);
                    }
                } else {
                    console.error("Failed to get coords for address:", address);
                    
                }
            });
        });
       var mainLeftElem = document.getElementById("main-left");
        mainLeftElem.innerHTML = '';  // 기존 내용 초기화

        if (moveProducts.length != 0) {
			moveProducts.forEach(product => {
                var productContainer = document.createElement("div");
                productContainer.className = "preview-container";
                
                var productImgElem = document.createElement("div");
                productImgElem.className = "preview-img";
                productImgElem.textContent = "방 대표사진자리";
                productContainer.appendChild(productImgElem);

                var productTextContainer = document.createElement("div");
                productTextContainer.className = "preview-text-container";

                var rentTypeElem = document.createElement("p");
                rentTypeElem.textContent = product.productRentType;
                productTextContainer.appendChild(rentTypeElem);

                var depositElem = document.createElement("p");
                depositElem.textContent = "보증금 : " + product.productDeposit + " 만원";
                productTextContainer.appendChild(depositElem);

                if (product.productMonthlyRent != 0) {
                    var monthlyRentElem = document.createElement("p");
                    monthlyRentElem.textContent = "월세 : " + product.productMonthlyRent + " 만원";
                    productTextContainer.appendChild(monthlyRentElem);
                }

                if (product.productMaintenace) {
                    var maintenanceElem = document.createElement("p");
                    maintenanceElem.textContent = "관리비 : " + product.productMaintenace + " 만원";
                    productTextContainer.appendChild(maintenanceElem);
                }

                productContainer.appendChild(productTextContainer);
                mainLeftElem.appendChild(productContainer);
            });
        } else {
            var emptyMsgElem = document.createElement("p");
            emptyMsgElem.textContent = "앗! 이 주변에는 방이 없어요!";
            mainLeftElem.appendChild(emptyMsgElem);
            
        }
    }, 300); // 300ms 딜레이
}
*/
// 지도의 범위 변경 이벤트에 대한 리스너 추가
kakao.maps.event.addListener(map, 'bounds_changed', function() {
    fetch("/link/getProducts")
        .then(response => response.json())
        .then(products => {
            displayMarkersWithinBounds(products);
        })
        .catch(error => {
            console.error("Error in fetchMapCluster:", error);
        });
});

 
// 초기 로딩 시 마커 표시

fetch("/link/getProducts")
    .then(response => response.json())
    .then(products => {
        displayMarkersWithinBounds(products);
    })
    .catch(error => {
        console.error("Error in fetchMapCluster:", error);
    });

/*
    fetch("/link/getProducts")
    	, {
     	method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    	})
       
    .then(response => response.json())
    .then(products => {
    	
        products.forEach(product => {
        	console.log("product:", product);
            let address = product.productAddress;
			console.log("address:", address);
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
    })
    .catch(error => {
        console.error("Error in fetchMapCluster:", error);
    });

*/	   
	   
	
	


/*
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
*/
/*
async function fetchProductsAndAddMarkers() {
    try {
        // 백엔드에서 물건 정보 가져오기
        let response = await fetch("/link/getProducts");
        let products = await response.json();

        // 지도의 현재 보이는 영역 가져오기
        let bounds = map.getBounds();
        
        // 주소를 좌표로 변환하고 마커 클러스터러에 추가
        products.forEach(product => {
            let address = product.productAddress;

            geocoder.addressSearch(address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    
                    // 좌표가 지도의 현재 보이는 영역 내에 있는지 확인
                    if (bounds.hasLatLng(coords)) {
                        var marker = new kakao.maps.Marker({
                            position: coords
                        });
                        clusterer.addMarker(marker);
                    }
                } else {
                    console.error("Failed to get coords for address:", address);
                }
            });
        });

    } catch (error) {
        console.error("Error fetching products:", error);
    }
}
*/
/*
// 함수 호출
fetchProductsAndAddMarkers();
*/
/*
// 추가
// Event listener for map bounds change
kakao.maps.event.addListener(map, 'bounds_changed', function() {
    fetchProductsAndAddMarkers();
});

// Event listener for map zoom change
kakao.maps.event.addListener(map, 'zoom_changed', function() {
    fetchProductsAndAddMarkers();
});	
*/


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








