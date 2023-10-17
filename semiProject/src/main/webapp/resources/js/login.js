const loginFrm = document.getElementById("loginFrm");
const memberEmail = document.querySelector("#loginFrm input[name='memberEmail']");
const memberPw = document.querySelector("#loginFrm input[name='memberPw']");

// 로그인
if(loginFrm != null){
    loginFrm.addEventListener("submit", e => {

        
        if(memberEmail.value.trim().length == 0){
            alert("이메일을 입력해주세요.");

            memberEmail.value = "";
            memberEmail.focus();

            e.preventDefault();
            return; 
        }


        
        if(memberPw.value.trim().length == 0){
            alert("비밀번호를 입력해주세요.");

            memberPw.value = "";
            memberPw.focus();

            e.preventDefault();
            return; 
        }

    });
    
}




