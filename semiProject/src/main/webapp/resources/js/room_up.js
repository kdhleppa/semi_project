// 현재 선택된 파일들을 저장하는 배열
var selectedFiles = [];

document.getElementById('fileInput').addEventListener('change', function(event) {
    var newFiles = Array.from(event.target.files); // 새로 선택된 파일들

    if (selectedFiles.length + newFiles.length > 5) {
        alert("사진은 5장까지만 올려주세요");
        event.target.value = ""; // input 필드 초기화
        return;
    }

    // 선택된 파일과 현재 선택된 파일을 합칩니다.
    selectedFiles = selectedFiles.concat(newFiles);

    updatePreviews();
    event.target.value = ""; // input 필드 초기화
});

var deleteButtons = document.querySelectorAll('.delete-image');
deleteButtons.forEach(function(btn, index) {
    btn.addEventListener('click', function() {
        selectedFiles.splice(index, 1); // 선택된 파일에서 해당 파일 제거
        updatePreviews();
    });
});

// 선택된 파일들을 프리뷰로 표시하는 함수
function updatePreviews() {
    var previewElems = document.querySelectorAll('.preview');

    // 모든 프리뷰 초기화
    previewElems.forEach(function(preview) {
        preview.src = "";
    });

    // 선택된 파일을 프리뷰로 표시
    selectedFiles.forEach(function(file, index) {
        var reader = new FileReader();
        reader.onload = function(e) {
            previewElems[index].src = e.target.result;
        };
        reader.readAsDataURL(file);
    });
}

document.getElementById('roomUpFrm').addEventListener('submit', function(event) {
    if (selectedFiles.length !== 5) {
        alert("사진은 5장 모두 올려주세요");
        event.preventDefault(); // 폼 제출 중단
    }
});

function validateDate() {
    var dateInput = document.getElementById("enterDateText");
    var enteredDate = dateInput.value;
    var currentDate = new Date();
    var enteredDateObject = new Date(enteredDate.slice(0, 4), enteredDate.slice(4, 6) - 1, enteredDate.slice(6, 8));

    // 날짜 형식 검사
    if (!/^\d{4}\d{2}\d{2}$/.test(enteredDate)) {
        alert("날짜 형식에 맞지 않습니다.");
        dateInput.value = "";
        return;
    }

    // 오늘 이후 날짜인지 검사
    if (enteredDateObject <= currentDate) {
        alert("오늘 이후로 작성해주세요.");
        dateInput.value = "";
        return;
    }
}

function toggleInputVisibility() {
    var selectedRadio = document.querySelector("input[name='enterDate']:checked");
    var dateInput = document.getElementById("enterDateText");
    
    if (selectedRadio && selectedRadio.id === "dateSelection") {
        dateInput.style.display = "block";  // 일자 선택을 클릭하면 인풋창이 보이게 함
        selectedRadio.value = dateInput.value;
    } else {
        dateInput.style.display = "none";  // 즉시 입주를 클릭하면 인풋창이 안 보이게 함
        selectedRadio.value = null;
    }
}

function updateRadioValue() {
    var textValue = document.getElementById("enterDateText").value;
    var selectedRadio = document.querySelector("input[name='enterDate']:checked");

    if (selectedRadio && selectedRadio.id === "dateSelection") {
        selectedRadio.value = textValue;
    }
}




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