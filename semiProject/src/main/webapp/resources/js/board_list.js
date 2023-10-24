const writing = document.getElementById("writing");


// 글쓰기 버튼 클릭 시
if(writing != null){ // 로그인 여부에 따라 insertBtn이 있는가 없는가에 대한 예외 처리
	
	writing.addEventListener("click", () => {

		location.href = "/board2/insert";
		
	});
	
}