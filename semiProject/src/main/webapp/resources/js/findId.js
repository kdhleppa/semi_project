// 이름이 일치하는 회원의 아이디 조회
const inputName = document.getElementById("inputName");
const inputPhoneNum = document.getElementById("inputPhoneNum");
const btn1 = document.getElementById("btn1");
const result1 = document.getElementById("result1");

btn1.addEventListener("click", () => {

    const name = inputName.value;
    const phoneNum = inputPhoneNum.value;
    
    fetch(`/selectMemberId?name=${name}&phoneNum=${phoneNum}`)
    .then( resp => resp.text() ) // 응답 객체(자료형 1일때)를 문자열 형식으로 파싱
    .then( data => {
    
    	if (data <= 0) {
    		alert("일치하는 이름과 휴대폰 번호를 입력해주세요")
    	} else {
        // 데이터 가공
        console.log(data);
        
        	alert("회원님의 아이디는 " + data + " 입니다")
        }
    })
    .catch( err => console.log(err) );

});