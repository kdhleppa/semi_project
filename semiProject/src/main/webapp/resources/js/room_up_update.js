// 미리보기 관련 요소 모두 얻어오기

// img 5개
const preview = document.getElementsByClassName("preview");

// file 5개
const inputImage = document.getElementsByClassName("inputImage"); 

// x버튼 5개
const deleteImage = document.getElementsByClassName("delete-image"); 
// -> 위에 얻어온 요소들의 개수가 같음 == 인덱스가 일치함



// 게시글 수정 시 삭제된 이미지의 순서를 기록할 Set 객체 생성
const deleteSet = new Set(); // 순서x, 중복x
// -> X버튼 클릭 시 순서를 한 번만 저장하는 용도



for(let i=0 ; i< inputImage.length ; i++){

    // 파일이 선택되거나, 선택 후 취소 되었을 때
    inputImage[i].addEventListener('change', e => {

        const file = e.target.files[0]; // 선택된 파일의 데이터

        if(file != undefined){ // 파일이 선택 되었을 때

            const reader = new FileReader(); // 파일을 읽는 객체

            reader.readAsDataURL(file);
            // 지정된 파일을 읽은 후 result 변수에 URL 형식으로 저장

            reader.onload = e => { // 파일을 다 읽은 후 수행
                preview[i].setAttribute("src", e.target.result);

                // 이미지가 성공적으로 읽어지면
                // deleteSet에서 삭제
                deleteSet.delete(i);
            }

        } else { // 선택 후 취소 되었을 때
                // -> 선택된 파일 없음 -> 미리보기 삭제
            preview[i].removeAttribute("src");
        }
    });


    // 미리보기 삭제 버튼(X버튼)
    deleteImage[i].addEventListener('click', () => {

        // 미리보기 이미지가 있을 경우
        if(preview[i].getAttribute("src") != ""){

            // 미리보기 삭제
            preview[i].removeAttribute("src");

            // input type="file" 태그의 value를 삭제
            // **  input type="file" 의 value는 ""(빈칸)만 대입 가능 **
            inputImage[i].value = "";  


            // deleteSet에 삭제된 이미지 순서(i) 추가
            deleteSet.add(i);
        }

    });
}



function validateDate() {
    var dateInput = document.getElementById("enterDateText");
    var enteredDate = dateInput.value;
    var currentDate = new Date();
    var enteredDateObject = new Date(enteredDate.slice(0, 4), enteredDate.slice(4, 6) - 1, enteredDate.slice(6, 8));
/*
    // 날짜 형식 검사
    if (!/^\d{4}\d{2}\d{2}$/.test(enteredDate)) {
        alert("날짜 형식에 맞지 않습니다.");
        dateInput.value = "";
        return;
    }
*/
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
        selectedRadio.value = 'Y';
    }
}

function updateRadioValue() {
    var textValue = document.getElementById("enterDateText").value;
    var selectedRadio = document.querySelector("input[name='enterDate']:checked");

    if (selectedRadio && selectedRadio.id === "dateSelection") {
        selectedRadio.value = textValue;
    } else if (selectedRadio.id === "immediateMoveIn") {
        selectedRadio.value = null;
    }
}

// 각종 입력창 널값 에러 띄우기
document.getElementById('roomUpFrm').addEventListener('submit', function(event) {
       if (document.getElementById('regtstration-checkbox').value == null) {
    	alert("매물 관리 규정을 확인해 주세요");
    	event.preventDefault();
    	}
	   	 // 라디오 버튼 선택 확인
	    var radios = document.getElementsByName('roomType');
	    var radioChecked = false;
	
	    for (var i = 0; i < radios.length; i++) {
	        if (radios[i].checked) {
	            radioChecked = true;
	            break;
	        }
	    }
	
	    if (!radioChecked) {
	        alert("원룸 또는 투룸을 선택해 주세요");
	        event.preventDefault();
	    }
	    
	    // roomSize 입력 확인
	    var roomSizeValue = document.getElementById('roomSize').value;
	    if (!roomSizeValue || roomSizeValue.trim() === "") {
	        alert("방 크기를 입력해주세요!");
	        event.preventDefault();
	    } else if (isNaN(roomSizeValue)) { // 숫자가 아닌 경우
	        alert("숫자로 입력해 주세요");
	        event.preventDefault();
	    }
	    document.querySelector("[name='deleteList']").value 
        =  Array.from(deleteSet);
});

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var mapContainer = document.getElementById('mapbox'), // 지도를 표시할 div 
    mapOption = {
    	
	    	center: new kakao.maps.LatLng(33.450701, 126.570667),
	    	level: 3 // 지도의 중심좌표
	    
	    		};
	    		
var map;
if (centerAddress == null) {
    map = new kakao.maps.Map(mapContainer, mapOption);
} else {
    var geocoder = new kakao.maps.services.Geocoder();
    geocoder.addressSearch(centerAddress, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var options = {
                center: new kakao.maps.LatLng(result[0].y, result[0].x),
                level: 3
            };
            map = new kakao.maps.Map(mapContainer, options);
        }
    });
}







    	

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 


var previousMarker = null;
var previousInfowindow = null;


document.getElementById("adress-btn").addEventListener("click", function(){
    const textbox = document.getElementById("productAddress")

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