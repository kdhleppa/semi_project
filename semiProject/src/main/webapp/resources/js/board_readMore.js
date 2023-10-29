// 게시글 수정 버튼 클릭 시
document.getElementById("modifyButton").addEventListener("click", () => {
	
	location.href 
		= location.pathname.replace("board", "board2")
			+ "/update"
			+ location.search
			
		// /board2/2/2006/update?cd=1 (GET)	
	

});


// 게시글 삭제 버튼이 클릭되었을 때

document.getElementById("deleteButton").addEventListener("click", () => {
   
  location.href
    = location.pathname.replace("link", "board2")
		+ "/delete"
		+ location.search
    
//http://localhost:8080/link/boardReadMore/70
    //				   /board2/boardReadMore/70/delete (GET 요청)

});




