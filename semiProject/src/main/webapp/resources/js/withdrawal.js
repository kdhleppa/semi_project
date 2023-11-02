const checkObj = {
	"memberPw" : false
}
// 회원 탈퇴 form태그가 제출 되었을 때
document.getElementById("withdrawalFrm").addEventListener("submit", e=>{

    for(let key in checkObj){

        if(checkObj[key]){
        	alert ("탈퇴 완료되었습니다");
        }
        
    }
    
});