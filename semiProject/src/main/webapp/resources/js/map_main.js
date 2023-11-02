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

var searchParams;

document.getElementById("option").addEventListener("submit", function(event) {
    event.preventDefault(); // 폼의 기본 제출 행동을 막습니다.

    const formData = new FormData(event.target); // 폼의 데이터를 가져옵니다.
    searchParams = new URLSearchParams(formData).toString(); // 폼의 데이터를 URL 파라미터 형식으로 변환합니다.

    // AJAX 요청을 사용하여 데이터를 가져옵니다.
    fetch("/link/getProducts?" + searchParams)
        .then(response => response.json())
        .then(products => {
            displayMarkersWithinBounds(products);
        })
        .catch(error => {
            console.error("Error in fetch:", error);
        });
});


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
                	
                	var linkElem = document.createElement("a");
                	linkElem.href = "/productDetail/" + product.productNo;
                	
                    var productContainer = document.createElement("div");
                    productContainer.className = "preview-container";
                    
                    var productImgElem = document.createElement("div");
					productImgElem.className = "preview-img";
					// 이미지 요소를 생성합니다.
					var imgElem = document.createElement("img");
					imgElem.src = product.thumbnail; // 이미지 주소 설정
					productImgElem.appendChild(imgElem); // div 요소에 이미지 요소를 추가
					
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
                    linkElem.appendChild(productContainer);
                    mainLeftElem.appendChild(linkElem);
                });
            }
        });

    }, 300);
}


// 지도의 범위 변경 이벤트에 대한 리스너 추가
kakao.maps.event.addListener(map, 'bounds_changed', function() {
    fetch("/link/getProducts?" + searchParams)
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
		
		
		
        if (rentType.value === '전세') {
            productDepositField.style.display = 'block';
            productDepositLabel.style.display = 'block';
            depositWon.style.display = 'block';
            monthlyRentField.style.display = 'none';
            monthlyRentLabel.style.display = 'none';
            rentWon.style.display = 'none';
        } else if (rentType.value === '월세') {
            productDepositField.style.display = 'block';
            productDepositLabel.style.display = 'block';
            depositWon.style.display = 'block';
            monthlyRentField.style.display = 'block';
            monthlyRentLabel.style.display = 'block';
            rentWon.style.display = 'block';
        } else {
            productDepositField.style.display = 'none';
            productDepositLabel.style.display = 'none';
            monthlyRentField.style.display = 'none';
            monthlyRentLabel.style.display = 'none';
            rentWon.style.display = 'none';
            depositWon.style.display = 'none';
        }
    }