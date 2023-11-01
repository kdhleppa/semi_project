const withdrawalFrm = document.getElementById("withdrawalFrm");

if(withdrawalFrm != null){ // 탈퇴 페이지인 경우

    const memberPw = document.getElementById("memberPw");
    const agree = document.getElementById("agree");

    withdrawalFrm.addEventListener("submit", e => {

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
