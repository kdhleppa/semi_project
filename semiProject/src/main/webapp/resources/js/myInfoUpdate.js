
const checkObj = {
    "memberPw" : false,
    "memberPwConfirm" : false,
    "memberName" : false,
    "memberNickname" : false,
    "memberAddress" : false,
    "memberEmail" : false,
    "memberPhoneNum" : false,
    "authKey" : false
};

// 내 정보(수정) 페이지
const updateInfo = document.getElementById("updateInfo");
const memberNickname = document.getElementById("memberNickname");
const memberEmail = document.getElementById("memberEmail");

if(updateInfo != null){

	initNickname = memberNickname.value;
	initEmail = memberEmail.value;
	
// 닉네임 유효성 검사
const nickMessage = document.getElementById('nickMessage');

// 닉네임이 입력이 되었을 때
memberNickname.addEventListener("input", ()=>{

	if(memberNickname.value == initNickname){
		nickMessage.innerText = "기존 닉네임 입니다";
		checkObj.memberNickname = true;
		return;
	}
	
    // 닉네임 입력이 되지 않은 경우
    if(memberNickname.value.trim() == ''){
        nickMessage.innerText = "한글,영어,숫자로만 2~10글자";
        nickMessage.classList.remove("confirm", "error");
        checkObj.memberNickname = false;
        memberNickname.value = ""; 
        return;
    }

    // 정규표현식으로 유효성 검사
    const regEx = /^[가-힣\w\d]{2,10}$/;

    if(regEx.test(memberNickname.value)){// 유효

        fetch("/dupCheck/nickname?nickname="+memberNickname.value)
        .then(resp => resp.text()) // 응답 객체를 text로 파싱(변환)
        .then(count => {

            if(count == 0){ // 중복 아닌 경우
                nickMessage.innerText = "사용 가능한 닉네임 입니다";
                nickMessage.classList.add("confirm");
                nickMessage.classList.remove("error");
                checkObj.memberNickname = true;
                
            }else{ // 중복인 경우
                nickMessage.innerText = "이미 사용중인 닉네임 입니다";
                nickMessage.classList.add("error");
                nickMessage.classList.remove("confirm");
                checkObj.memberNickname = false;
            }
        })
        .catch(err => console.log(err));
	}

});


// 이메일 유효성 검사
const emailMessage = document.getElementById("emailMessage");

// 이메일이 입력될 때 마다
memberEmail.addEventListener("input", () => {

	if(memberEmail.value == initEmail){
		emailMessage.innerText = "기존 이메일입니다";
		checkObj.memberEmail = true;
		return;
	}
	
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

        /* fetch() API를 이용한 ajax(비동기 통신) : 이메일 중복*/
		//   url:   /dupCheck/email
		
		// GET 방식 
		fetch("/dupCheck/email?email=" + memberEmail.value)
		.then(res => res.text())
		.then(count => {
			
			//count : 중복되면 1, 중복 아니면 0
			if(count == 0 || initEmail == memberEmail ) {
			 	emailMessage.innerText = "사용 가능한 이메일입니다";
        		emailMessage.classList.add("confirm"); // .confirm 스타일 적용
        		emailMessage.classList.remove("error"); // .error 스타일 제거
        		checkObj.memberEmail = true;
			}else {
				emailMessage.innerText = "이미 사용중인 이메일입니다";
        		emailMessage.classList.add("error"); // .error 스타일 적용
        		emailMessage.classList.remove("confirm"); // .confirm 스타일 제거
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
	
    authMin = 4;
    authSec = 59;

    checkObj.authKey = false;

    if(checkObj.memberEmail == true){

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
        alert("중복되지 않은 이메일을 작성해주세요.");
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



}

// 이름 유효성 검사
const memberName = document.getElementById("memberName");
const nameMessage = document.getElementById('nameMessage');

// 이름이 입력이 되었을 때
memberName.addEventListener("input", () => {
        
    // 이름 입력이 되지 않은 경우
    if(memberName.value.trim() == ''){
        nameMessage.innerText = "한글만 2~6글자";
        nameMessage.classList.remove("confirm", "error");
        checkObj.memberName = false;
        memberName.value = ""; 
        return;
    }

    // 정규표현식으로 유효성 검사
    const regEx = /^[가-힣]{2,6}$/;

    if(regEx.test(memberName.value)){// 유효
    	nameMessage.innerText = "사용 가능한 이름입니다";
    	nameMessage.classList.add("confirm");
        nameMessage.classList.remove("error");
        checkObj.memberName = true;
    	
    } else{
        nameMessage.innerText = "이름 형식이 유효하지 않습니다";
        nameMessage.classList.add("error");
        nameMessage.classList.remove("confirm");
        checkObj.memberName = false;
    }
    
});


// 전화번호 유효성 검사
const memberPhoneNum = document.getElementById("memberPhoneNum");
const phoneMessage = document.getElementById("phoneMessage");

// 전화번호가 입력 되었을 때
memberPhoneNum.addEventListener("input", ()=>{

    // 전화번호가 입력이 되지 않은 경우
    if(memberPhoneNum.value.trim() == ''){
        phoneMessage.innerText = "전화번호를 입력해주세요.(- 제외)";
        phoneMessage.classList.remove("confirm", "error");
        checkObj.memberPhoneNum = false;
        memberPhoneNum.value = ""; 
        return;
    }

    // 정규표현식으로 유효성 검사
    const regEx = /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;

    if(regEx.test(memberPhoneNum.value)){// 유효
        phoneMessage.innerText = "유효한 전화번호 형식입니다";
        phoneMessage.classList.add("confirm");
        phoneMessage.classList.remove("error");
        checkObj.memberPhoneNum = true;
        
    } else{ // 무효
        phoneMessage.innerText = "전화번호 형식이 유효하지 않습니다";
        phoneMessage.classList.add("error");
        phoneMessage.classList.remove("confirm");
        checkObj.memberPhoneNum = false;
    }


});


// 비밀번호/비밀번호 확인 유효성 검사
const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMessage = document.getElementById("pwMessage");

// 비밀번호 입력 시 유효성 검사
memberPw.addEventListener("input", () => {

    // 비밀번호가 입력되지 않은 경우
    if(memberPw.value.trim().length == 0){
        memberPw.value = ""; // 띄어쓰지 못넣게 하기

        pwMessage.innerText = "영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요";
        pwMessage.classList.remove("confirm", "error"); // 검정 글씨

        checkObj.memberPw = false; // 빈칸 == 유효 X
        return;
    }


    // 정규 표현식을 이용한 비밀번호 유효성 검사

    // 영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이
    const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,20}$/;

    // 입력한 비밀번호가 유효한 경우
    if(regEx.test(memberPw.value)){
        checkObj.memberPw = true; 
        
        // 비밀번호가 유효하게 작성된 상태에서
        // 비밀번호 확인이 입력되지 않았을 때
        if(memberPwConfirm.value.trim().length == 0){

            pwMessage.innerText = "유효한 비밀번호 형식입니다";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
        
        }else{
            // 비밀번호가 유효하게 작성된 상태에서
            // 비밀번호 확인이 입력되어 있을 때

            // 비밀번호 == 비밀번호 확인  (같을 경우)
            if(memberPw.value == memberPwConfirm.value){
                pwMessage.innerText = "비밀번호가 일치합니다";
                pwMessage.classList.add("confirm");
                pwMessage.classList.remove("error");
                checkObj.memberPwConfirm = true;
                
            } else{ // 다를 경우
                pwMessage.innerText = "비밀번호가 일치하지 않습니다";
                pwMessage.classList.add("error");
                pwMessage.classList.remove("confirm");
                checkObj.memberPwConfirm = false;
            }
        }

        
    } else{ // 유효하지 않은 경우
        
        pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");
        checkObj.memberPw = false; 
    }
});


// 비밀번호 확인 유효성 검사
memberPwConfirm.addEventListener('input', ()=>{

    if(checkObj.memberPw){ // 비밀번호가 유효하게 작성된 경우에

        // 비밀번호 == 비밀번호 확인  (같을 경우)
        if(memberPw.value == memberPwConfirm.value){
            pwMessage.innerText = "비밀번호가 일치합니다";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
            checkObj.memberPwConfirm = true;
            
        } else{ // 다를 경우
            pwMessage.innerText = "비밀번호가 일치하지 않습니다";
            pwMessage.classList.add("error");
            pwMessage.classList.remove("confirm");
            checkObj.memberPwConfirm = false;
        }

    } else { // 비밀번호가 유효하지 않은 경우
        checkObj.memberPwConfirm = false;
    }
});



const withdrawalFrm = document.getElementById("withdrawalFrm");

if(withdrawalFrm != null){ // 탈퇴 페이지인 경우

    const memberPw = document.getElementById("memberPw");
    const agree = document.getElementById("agree");

    secessionFrm.addEventListener("submit", e => {

        if(memberPw.value.trim() == ""){ // 비밀번호 미작성
            alert("비밀번호를 작성해주세요");
            e.preventDefault();
            memberPw.focus();
            return;
        }

        if(!agree.checked){ // 동의 체크가 되지 않은 경우
            alert("약관 동의 후 탈퇴 버튼을 눌러주세요");
            e.preventDefault();
            agree.focus();
            return;
        }

        if(!confirm("정말 탈퇴 하시겠습니까?")){ // 취소 클릭 시
            alert("탈퇴 취소");
            e.preventDefault();
            return;
        }
    });


}

