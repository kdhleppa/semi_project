const checkObj = {
    "memberEmail" : false,
    "authKey" : false
};


// 이메일 유효성 검사
const memberEmail = document.getElementById("memberEmail");
const emailMessage = document.getElementById("emailMessage");

// 이메일이 입력될 때 마다
memberEmail.addEventListener("input", () => {

    // 입력된 이메일이 없을 경우
    if(memberEmail.value.trim().length == 0){
        memberEmail.value = ""; 

        emailMessage.innerText = "메일을 받을 수 있는 이메일을 입력해주세요";

        // confirm, error 클래스 삭제해서 검정 글씨로 만들기
        emailMessage.classList.remove("confirm", "error");

        checkObj.memberEmail = false; // 빈칸 == 유효 X
        return;
    }


    // 정규 표현식을 이용해서 유효한 형식이지 판별
    // 1) 정규표현식 객체 생성
    const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

    // 2) 입력 받은 이메일과 정규식 일치 여부 판별
    if(  regEx.test(memberEmail.value)  ){ // 유효한 경우

        
		// GET 방식 
		fetch("/dupCheck/email?email=" + memberEmail.value)
		.then(res => res.text())
		.then(count => {
			
			//count : 중복되면 1, 중복 아니면 0
			if(count != 0) {
			 	emailMessage.innerText = "인증 가능한 이메일입니다";
        		emailMessage.classList.add("confirm"); // .error 스타일 적용
        		emailMessage.classList.remove("error"); // .confirm 스타일 제거
        		checkObj.memberEmail = true;
			}else {
        		emailMessage.innerText = "가입하지 않은 이메일입니다";
        		emailMessage.classList.add("error"); // .confirm 스타일 적용
        		emailMessage.classList.remove("confirm"); // .error 스타일 제거
        		checkObj.memberEmail = false;
			}	
			
		})
		.catch(err => console.log(err));
		

    } else{ // 유효하지 않은 경우(무효인 경우)
        emailMessage.innerText = "이메일 형식이 유효하지 않습니다";
        emailMessage.classList.add("error"); // .error 스타일 적용
        emailMessage.classList.remove("confirm"); // .confirm 스타일 제거

        checkObj.memberEmail = false; // 유효 X
    }
});


// --------------------- 이메일 인증 ---------------------

// 인증번호 발송
const sendAuthKeyBtn = document.getElementById("sendAuthKeyBtn");
const authKeyMessage = document.getElementById("authKeyMessage");
let authTimer;
let authMin = 4;
let authSec = 59;

// 인증번호를 발송한 이메일 저장
let tempEmail;

sendAuthKeyBtn.addEventListener("click", function(){
	
	console.log("test");
	
    authMin = 4;
    authSec = 59;

    checkObj.authKey = false;

    if(checkObj.memberEmail){


        /* fetch() API 방식 ajax */
        fetch("/sendEmail/signUpNum?email="+memberEmail.value)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                console.log("인증 번호가 발송되었습니다.")
                tempEmail = memberEmail.value;
            }else{
                console.log("인증번호 발송 실패")
            }
        })
        .catch(err => {
            console.log("이메일 발송 중 에러 발생");
            console.log(err);
        });
        

        alert("인증번호가 발송 되었습니다.");

        
        authKeyMessage.innerText = "05:00";
        authKeyMessage.classList.remove("confirm");

        authTimer = window.setInterval(()=>{
													// 삼항연산자  :  조건 	  ?   	true : false
            authKeyMessage.innerText = "0" + authMin + ":" + (authSec < 10 ? "0" + authSec : authSec);
            
            // 남은 시간이 0분 0초인 경우
            if(authMin == 0 && authSec == 0){
                checkObj.authKey = false;
                clearInterval(authTimer);
                return;
            }

            // 0초인 경우
            if(authSec == 0){
                authSec = 60;
                authMin--;
            }


            authSec--; // 1초 감소

        }, 1000)

    } else{
        alert("인증 가능한 이메일을 작성해주세요.");
        memberEmail.focus();
    }

});


// 인증 확인
const authKey = document.getElementById("authKey");
const checkAuthKeyBtn = document.getElementById("checkAuthKeyBtn");

checkAuthKeyBtn.addEventListener("click", function(){

    if(authMin > 0 || authSec > 0){ // 시간 제한이 지나지 않은 경우에만 인증번호 검사 진행
        /* fetch API */
        const obj = {"inputKey":authKey.value, "email":tempEmail}
        const query = new URLSearchParams(obj).toString()
        // inputKey=123456&email=user01

        fetch("/sendEmail/checkAuthKey?" + query)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                clearInterval(authTimer);
                authKeyMessage.innerText = "인증되었습니다.";
                authKeyMessage.classList.add("confirm");
                checkObj.authKey = true;

            } else{
                alert("인증번호가 일치하지 않습니다.")
                checkObj.authKey = false;
            }
        })
        .catch(err => console.log(err));


    } else{
        alert("인증 시간이 만료되었습니다. 다시 시도해주세요.")
    }

});


// 비밀번호 찾기 form태그가 제출 되었을 때
document.getElementById("findPwFrm").addEventListener("submit", e=>{

	let isValid = true;

    for (let key in checkObj) {
        if (!checkObj[key]) {
            switch (key) {
                case "memberEmail":
                    alert("이메일이 유효하지 않습니다");
                    isValid = false;
                    break;
                case "authKey":
                    alert("인증번호가 유효하지 않습니다");
                    isValid = false;
                    break;
            }

            // 유효하지 않은 input 태그로 focus 이동
            // key를 input의 id와 똑같이 설정했음
            document.getElementById(key).focus();
        }
    }

    if (isValid) {
        // 모든 유효성 검사가 통과한 경우에만 새 비밀번호 설정 페이지로 이동
        window.location.href = "/link/newPassword";
    } else {
        e.preventDefault(); // form 태그 기본 이벤트 제거
    }
		    
		    
});
