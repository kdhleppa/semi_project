const loginFrm = document.getElementById("loginFrm");
const memberId = document.querySelector("#loginFrm input[name='memberId']");
const memberPw = document.querySelector("#loginFrm input[name='memberPw']");

// 로그인
if(loginFrm != null){
    loginFrm.addEventListener("submit", e => {

        
        if(memberId.value.trim().length == 0){
            alert("아이디를 입력해주세요.");

            memberId.value = "";
            memberId.focus();

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




