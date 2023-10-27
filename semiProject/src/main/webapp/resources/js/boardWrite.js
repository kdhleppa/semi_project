// document.getElementById('img').addEventListener('change', e => {

//     const file = e.target.files[0]; // 선택된 파일의 데이터
//     const reader = new FileReader(); // 파일을 읽는 객체
    
// 	if(file != undefined){ // 파일이 선택 되었을 때
		
// 		reader.readAsDataURL(file);
//         // 지정된 파일을 읽은 후 result 변수에 URL 형식으로 저장
        
//         reader.onload = function(e) {
// 	        const preview = document.getElementById('preview');
// 	        preview.src = e.target.result;
// 	    }
// 	}
// });


// // 미리보기 관련 요소 모두 얻어오기

// // file
// const inputImage = document.getElementsByClassName("inputImage"); 

// // x버튼
// const deleteImage = document.getElementsByClassName("delete-image"); 

//     // 미리보기 삭제 버튼(X버튼)
//     deleteImage.addEventListener('click', () => {

//         // 미리보기 이미지가 있을 경우
//         if(preview.getAttribute("src") != ""){

//             // 미리보기 삭제
//             preview.removeAttribute("src");

//             // input type="file" 태그의 value를 삭제
//             // **  input type="file" 의 value는 ""(빈칸)만 대입 가능 **
//             inputImage.value = "";  
//         }

//     });


document.getElementById('imageButton').addEventListener('click', function() {
    document.getElementById('imageInput').click();
});

document.getElementById('imageInput').addEventListener('change', function(e) {
    const selectedFile = e.target.files[0];
    const selectedFileName = selectedFile.name;

    document.getElementById('selectedImageName').textContent = `선택된 이미지 파일: ${selectedFileName}`;
});