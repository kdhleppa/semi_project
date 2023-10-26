// 미리보기 관련 요소 모두 얻어오기

// img
const preview = document.getElementsByClassName("preview"); 

// file
const inputImage = document.getElementsByClassName("inputImage"); 

// x버튼
const deleteImage = document.getElementsByClassName("delete-image"); 



    inputImage.addEventListener('change', e => {

        const file = e.target.files; // 선택된 파일의 데이터

        if(file != undefined){ // 파일이 선택 되었을 때

            const reader = new FileReader(); // 파일을 읽는 객체

            reader.readAsDataURL(file);
            // 지정된 파일을 읽은 후 result 변수에 URL 형식으로 저장

            reader.onload = e => { // 파일을 다 읽은 후 수행
                preview.setAttribute("src", e.target.result);
            }

        } else { // 선택 후 취소 되었을 때
                // -> 선택된 파일 없음 -> 미리보기 삭제
            preview.removeAttribute("src");
        }
    });


    // 미리보기 삭제 버튼(X버튼)
    deleteImage.addEventListener('click', () => {

        // 미리보기 이미지가 있을 경우
        if(preview.getAttribute("src") != ""){

            // 미리보기 삭제
            preview.removeAttribute("src");

            // input type="file" 태그의 value를 삭제
            // **  input type="file" 의 value는 ""(빈칸)만 대입 가능 **
            inputImage.value = "";  
        }

    });


});