
const checkObj = {
    "newMemberPw" : false,
    "newMemberPwConfirm" : false
};


// 비밀번호/비밀번호 확인 유효성 검사
const newMemberPw = document.getElementById("newMemberPw");
const newMemberPwConfirm = document.getElementById("newMemberPwConfirm");
const pwMessage = document.getElementById("pwMessage");

// 비밀번호 입력 시 유효성 검사
newMemberPw.addEventListener("input", () => {

    // 비밀번호가 입력되지 않은 경우
    if(newMemberPw.value.trim().length == 0){
        newMemberPw.value = ""; // 띄어쓰지 못넣게 하기
        pwMessage.innerText = "영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요";
        pwMessage.classList.remove("confirm", "error"); // 검정 글씨

        checkObj.newMemberPw = false; // 빈칸 == 유효 X
        return;
    }


    // 정규 표현식을 이용한 비밀번호 유효성 검사

    // 영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이
    const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,20}$/;

    // 입력한 비밀번호가 유효한 경우
    if(regEx.test(newMemberPw.value)){
        checkObj.newMemberPw = true; 
        
        // 비밀번호가 유효하게 작성된 상태에서
        // 비밀번호 확인이 입력되지 않았을 때
        if(newMemberPwConfirm.value.trim().length == 0){

            pwMessage.innerText = "유효한 비밀번호 형식입니다";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
        
        }else{
            // 비밀번호가 유효하게 작성된 상태에서
            // 비밀번호 확인이 입력되어 있을 때

            // 비밀번호 == 비밀번호 확인  (같을 경우)
            if(newMemberPw.value == newMemberPwConfirm.value){
                pwMessage.innerText = "비밀번호가 일치합니다";
                pwMessage.classList.add("confirm");
                pwMessage.classList.remove("error");
                checkObj.newMemberPwConfirm = true;
                
            } else{ // 다를 경우
                pwMessage.innerText = "비밀번호가 일치하지 않습니다";
                pwMessage.classList.add("error");
                pwMessage.classList.remove("confirm");
                checkObj.newMemberPwConfirm = false;
            }
        }

        
    } else{ // 유효하지 않은 경우
        
        pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");
        checkObj.newMemberPw = false; 
    }
});


// 비밀번호 확인 유효성 검사
newMemberPwConfirm.addEventListener('input', ()=>{

    if(checkObj.newMemberPw){ // 비밀번호가 유효하게 작성된 경우에

        // 비밀번호 == 비밀번호 확인  (같을 경우)
        if(newMemberPw.value == newMemberPwConfirm.value){
            pwMessage.innerText = "비밀번호가 일치합니다";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
            checkObj.newMemberPwConfirm = true;
            
        } else{ // 다를 경우
            pwMessage.innerText = "비밀번호가 일치하지 않습니다";
            pwMessage.classList.add("error");
            pwMessage.classList.remove("confirm");
            checkObj.newMemberPwConfirm = false;
        }

    } else { // 비밀번호가 유효하지 않은 경우
        checkObj.newMemberPwConfirm = false;
    }
});


// 새 비밀번호 form태그가 제출 되었을 때
document.getElementById("newPwFrm").addEventListener("submit", e=>{

    let isValid = true;

    for (let key in checkObj) {
        if (!checkObj[key]) {
            switch (key) {
                case "newMemberPw":
                    alert("비밀번호가 유효하지 않습니다");
                    isValid = false;
                    break;
                case "newMemberPwConfirm":
                    alert("비밀번호가 일치하지 않습니다");
                    isValid = false;
                    break;
            }

            // 유효하지 않은 input 태그로 focus 이동
            // key를 input의 id와 똑같이 설정했음
            document.getElementById(key).focus();
        }
    }

    if (isValid) {
        // 모든 유효성 검사가 통과한 경우에만 로그인 페이지로 이동
        console.log("새비번성공");
        window.location.href = "/link/login";
    } else {
        e.preventDefault(); // form 태그 기본 이벤트 제거
    }
    
    	
});

